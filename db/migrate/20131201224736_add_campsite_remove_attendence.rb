class AddCampsiteRemoveAttendence < ActiveRecord::Migration
  def change
    add_column :events, :camp_site, :string
    remove_column :events, :expected_attendance
  end
end
