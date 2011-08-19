class BetsController < ApplicationController
  

  before_filter :authenticate_user!, :except => [:show, :index]
  
  
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
      redirect_to(user_root_url, :notice => 'Bet was successfully created.')
    else
      render :action => "new"
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

    redirect_to(user_root_url)
  end

  def set_bet_open
    logger.debug "Set the bet's state to OPEN"
    bet = Bet.find(params[:id])
    bet.state = "OPEN"

    if bet.save
      redirect_to(user_root_url, :notice => bet.title + ' was opened.')
    else
      render :action => "edit"
    end

  end

  def set_bet_close
    logger.debug "Set the bet's state to CLOSE"

    bet = Bet.find(params[:id])
    bet.state = "CLOSE"

    if bet.save
      redirect_to(user_root_url, :notice => bet.title + ' was closed.')
    else
      render :action => "edit"
    end
  end

  def set_bet_creation
    logger.debug "Set the bet's state to CREATION"
    bet = Bet.find(params[:id])
    bet.state = "CREATION"

    if bet.save
      redirect_to(user_root_url, :notice => bet.title + ' was in creation mode again.')
    else
      render :action => "edit"
    end
  end


  def make_a_bid
    logger.debug "Current User make a bid"

    choice = Choice.find(params[:choice_id])

    bid = Bid.new()
    bid.user = current_user
    bid.choice = choice
    bid.bet = choice.bet

    if(bid.save)
      redirect_to(bet_url(choice.bet.id), :notice => 'Your bid was successfully saved')
    else
      redirect_to(bet_url(choice.bet.id), :warn => 'Error while saving your bid')
    end

  end


  def close
    logger.debug "Closing bet"
    @bet = Bet.find(params[:id])
  end

  def close_bid
    logger.debug "Closing bet with winning bid"

    bet = Bet.find(params[:id])

    bet.state = 'CLOSED'

    bet.choice_id = :choice_id

    bet.closed_at = Time.now

    #TODO update winnings for users that had a bid on this choice

    if(bet.save)
      redirect_to(user_root_url, :notice => 'Your bet was successfully closed')
    end


  end
  
  
end
