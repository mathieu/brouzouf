class AddBrouzoufToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :brouzouf, :decimal
  end

  def self.down
    remove_column :users, :brouzouf
  end
end
