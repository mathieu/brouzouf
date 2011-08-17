class HomeController < ApplicationController
  def index
    @bets = Bet.all
  end

end
