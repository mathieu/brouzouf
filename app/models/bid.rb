class Bid < ActiveRecord::Base
  belongs_to :user
  belongs_to :choice
  belongs_to :bet


  after_save :remove_brouzouf


  private

  def remove_brouzouf
    logger.debug "Remove brouzouf to the user afer bidding"
    self.user.brouzouf = self.user.brouzouf - 1
    self.user.save
  end
end
