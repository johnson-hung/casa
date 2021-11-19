class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :account_name
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :organization
      t.string :email
      t.string :phone
      t.integer :mentor
      t.integer :mentee
      
      t.timestamps
    end
  end
  
  def down
    drop_table :users
  end
end
