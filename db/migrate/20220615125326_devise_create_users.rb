# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, if_not_exists: true do |t|
      ## uuid token
      t.uuid :uuid_token, null: false, default: 'gen_random_uuid()'
      t.uuid :uuid_secure, null: false, default: 'gen_random_uuid()'

      ## name_of_person
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.string :username, null: false, default: ''

      ## fields
      t.integer :gender, default: 0, null: false
      t.integer :honorific, default: 0, null: false
      t.integer :pronoun, default: 0, null: false
      t.date :date_of_birth

      ## Database authenticatable
      t.string :email, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet :current_sign_in_ip
      t.inet :last_sign_in_ip

      ## Confirmable
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at
      t.boolean :suspended, default: false, null: false
      t.string :suspend_reason, default: '', null: false

      ## Password expirable
      t.datetime :password_changed_at

      ## Session limitable
      t.string :unique_session_id

      ## Expirable
      t.datetime :last_activity_at
      t.datetime :expired_at

      ## Paranoid verifiable
      t.string :paranoid_verification_code
      t.integer :paranoid_verification_attempt, default: 0
      t.datetime :paranoid_verified_at

      t.integer :second_factor_attempts_count, default: 0
      t.string :encrypted_otp_secret_key
      t.string :encrypted_otp_secret_key_iv
      t.string :encrypted_otp_secret_key_salt
      t.string :direct_otp
      t.timestamp :direct_otp_sent_at
      t.timestamp :totp_timestamp

      t.timestamps null: false

      ## token index
      t.index :uuid_token, unique: true
      t.index :uuid_secure, unique: true

      ## Discard
      t.datetime :discarded_at, index: true
      t.integer :verification, default: 0, null: false

      ## Time zone
      t.string :time_zone, default: 'UTC', null: false

      ## friendly_id
      t.string :slug
      t.index :slug, unique: true

      ## status
      t.integer :status, null: false, default: 0
    end

    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :confirmation_token, unique: true
    add_index :users, :unlock_token, unique: true
    add_index :users, :password_changed_at
    add_index :users, :last_activity_at
    add_index :users, :expired_at
    add_index :users, :paranoid_verification_code
    add_index :users, :paranoid_verified_at
    add_index :users, :encrypted_otp_secret_key, unique: true

    ## Password archivable
    create_table :old_passwords, if_not_exists: true do |t|
      t.string :encrypted_password, null: false
      t.string :password_archivable_type, null: false
      t.integer :password_archivable_id, null: false
      t.datetime :created_at

      ## Discard
      t.datetime :discarded_at, index: true
    end
    add_index :old_passwords,
              %i[password_archivable_type password_archivable_id],
              name: 'index_password_archivable'
  end
end
