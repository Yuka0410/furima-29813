class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @items = Item.new  #商品新規入力GET
  end

  def create   #商品保存POST
    if @items = Item.save #saveでif文のように保存成功可否を判定
      redirect_to root_path #itemの情報を持っていかない
    else
      render :new #itemの情報を持っていく
    end
  end

  #def show
   # @items = Item.show
  #end
end



private

def item_params           #imageはActiveStorage使用
  params.require(:item).permit(:name, :text, :category, :condition, :payer, :area, :delivery_date, :price).merge(user_id: current_user.id)
end