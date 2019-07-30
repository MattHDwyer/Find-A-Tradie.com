class JsonController < ApplicationController
  respond_to :html, :json

  def index
    @Trades = Trade.all
    if params["term"] == "" || !params["term"]
      respond_with @Trades
    else
      q = params["term"]
      respond_with @Trades.select { |trade| trade.trade_name.downcase.start_with?(q.downcase) }
    end
  end

  def location
    q = params["term"]
    if q.to_i > 0
      arr = Ausburbs.state("VIC").suburbs.select { |suburb| suburb.postcode.to_s.start_with?(q) }.first(3)
      arr.concat Ausburbs.state("NSW").suburbs.select { |suburb| suburb.postcode.to_s.start_with?(q) }.first(3)
      arr.concat Ausburbs.state("NT").suburbs.select { |suburb| suburb.postcode.to_s.start_with?(q) }.first(3)
      arr.concat Ausburbs.state("QLD").suburbs.select { |suburb| suburb.postcode.to_s.start_with?(q) }.first(3)
      arr.concat Ausburbs.state("SA").suburbs.select { |suburb| suburb.postcode.to_s.start_with?(q) }.first(3)
      arr.concat Ausburbs.state("TAS").suburbs.select { |suburb| suburb.postcode.to_s.start_with?(q) }.first(3)
      arr.concat Ausburbs.state("WA").suburbs.select { |suburb| suburb.postcode.to_s.start_with?(q) }.first(3)
      arr.concat Ausburbs.state("ACT").suburbs.select { |suburb| suburb.postcode.to_s.start_with?(q) }.first(3)
    else
      q = q.upcase
      arr = Ausburbs.state("VIC").suburbs.select { |suburb| suburb.name.start_with?(q) }.first(3)
      arr.concat Ausburbs.state("NSW").suburbs.select { |suburb| suburb.name.start_with?(q) }.first(3)
      arr.concat Ausburbs.state("NT").suburbs.select { |suburb| suburb.name.start_with?(q) }.first(3)
      arr.concat Ausburbs.state("QLD").suburbs.select { |suburb| suburb.name.start_with?(q) }.first(3)
      arr.concat Ausburbs.state("SA").suburbs.select { |suburb| suburb.name.start_with?(q) }.first(3)
      arr.concat Ausburbs.state("TAS").suburbs.select { |suburb| suburb.name.start_with?(q) }.first(3)
      arr.concat Ausburbs.state("WA").suburbs.select { |suburb| suburb.name.start_with?(q) }.first(3)
      arr.concat Ausburbs.state("ACT").suburbs.select { |suburb| suburb.name.start_with?(q) }.first(3)
    end
    respond_with arr
  end
end
