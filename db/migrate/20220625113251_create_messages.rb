# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages, if_not_exists: true do |t|
      ## uuid token
      t.uuid :uuid_token, null: false, default: 'gen_random_uuid()'
      t.uuid :uuid_secure, null: false, default: 'gen_random_uuid()'

      ## fields
      t.text :content
      t.integer :status, default: 0, null: false

      ## references
      t.integer :sender_id, foreign_key: true, null: false
      t.integer :chat_room_id, foreign_key: true, null: false

      ## parent message
      t.integer :parent_id, foreign_key: true, null: true

      ## is_reply
      t.boolean :is_reply, default: false, null: false

      ## is_forward
      t.boolean :is_forward, default: false, null: false

      ## is_thread
      t.boolean :is_thread, default: false, null: false

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
