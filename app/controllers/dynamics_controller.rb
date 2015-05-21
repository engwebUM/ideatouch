class DynamicsController < ApplicationController
  before_action :set_dynamic, only: [:show, :edit, :update, :destroy, :addBoard, :addParticipant, :info]
  before_action :require_login

  # GET /dynamics
  # GET /dynamics.json
  def index
    @dynamics = Dynamic.all
    @notificationss =  Notification.where(user_id:current_user.id,estado:false).size
    @participants = Participant.all
  end

  def info 
    @notificationss =  Notification.where(user_id:current_user.id,estado:false).size
    @participants = Participant.all
  end 


  # GET /dynamics/1
  # GET /dynamics/1.json
  def show
    @notificationss =  Notification.where(user_id:current_user.id,estado:false).size
    @participants = Participant.all
  end

  def addBoard
    @board= Board.new
    @notificationss =  Notification.where(user_id:current_user.id,estado:false).size
    @participants = Participant.all
  end


  def addParticipant
    @notificationss =  Notification.where(user_id:current_user.id,estado:false).size
    @participant = Participant.new
    @participants = Participant.all
  end

  # GET /dynamics/new
  def new
    @notificationss =  Notification.where(user_id:current_user.id,estado:false).size
    @dynamic = Dynamic.new    
  end



  # GET /dynamics/1/edit
 


  # POST /dynamics
  # POST /dynamics.json
  def create
    @dynamic = Dynamic.new(dynamic_params)
    respond_to do |format|
      if @dynamic.save
        format.html { redirect_to @dynamic}
        format.json { render :show, status: :created, location: @dynamic }
      else
        format.html { render :new }
        format.json { render json: @dynamic.errors, status: :unprocessable_entity }
      end
    end
      if @dynamic.name==""
        @dynamic.name="undefined"
        @dynamic.save
      end
      if @dynamic.descricao==""
        @dynamic.descricao="undefined"
        @dynamic.save
      end
      if @dynamic.final==nil
        @dynamic.final = DateTime.now + 2.hour
        @dynamic.save
      end
    Board.create :dynamic_id => @dynamic.id , :color=>"boardCinza", :name=> "default"
    Participant.create :dynamic_id => @dynamic.id , :email=>current_user.email
    Notification.create :user_id => current_user.id , :text => "You created dynamic #{@dynamic.name}", :estado => false
  end

  # PATCH/PUT /dynamics/1
  # PATCH/PUT /dynamics/1.json
  def update
    respond_to do |format|
      if @dynamic.update(dynamic_params)
        format.html { redirect_to @dynamic}
        format.json { render :show, status: :ok, location: @dynamic }
      else
        format.html { render :edit }
        format.json { render json: @dynamic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dynamics/1
  # DELETE /dynamics/1.json
  def destroy
    @dynamic.destroy
    respond_to do |format|
      format.html { redirect_to dynamics_url }
      format.json { head :no_content }
    end
    Notification.create :user_id => current_user.id , :text => "You destroyed dynamic #{@dynamic.name}" , :estado => false
  end







  private



    # Use callbacks to share common setup or constraints between actions.
    def set_dynamic
      @dynamic = Dynamic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dynamic_params
      #params.require(:dynamic).permit(:name, :descricao)
       params.require(:dynamic).permit(:name, :descricao, :user_id,:color,:final,:numerodenotas, boards_attributes: [ :name, :descricao ],participants_attributes: [ :email ], notes_attributes: [ :text ])
    end
end
