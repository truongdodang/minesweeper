class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.string :creator_email, null: false
      t.string :name, null: false
      t.integer :width, null: false
      t.integer :height, null: false
      t.integer :mines_num, null: false

      t.timestamps
    end
  end
end
