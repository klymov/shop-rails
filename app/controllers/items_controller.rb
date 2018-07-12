class ItemsController < ApplicationController

  before_action :find_item, only: [:show, :edit, :update, :destroy]
  #before_filter :check_if_admin, only: [:edit, :update, :new, :create, :destroy]

  def index
    @items = Item.all
    @categories = Category.all

    if params[:category_id]
      @items = Item.where(category_id: params[:category_id])
    elsif params[:search]
      @items = @items.where("description like :q or name like :q", :q => "%#{params[:search]}%")
    end


=begin
    @products = Product.all

    search = params[:search]
    @products = @products.where("title ILIKE '%?%'", search) if search

    from_price = params[:from_price]
    @products = @products.where('price > ?', from_price) if from_price

    to_price = params[:to_price]
    @products = @products.where('price < ?', to_price) if to_price

    property_ids = params[:properties]
    if properties
      @products = @products.joins(:product_properties)
                      .where(property_id: property_ids)
    end

    category_id = params[:category_id]
    @products = @products.where(category_id: category_id) if category_id

    sort_direction = params[:sort_direction].to_sym || :desc
    sort_type = params[:sort_type].to_sym || :price
    page_number = params[:page] || 0
    @products = @products.order(sort_type => sort_direction).page(page_number)
=end
  end

  # показ дорогих товаров
  def expensive
    @items = Item.where('price > 100')
  end

  # /items/1 GET
  def show
    #@patient = Patient.find(params[:id])
    unless @item = Item.where(id: params[:id]).first
      render text: 'Page not found', status: 404
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
    @item.update_attributes(item_params)
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
    params.require(:item).permit(:name, :category_id, :description, :price, :quantity, {images: []}, {remove_images: []})
  end

  def find_item
    @item = Item.where(id: params[:id]).first
    render_404 unless @item
  end

  def render_404
    render file: '/public/404.html', status: 404
  end
end