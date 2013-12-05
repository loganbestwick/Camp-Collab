class RemoveCityStateZip < ActiveRecord::Migration
  def change
    remove_column :events, :city, :state, :zip
  end
end
