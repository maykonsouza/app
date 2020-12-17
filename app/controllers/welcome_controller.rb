class WelcomeController < ApplicationController

  before_action :authenticate_user!
  def index

    address = "www.facebook.com.br"
    rtts = [10,24,75,12,27]
    for i in 1..5
      result = `ping -c 3 #{address} | tail -1| awk '{print $4}' | cut -d '/' -f 2`.to_i
      rtts.push(result)
    end
    @latence2 = rtts.sum/rtts.length

    if @latence2 < 30
      indicator = ["success", "Ótima!"]
    elsif @latence2 > 30 and @latence2 < 100
        indicator = ["primary", "Boa"]
    else
      indicator = ["danger","Ruim!"]
    end

    @data2 = [{1 => rtts[0], 2 => rtts[1], 3 => rtts[2], 4 => rtts[3], 5 => rtts[4]}, address, @latence2, indicator ]




  end
end
