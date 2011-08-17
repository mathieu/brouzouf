class Bet < ActiveRecord::Base
  belongs_to :user
  has_many :choices
  has_one :choice

  def expired?
    expiration_date < Time.now
  end

  def open?
    state == 'OPEN'
  end

  def need_to_be_closed?
    expired? && open?
  end

  def editable?
    state == 'CREATION'
  end

  def closed?
    state == 'CLOSED'
  end
end
