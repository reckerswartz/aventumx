# frozen_string_literal: true

class CreateRollups < ActiveRecord::Migration[7.0]
  def change
    create_table :rollups, if_not_exists: true do |t|
      t.string :name, null: false
      t.string :interval, null: false
      t.datetime :time, null: false
      t.jsonb :dimensions, null: false, default: {}
      t.float :value
    end
    add_index :rollups, %i[name interval time dimensions], unique: true
  end
end
