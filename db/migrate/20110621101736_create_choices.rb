class CreateChoices < ActiveRecord::Migration
  def self.up
    create_table :choices do |t|
      t.text :description
      t.references :bet

      t.timestamps
    end
  end

  def self.down
    drop_table :choices
  end
end
