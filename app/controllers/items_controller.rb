class ItemsController < ApplicationController

  def index
    @items = Item.all
  end
  def new
    @items = Item.all
    @item = Item.new
    @item.item_images.build
    @item.build_brand
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end


  def get_category_children
    @category_children = Category.find_by(id: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
   @item = Item.new(item_params)
   if @item.save
    redirect_to root_path
   else
    render :new
   end
  end

  private
  def item_params
   params.require(:item).permit(:name,:description,:price,:brand,:size_id,:condition_id,:delivery_charge_id,:delivery_way_id,:delivery_date_id	, :category_id, item_images_attributes: [:image,:id],brand_attributes: [:id, :name]).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end

  

end
