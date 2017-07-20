class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.string :email
      t.text :address
      t.integer :zipcode
      t.string :password_digest
      t.integer :role

      t.timestamps
    end
  end
end
