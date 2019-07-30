class JsonController < ApplicationController
  respond_to :html, :json

  def index
    @Trades = Trade.all
    if params["term"] == "" || !params["term"]
      respond_with @Trades.first(3)
    else
      q = params["term"]
      respond_with @Trades.select { |trade| trade.trade_name.downcase.start_with?(q.downcase) }
    end
  end
end
