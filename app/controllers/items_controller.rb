class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  def index
    @items = Item.all
  end

  def new
    @item = Item.new  #商品新規入力GET
  end

  def create   #商品保存POST
    
    @item = Item.new(item_params) #saveでif文のように保存成功可否を判定
    if @item.valid? 
      @item.save
      redirect_to root_path #itemの情報を持っていかない
    else
      render :new #バリデーションに弾かれた時itemの情報を持っていく
    end
  end

  #def show
   # @items = Item.show
  #end
end



private

 def item_params          #mergeメソッドで、入力してもらったparamsと一緒に予め別のテーブルに持っている情報を保存する
  params.require(:item).permit(:name, :text, :category_id, :condition_id, :payer_id, :area_id, :delivery_date_id, :price, :image).merge(user_id: current_user.id)
 end


