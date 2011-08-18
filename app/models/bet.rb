class Bet < ActiveRecord::Base
  belongs_to :user
  has_many :choices
  has_one :choice

  after_save :update_users_stats

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

  private

  def update_users_stats
    logger.debug "Check if user just closed the bet then generate stats"

    if(state_was == "OPEN" and closed?)
      logger.debug "Bet is now CLOSED"

       raise "A closed Bet need a choice" if !self.choice

        Bid.where(:choice_id => self.choice.id).each do |bid|
          logger.debug "1 more brouzouf for " + user.name
          user = bid.user
          !user.brouzouf ? user.brouzouf = 0 : user.brouzouf = user.brouzouf + 1
          user.save
        end

    end

  end

end




