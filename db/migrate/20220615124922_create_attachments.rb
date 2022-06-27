# frozen_string_literal: true

class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments, if_not_exists: true do |t|
      ## uuid token
      t.uuid :uuid_token, null: false, default: 'gen_random_uuid()'
      t.uuid :uuid_secure, null: false, default: 'gen_random_uuid()'

      ## fields
      t.string :file_name, default: '', null: false
      t.string :file_type, null: false
      t.integer :status, default: 0, null: false

      ## polymorphic association
      t.references :attachable, polymorphic: true, null: false

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
