

class UsersController < Devise::SessionsController
  def create
    super
  end
 
 #user homepage 
 def index
   logger.debug 'User HomePage actions'
 end
 
end