function price() {
  const priceInput = document.getElementById("item-price"); //金額入力
  const add_tax = document.getElementById("add-tax-price"); //販売手数料
  const profit = document.getElementById("profit"); //販売利益
    
  priceInput.addEventListener("keyup", () => {
    const value = priceInput.value;  //入力の金額定義
    
    if (value >= 300 && value <= 9999999) { //300~9999999円の場合の条件分岐
      let fee = Math.floor(value * 0.1) //小数点以下切り捨て
      let gains = value - fee
      add_tax.textContent = fee;
      profit.textContent = gains;
    } else {
      let fee = ""
      let gains = ""
      add_tax.textContent = fee;
      profit.textContent = gains;
    }
  });
}
window.addEventListener('load', price);