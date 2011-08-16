class RenameWagersToBids < ActiveRecord::Migration
  def self.up
    rename_table :wagers, :bids
  end

  def self.down
    rename_table :bids, :wagers
  end
end
