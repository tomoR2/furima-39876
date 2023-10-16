window.addEventListener('turbo:load', () => {
 const itemPriceInput = document.getElementById("item-price");
 itemPriceInput.addEventListener("input", () => {    
    const inputValue = itemPriceInput.value;          
    const addTaxDom = document.getElementById("add-tax-price");
    const feeValue = Math.floor(inputValue * 0.1);      //販売手数料10%
    addTaxDom.innerHTML = feeValue;                    //手数料
    const profitInput = document.getElementById("profit");
    const profitValue = inputValue - feeValue;         //利益計算
    profitInput.innerHTML = profitValue;               //計算結果
  })
});
