class DynamicsController < ApplicationController
  before_action :set_dynamic, only: [:show, :edit, :update, :destroy, :addBoard]
  before_action :require_login

  # GET /dynamics
  # GET /dynamics.json
  def index
    @dynamics = Dynamic.all
  end


  # GET /dynamics/1
  # GET /dynamics/1.json
  def show
  end

  def addBoard
    @board= Board.new
  end

  # GET /dynamics/new
  def new
    @dynamic = Dynamic.new
    board = @dynamic.boards.build
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
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dynamic
      @dynamic = Dynamic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dynamic_params
      #params.require(:dynamic).permit(:name, :descricao)
       params.require(:dynamic).permit(:name, :descricao, :user_id, boards_attributes: [ :name, :descricao ])

    end
end
