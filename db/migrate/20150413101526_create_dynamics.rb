class CreateDynamics < ActiveRecord::Migration
  def change
    create_table :dynamics do |t|
      t.string :name
      t.text :descricao

      t.timestamps null: false
    end
end
