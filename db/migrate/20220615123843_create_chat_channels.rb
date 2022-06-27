# frozen_string_literal: true

class CreateChatChannels < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_channels, if_not_exists: true do |t|
      ## uuid token
      t.uuid :uuid_token, null: false, default: 'gen_random_uuid()'
      t.uuid :uuid_secure, null: false, default: 'gen_random_uuid()'

      ## fields
      t.string :first_name, null: false
      t.string :last_name, null: false, default: ''
      t.boolean :is_private, default: false, null: false
      t.boolean :is_group, default: false, null: false
      t.string :username, null: false

      ## references
      t.integer :owner_id, foreign_key: true
      t.integer :sender_id, foreign_key: true

      ## status
      t.integer :status, default: 0, null: false

      ## token index
      t.index :uuid_token, unique: true
      t.index :uuid_secure, unique: true

      ## slug
      t.string :slug, unique: true, null: false

      ## index on slug
      t.index :slug, unique: true

      ## username index
      t.index :username, unique: true, name: 'index_chat_channels_on_username'

      ## Discard
      t.datetime :discarded_at, index: true

      ## timestamp
      t.timestamps
    end
  end
end
