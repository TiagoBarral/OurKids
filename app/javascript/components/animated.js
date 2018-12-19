import Typed from 'typed.js';

function loadDynamicBannerText() {
  const target = document.getElementById('banner-typed-text');

  if (target) {
    new Typed(target, {
      strings: ["For easier and smoother,", "co-parenting."],
      typeSpeed: 50,
      loop: true
    });
  }
};

export { loadDynamicBannerText };
