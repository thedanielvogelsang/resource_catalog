class ChangeColumnNameSkills < ActiveRecord::Migration[5.1]
  def change
    rename_column :skills, :type, :skill
  end
end
