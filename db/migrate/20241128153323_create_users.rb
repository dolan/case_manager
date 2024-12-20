class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.uuid :uuid
      t.string :email
      t.string :encrypted_password
      t.string :reset_password_token
      t.datetime :reset_sent_at
      t.datetime :remember_created_at
      t.integer :sign_in_count
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
      t.string :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email
      t.bigint :created_by_user_id
      t.bigint :updated_by_user_id

      t.timestamps
    end
    add_index :users, :uuid
    add_index :users, :email
    add_index :users, :created_by_user_id
    add_index :users, :updated_by_user_id
  end
end
