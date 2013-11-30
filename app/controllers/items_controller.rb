class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    p '*' * 60
    p params
  end

  def update
  end

  def destroy
  end
end
