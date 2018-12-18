import "bootstrap";
import { toggleHiddenOnClick} from '../components/receipt';

 toggleHiddenOnClick();

setTimeout(function() {
    $('.alert-dismissible').fadeOut('fast');
}, 3000); // <-- time in milliseconds
