class CreateHostTable < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :name, :username, :password

      t.timestamps

    end
  end
end
