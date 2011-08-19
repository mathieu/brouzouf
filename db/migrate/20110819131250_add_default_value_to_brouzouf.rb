class AddDefaultValueToBrouzouf < ActiveRecord::Migration
  def self.up
    change_column :users, :brouzouf, :decimal, :default => 100.00
    execute "update users set brouzouf=100.00"
  end

  def self.down
    change_column :users, :brouzouf, :decimal
  end

end
