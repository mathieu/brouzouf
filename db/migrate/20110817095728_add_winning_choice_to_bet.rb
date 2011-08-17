class AddWinningChoiceToBet < ActiveRecord::Migration
  def self.up
    add_column :bets, :choice_id, :integer
    add_column :bets, :closed_at, :datetime
  end

  def self.down
    remove_column :bets, :choice_id
    remove_column :bets, :closed_at
  end
end
