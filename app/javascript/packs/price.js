function sellingPrice() {
       
const priceInput = document.getElementById("item-price")
const taxPrice = document.getElementById("add-tax-price")
const saleProfit = document.getElementById("profit")

  priceInput.addEventListener('input', function(){ 
    let value = priceInput.value 
  taxPriceResult = value*0.1; //落ち着いたら整数にするように検索
  taxPrice.innerHTML = taxPriceResult
  
  saleProfitResult = value*0.9;
  saleProfit.innerHTML = saleProfitResult 
 })
    
}
window.addEventListener('load', sellingPrice)
