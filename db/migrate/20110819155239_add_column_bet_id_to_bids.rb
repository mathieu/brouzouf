class AddColumnBetIdToBids < ActiveRecord::Migration
  def self.up
    add_column :bids, :bet_id, :integer
    change_column :bids, :value, :decimal, :default => 0

    add_index :bids, :bet_id,   :unique => false

    execute "update bids set value=1"
  end

  def self.down
    remove_column :bids, :bet_id
    change_column :bids, :value, :decimal
  end
end
