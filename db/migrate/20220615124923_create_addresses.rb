# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses, if_not_exists: true do |t|
      ## uuid token
      t.uuid :uuid_token, null: false, default: 'gen_random_uuid()'
      t.uuid :uuid_secure, null: false, default: 'gen_random_uuid()'

      ## fields
      t.string :formatted_address, default: '', null: false
      t.string :house_number, default: '', null: false
      t.string :street_number, default: '', null: false
      t.string :street_name, default: '', null: false
      t.string :street, default: '', null: false
      t.string :city, default: '', null: false
      t.string :zip_code, default: '', null: false
      t.string :department, default: '', null: false
      t.string :department_code, default: '', null: false
      t.string :state, default: '', null: false
      t.string :state_code, default: '', null: false
      t.string :country, default: '', null: false
      t.string :country_code, default: '', null: false
      t.float :lat, default: 0.0, null: false
      t.float :lng, default: 0.0, null: false
      t.boolean :primary, default: false, null: false
      t.boolean :active, default: true, null: false

      ## token index
      t.index :uuid_token, unique: true
      t.index :uuid_secure, unique: true

      ## Discard
      t.datetime :discarded_at, index: true

      ## timestamp
      t.timestamps

      ## status
      t.string :status, null: false, default: 'draft'

      ## polymorphic association
      t.references :addressable, polymorphic: true
    end
  end
end
