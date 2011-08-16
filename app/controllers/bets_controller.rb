class BetsController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:new, :create, :update, :destroy, :edit]
  
  
  # GET /bets
  def index
    @bets = Bet.all
  end

  # GET /bets/1
  def show
    @bet = Bet.find(params[:id])
  end

  # GET /bets/new
  def new
    @bet = Bet.new
  end

  # GET /bets/1/edit
  def edit
    @bet = Bet.find(params[:id])
    
    if(@bet.user != current_user)
      redirect_to( "/users", :alert => "You don't have rigth to modify this bet.")
    end  
      
  end

  # POST /bets
  def create
    @bet = Bet.new(params[:bet])
    # associate connected user with newly created bet
    @bet.user = current_user

    if @bet.save
      format.html { redirect_to(@bet, :notice => 'Bet was successfully created.') }
    else
      format.html { render :action => "new" }
    end
  end

  # PUT /bets/1
  def update
    @bet = Bet.find(params[:id])

      if @bet.update_attributes(params[:bet])
        redirect_to(user_root_url, :notice => 'Bet was successfully updated.')
      else
        render :action => "edit"
      end
  end

  # DELETE /bets/1
  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy

    redirect_to(bets_url)
  end
  
  
end
