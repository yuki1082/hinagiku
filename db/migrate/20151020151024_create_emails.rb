class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
    	t.references :user, null: false
    	t.string :adress
    	t.string :verification_token
    	t.datetime :verified_at
      t.timestamps
    end
    add_index :emails, :adress, unique: true
  end
end
