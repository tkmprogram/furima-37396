window.addEventListener('load',() => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    var value = Math.floor(priceInput.value*0.1);
    addTaxDom.innerHTML = value;
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(priceInput.value-value);
  })
});
