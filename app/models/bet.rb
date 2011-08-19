class Bet < ActiveRecord::Base
  belongs_to :user
  has_many :choices
  has_one :choice

  after_save :add_brouzouf

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


  def ratio_for_this_choice(id_choice)
     return  loosing_brouzouf(id_choice) / winning_brouzouf(id_choice)
  end


  # summ brouzouf bids in other choices
  def loosing_brouzouf(id_choice)
    logger.debug "B ************************"
    #result = Bid.sum(:value, :conditions => "bet_id =" + self.id.to_s + " and choice_id != " + id_choice.to_s)
    result = Bid.sum(:value, :conditions => ['bet_id ==' + self.id.to_s])
    logger.debug "E ************************"

    return result
  end

  def winning_brouzouf(id_choice)
    Bid.where("bet_id = ? and choice_id = ?", self.id, id_choice).sum(:value)
  end


  #TODO put in database
  def total_brouzouf
     Bid.where(:bet_id => this.id).sum(:value)
  end

  private

  def add_brouzouf
    logger.debug "Check if user just closed the bet then add brouzouf"

    if (state_was == "OPEN" and closed?)
      logger.debug "Bet is now CLOSED"

      raise "A closed Bet need a choice" if !self.choice


      Bid.where(:choice_id => self.choice.id).each do |bid|
        logger.debug "1 more brouzouf for " + user.name
        user = bid.user
        user.brouzouf = user.brouzouf + bid.value * (1 + ratio_for_this_choice(self.choice.id))
        user.save
      end

    end

  end


end




