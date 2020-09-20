Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'  
  resources :items do   #あとでpurchaseのresourcesネストするか？（スクショ参照）
  end
end
