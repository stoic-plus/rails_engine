class Api::V1::Items::MostItemsController < ApplicationController
  def index
    items = Item.top_items_by_quantity_sold(params[:quantity])
    render json: ItemSerializer.new(items)
  end
end
