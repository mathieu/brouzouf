class UsersController < Devise::SessionsController
  def create
    super
  end

  #user homepage
  def index
    logger.debug 'User HomePage actions'
    @expired_bets = current_user.bets.where("expiration_date < ? AND state = 'OPEN' ", Time.now)
    @open_bets = current_user.bets.where("expiration_date > ? AND state = 'OPEN' ", Time.now)
    @creation_bets = current_user.bets.where("state = 'CREATION' ", Time.now)
    @closed_bets = current_user.bets.where("state = 'CLOSE' ", Time.now)
  end

  def show
    logger.debug 'Public user display'
    @user = User.find(params[:id])
  end

  def list
    @bidders = User.find(:all, :order => "brouzouf desc")
  end

  def expired_bets
    return current_user.bets.where("expiration_date < ? AND state = 'OPEN' ", Time.now)
  end
end