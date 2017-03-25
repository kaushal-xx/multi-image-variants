class AddColumnEnableToShop < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :enable, :boolean, default: true
  end
end
