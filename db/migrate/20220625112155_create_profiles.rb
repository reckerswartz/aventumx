# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles, if_not_exists: true do |t|
      ## uuid token
      t.uuid :uuid_token, null: false, default: 'gen_random_uuid()'
      t.uuid :uuid_secure, null: false, default: 'gen_random_uuid()'

      ## fields
      t.string :public_email
      t.string :public_birthday
      t.string :occupation
      t.integer :relationship_status, default: 0, null: false
      t.string :public_birthplace
      t.string :personal_website
      t.string :first_name
      t.string :last_name

      ## status
      t.integer :status, default: 0, null: false

      ## references
      t.references :user, foreign_key: true, null: false

      ## token index
      t.index :uuid_token, unique: true
      t.index :uuid_secure, unique: true

      ## Discard
      t.datetime :discarded_at, index: true

      ## timestamp
      t.timestamps
    end
  end
end
