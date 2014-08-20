class FixColumnName < ActiveRecord::Migration
  def change

    rename_column :pictures, :title, :picture

  end
end
