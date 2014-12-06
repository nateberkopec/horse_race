class HomeController < ApplicationController

  def index
    @horse = Horse.new
  end

end
