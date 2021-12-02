class CreateMyAccounts < ActiveRecord::Migration
  def change
    create_table :my_accounts do |t|

      t.timestamps null: false
    end
  end
end
