class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item_id, only: [:index, :create, :pay_item]

  def index
    redirect_to root_path if current_user.id == @item.user_id || @item.purchase != nil
    @purchase = PurchaseAddress.new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params) # purchaseは保存できないaddressだ
    if @purchase.valid?
      pay_item
      @purchase.save # formオブジェクトでpurchaseとaddressのsaveメソッドがここに来る
      redirect_to root_path
    else
      render :index # 'このカリキュラムでは"index"だったが、もし表記エラーでたら変えて
    end
  end

  private

  def purchase_params # purchaseモデルにpriceはないが一つしたのpay_itemでパラメーター送れるからいい
    params.require(:purchase_address).permit(:postal_code, :area_id, :city, :block, :building_name, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id) # .merge(user_id: current_user.id)
  end                                                                                                                                                                      # deciseがあるからこの書き方

  def set_item_id
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
