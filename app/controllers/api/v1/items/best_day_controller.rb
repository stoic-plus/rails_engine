class Api::V1::Items::BestDayController < ApplicationController
  def index
    best_day = Invoice.best_day_for(params[:id])
    render json: BestDaySerializer.new(BusinessData::BestDay.new(best_day))
  end
end
