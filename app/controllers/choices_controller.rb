class ChoicesController < ApplicationController
  
  before_filter :authenticate_user!, :only => [:add_choice, :create, :update, :destroy, :edit]
  

  # GET /choices/1/edit
  def edit
    @choice = Choice.find(params[:id])
  end

  
  def new
    @bet =Bet.find(params[:bet_id])
    @choice = @bet.choices.build
  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @choice }
    end
  end
  
  
  # POST /choices
  # POST /choices.xml
  def create
    @choice = Choice.new(params[:choice])
    @bet =Bet.find(params[:bet_id])
    @choice.bet = @bet
    
  
    if @choice.save
      redirect_to(@bet, :notice => 'Choice was successfully created.')
    else
      render :action => "new"
    end
    
  end

  # PUT /choices/1
  # PUT /choices/1.xml
  def update
    @choice = Choice.find(params[:id])

    respond_to do |format|
      if @choice.update_attributes(params[:choice])
        format.html { redirect_to(@choice, :notice => 'Choice was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @choice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /choices/1
  # DELETE /choices/1.xml
  def destroy
    @choice = Choice.find(params[:id])
    @choice.destroy

    respond_to do |format|
      format.html { redirect_to(choices_url) }
      format.xml  { head :ok }
    end
  end
end
