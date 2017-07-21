class CreateUserSharables < ActiveRecord::Migration[5.1]
  def change
    create_table :user_sharables do |t|
      t.references :user, foreign_key: true
      t.references :sharable, foreign_key: true

      t.timestamps
    end
  end
end
