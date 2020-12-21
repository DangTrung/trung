require("packs/admin/vendor/jquery/jquery")
require("packs/select2");
import $ from 'jquery';
console.log("heloo");
window.jQuery = $;
window.$ = $;
(function ($) {
    $(function() {
        $('.multiple').select2();
        $('.multiple1').select2();
    });
})(jQuery)

console.log("heloo")