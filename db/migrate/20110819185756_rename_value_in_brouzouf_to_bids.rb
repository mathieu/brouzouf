class RenameValueInBrouzoufToBids < ActiveRecord::Migration
  def self.up
    rename_column :bids, :value, :brouzouf    
  end

  def self.down
    rename_column :bids, :brouzouf, :value
  end
end

