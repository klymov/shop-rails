class ItemsController < ApplicationController

  before_action :find_item, only: [:new, :create, :show, :edit, :update, :destroy]

  def index
    @items = Item.all
    @categories = Category.all
  end

  # показ дорогих товаров
  def expensive
    @items = Item.where('price > 100')
  end

  # /items/1 GET
  def show
    #@patient = Patient.find(params[:id])
    unless @item = Item.where(id: params[:id]).first
      render text: 'Page not found',status: 404
    end
  end

  # new -> create
  # /items/new GET
  def new
    @item = Item.new
  end

  # /items POST
  def create
    @item = Item.create(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render 'new'
    end
  end

  # edit -> update
  # /items/1/edit  GET
  def edit
    @item = Item.find(params[:id])
  end

  # /items/1  PUT
  def update
    item_params
    @item.updated_attributes(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end

  # /items/1  DELETE
  def destroy
    @item.destroy
    redirect_to action: :index
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :quantity, :category_id)
  end

  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end

  def render_404
    render file: '/public/404.html', status: 404
  end
end