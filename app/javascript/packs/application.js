import "bootstrap";
import Chartkick from "chartkick";
import { initFilter } from '../components/filter'
import { toggleHiddenOnClick} from '../components/receipt';
import { loadDynamicBannerText } from '../components/animated';

window.Chartkick = Chartkick;

toggleHiddenOnClick();
loadDynamicBannerText();
initFilter();

setTimeout(function() {
  $('.alert-dismissible').fadeOut('fast');
}, 3000); // <-- time in milliseconds

