class CreateSharables < ActiveRecord::Migration[5.1]
  def change
    create_table :sharables do |t|
      t.text :sharable

      t.timestamps
    end
  end
end
