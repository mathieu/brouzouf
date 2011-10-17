class UsersController < Devise::SessionsController

  def create
    super
  end

  #user homepage
  def index
    logger.debug 'User HomePage actions'
    @user = current_user
  end

  def show
    logger.debug 'Public user display'
    @user = User.find(params[:id])
  end

  def list
    @bidders = User.find(:all, :order => "brouzouf desc")
  end

end