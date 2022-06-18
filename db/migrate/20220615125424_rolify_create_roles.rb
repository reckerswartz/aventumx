# frozen_string_literal: true

class RolifyCreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table(:roles, if_not_exists: true) do |t|
      t.string :name
      t.references :resource, polymorphic: true

      t.timestamps

      ## friendly_id
      t.string :slug
      t.index :slug, unique: true

      ## status
      t.integer :status, null: false, default: 0

      ## Discard
      t.datetime :discarded_at, index: true
    end

    create_table(:users_roles, id: false, if_not_exists: true) do |t|
      t.references :user
      t.references :role

      t.timestamps
    end

    add_index(:roles, %i[name resource_type resource_id])
    add_index(:users_roles, %i[user_id role_id])
  end
end
