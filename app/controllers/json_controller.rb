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

  def location
    if params["term"] == "" || !params["term"]
      respond_with Ausburbs.state("VIC").suburbs.first(5)
    else
      q = params["term"]
      arr = Ausburbs.state("VIC").suburbs.select { |suburb| suburb.name.downcase.start_with?(q.downcase) }.first(3)
      arr += Ausburbs.state("NSW").suburbs.select { |suburb| suburb.name.downcase.start_with?(q.downcase) }.first(3)
      arr += Ausburbs.state("NT").suburbs.select { |suburb| suburb.name.downcase.start_with?(q.downcase) }.first(3)
      arr += Ausburbs.state("QLD").suburbs.select { |suburb| suburb.name.downcase.start_with?(q.downcase) }.first(3)
      arr += Ausburbs.state("SA").suburbs.select { |suburb| suburb.name.downcase.start_with?(q.downcase) }.first(3)
      arr += Ausburbs.state("TAS").suburbs.select { |suburb| suburb.name.downcase.start_with?(q.downcase) }.first(3)
      arr += Ausburbs.state("WA").suburbs.select { |suburb| suburb.name.downcase.start_with?(q.downcase) }.first(3)

      respond_with arr
    end
  end
end
