class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
    	t.references :user, null: false
    	t.string :address
    	t.string :verification_token
    	t.datetime :verified_at
      t.timestamps
    end
    add_index :emails, :address, unique: true
  end
end
