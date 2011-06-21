class Choice < ActiveRecord::Base
  belongs_to :bet
  has_many :wagers
end
