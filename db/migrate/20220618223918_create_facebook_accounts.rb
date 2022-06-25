# frozen_string_literal: true

class CreateFacebookAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :facebook_accounts, if_not_exists: true do |t|
      ## uuid token
      t.uuid :uuid_token, null: false, default: 'gen_random_uuid()'
      t.uuid :uuid_secure, null: false, default: 'gen_random_uuid()'

      ## fields

      ## reference
      t.references :user, null: false, foreign_key: true
      t.string :uid

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
