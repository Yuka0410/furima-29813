class PurchasesController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new
  end


  def create
    @item = Item.find(params[:item_id])
    @purchase = PurchaseAddress.new(purchase_params) #purchaseは保存できないaddressだ
    if @purchase.valid?
      pay_item
      @purchase.save#formオブジェクトでpurchaseとaddressのsaveメソッドがここに来る
      return redirect_to root_path
    else
      render :index #'このカリキュラムでは"index"だったが、もし表記エラーでたら変えて
    end
  end 
  
  private

  def purchase_params  #purchaseモデルにpriceはないが一つしたのpay_itemでパラメーター送れるからいい
    params.require(:purchase_address).permit(:postal_code, :area_id, :city, :block, :building_name, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)                                                                                                      # .merge(user_id: current_user.id)
  end                                                                                                                                                                      #deciseがあるからこの書き方                                                                                  

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],   
      currency: 'jpy'                 
    )
  end


end



  
