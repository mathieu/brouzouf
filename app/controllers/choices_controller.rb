class ChoicesController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:new, :create, :update, :destroy, :edit]
  

  # GET /choices/1/edit
  def edit
    @bet =Bet.find(params[:bet_id])
    @choice = Choice.find(params[:id])
  end

  
  def new
    @bet =Bet.find(params[:bet_id])
    @choice = @bet.choices.build  
  end
  
  
  # POST /choices
  def create
    @choice = Choice.new(params[:choice])
    @bet =Bet.find(params[:bet_id])
    @choice.bet = @bet
    
    if @choice.save
      if (params[:continue]=='true')
        redirect_to(new_bet_choice_url(@bet), :notice => 'Choice was successfully created, please add another one.')
      else
        redirect_to(edit_bet_path(@bet), :notice => 'Choice was successfully created.')
      end
    else
      render :action => "new"
    end
    
  end

  # PUT /choices/1
  def update
    @choice = Choice.find(params[:id])
    
    if @choice.update_attributes(params[:choice])
      redirect_to(edit_bet_path(params[:bet_id]), :notice => 'Choice was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /choices/1
  def destroy
    @choice = Choice.find(params[:id])
    @choice.destroy
    redirect_to(choices_url)
  end



end
