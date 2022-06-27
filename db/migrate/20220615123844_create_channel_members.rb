# frozen_string_literal: true

class CreateChannelMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :channel_members, if_not_exists: true do |t|
      ## uuid token
      t.uuid :uuid_token, null: false, default: 'gen_random_uuid()'
      t.uuid :uuid_secure, null: false, default: 'gen_random_uuid()'

      ## status
      t.integer :status, default: 0, null: false

      ## references
      t.integer :chat_channel_id, foreign_key: true, null: false
      t.integer :member_id, foreign_key: true, null: false

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
