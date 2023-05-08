# frozen_string_literal: true

class CreateMineCells < ActiveRecord::Migration[7.0]
  def change
    create_table :mine_cells do |t|
      t.references :board, null: false, foreign_key: true
      t.integer :x, null: false
      t.integer :y, null: false

      t.timestamps
    end
  end
end
