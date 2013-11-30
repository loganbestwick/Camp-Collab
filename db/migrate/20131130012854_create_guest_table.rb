class CreateGuestTable < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :name, :token, :email, :phone
      t.timestamps
      t.belongs_to :event
    end
  end
end
