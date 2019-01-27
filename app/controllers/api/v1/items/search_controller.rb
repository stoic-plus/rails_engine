class Api::V1::Items::SearchController < ApplicationController
  def index
    items = Item.where(item_params)
    render_error if items.empty?
    render json: ItemSerializer.new(items) unless items.empty?
  end

  def show
    item = Item.find_by(item_params)
    render_error unless item
    render json: ItemSerializer.new(item) if item
  end

  private

  def item_params
    params.permit(:id, :name, :description, :unit_price, :created_at, :updated_at)
  end

  def render_error
    render json: ApiErrorSerializer.new(BusinessData::ApiError.new("No records found with those params", DateTime.now))
  end
end
