class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.text :type

      t.timestamps
    end
  end
end
