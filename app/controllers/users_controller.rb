

class UsersController < Devise::SessionsController
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
 
 
end