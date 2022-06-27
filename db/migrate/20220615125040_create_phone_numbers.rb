# frozen_string_literal: true

class CreatePhoneNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :phone_numbers, if_not_exists: true do |t|
      ## uuid token
      t.uuid :uuid_token, null: false, default: 'gen_random_uuid()'
      t.uuid :uuid_secure, null: false, default: 'gen_random_uuid()'

      ## fields
      t.string :number, default: '', null: false
      t.string :country_code, default: '', null: false
      t.string :national_dialing_prefix, default: '', null: false
      t.string :char_3_code, default: '', null: false
      t.string :name, default: '', null: false
      t.string :international_dialing_prefix, default: '', null: false
      t.string :area_code, default: '', null: false
      t.string :extension, default: '', null: false
      t.string :full_international, default: '', null: false
      t.boolean :primary, default: false, null: false
      t.boolean :verified, default: false, null: false
      t.boolean :active, default: true, null: false

      ## token index
      t.index :uuid_token, unique: true
      t.index :uuid_secure, unique: true

      ## Discard
      t.datetime :discarded_at, index: true

      ## timestamp
      t.timestamps

      ## status
      t.integer :status, null: false, default: 0

      ## polymorphic association
      t.references :phoneable, polymorphic: true
    end
  end
end
