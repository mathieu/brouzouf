class UsersController < Devise::SessionsController


  helper_method :expired_bets, :open_bets, :draft_bets, :closed_bets
  def create
    super
  end

  #user homepage
  def index
    logger.debug 'User HomePage actions'
  end

  def show
    logger.debug 'Public user display'
    @user = User.find(params[:id])
  end

  def list
    @bidders = User.find(:all, :order => "brouzouf desc")
  end

  def expired_bets
    @bets.where("expiration_date < ? AND state = 'OPEN' ", Time.now)
  end

  def open_bets
    @bets.where("expiration_date > ? AND state = 'OPEN' ", Time.now)
  end

  def draft_bets
    @bets.where("state = 'CREATION' ", Time.now)
  end

  def closed_bets
    @bets.where("state = 'CLOSE' ", Time.now)
  end
end