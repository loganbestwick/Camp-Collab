class RemoveUsernameAttribute < ActiveRecord::Migration
  def change
    remove_column :hosts, :username
  end
end
