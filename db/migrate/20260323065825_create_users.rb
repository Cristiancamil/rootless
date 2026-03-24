class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.boolean :is_confirmed?, default: false
      t.integer :role
      t.integer :status

      t.timestamps
    end
  end
end
