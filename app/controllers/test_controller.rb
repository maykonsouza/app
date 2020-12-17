class TestController < ApplicationController
  def index
    @host = Host.all


    
  end
end
