class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :password_salt
      t.string :password_hash
      t.string :persistence_token
      t.string :perishable_token
      t.string :single_access_token
      t.datetime :last_request_at

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
