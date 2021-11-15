class ChangeTypeName < ActiveRecord::Migration[6.0]
  def change
    rename_column :cars, :type, :category
  end
end
