class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @folder = @item.folder
    @schema = @folder.schema
    @fields = @schema.fields
  end
end
