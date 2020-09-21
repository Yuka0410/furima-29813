class ItemsController < ApplicationController
  def index
    @items = Item.all #itemの機能全て見える（あとで変更するかも
  end

#以下まだ実装必要なし

  #def new
   # @items = Item.new  #商品新規入力GET
  #end

  #def create   #商品保存POST
   # if @items = Item.save #saveでif文のように保存成功可否を判定
    # redirect_to root_path
    #else
    #  render :new
    #end
  #end

  #def show
   # @items = Item.show
  #end
end



 private
