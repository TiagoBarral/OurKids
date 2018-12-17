function toggleHiddenOnClick() {
  const receipt = document.querySelector ('#myReceipt')
  let receipt_hidden = document.querySelector ('.receipt-preview')
  if (receipt) {
    receipt.addEventListener('click', (event) => {
      receipt_hidden.classList.remove('hidden')
      console.log(event.currentTarget);
    })
    receipt_hidden.addEventListener('click', (event) => {
      receipt_hidden = document.querySelector ('.receipt-preview')
      receipt_hidden.classList.add('hidden')
      console.log(event.currentTarget);
    })
  }
}
export { toggleHiddenOnClick };




