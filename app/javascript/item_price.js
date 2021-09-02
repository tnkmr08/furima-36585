window.addEventListener('load', () => {
  const itemPrice = document.getElementById("item-price");
  const itemTax = document.getElementById('add-tax-price');
  const itemProfit = document.getElementById('profit');

  itemPrice.addEventListener('input', () => {
    const inputValue = itemPrice.value;
    itemTax.innerHTML = Math.floor(inputValue * 0.1);
    itemProfit.innerHTML = Math.floor(inputValue - itemTax.innerHTML)

  })

  


});