class CreateHostTable < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :name, :username, :password, :email, :phone
      t.timestamps
    end
  end
end
