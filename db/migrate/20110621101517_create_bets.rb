class CreateBets < ActiveRecord::Migration
  def self.up
    create_table :bets do |t|
      t.string :title
      t.text :description
      t.datetime :expiration_date
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :bets
  end
end
