

class UsersController < Devise::SessionsController
  def create
    super
  end
 
 #user homepage 
 def index
   logger.debug 'User HomePage actions'
    @expired_bets_count = current_user.bets.where("expiration_date < ? AND state = 'OPEN' ", Time.now).count
 end
 
  def show
    logger.debug 'Public user display'
    @user = User.find(params[:id])
  end

  def list
    @bidders = User.find(:all, :order => "brouzouf")
  end
 
end