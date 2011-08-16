class AddStateToBets < ActiveRecord::Migration
  def self.up
    add_column :bets, :state, :string, :default => "CREATION"
  end

  def self.down
    remove_column :bets, :state
  end
end
