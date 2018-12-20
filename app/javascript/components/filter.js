
const initFilter = function() {
  const filter = document.getElementById('post_category');

  if (filter) {
    const categories = ['Education', 'Health', 'Fun', 'Vacation', 'Food', 'Sport', 'Clothes', 'Others'];

    filter.addEventListener('change', (event) => {
      const expenses = document.querySelectorAll('.expense');
      expenses.forEach((div) => {
        div.classList.add('hide-expenses');
      });
      if (event.target.value === '') {
          expenses.forEach((div) => {
            div.classList.remove('hide-expenses');
          });
        };
        categories.forEach((category) => {
          if (event.target.value === category) {
          // console.log(document.getElementsByClassName(category));
          const cat = document.getElementsByClassName(category);
          Array.prototype.forEach.call(cat, (el) => {
            el.classList.remove('hide-expenses');
          });
        };

      });
      });
  }
};

export { initFilter };


