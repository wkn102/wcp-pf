// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery.raty.js

const CLASSNAME = "-visible";
const TIMEOUT = 1500;
const $target = $(".title");

// setInterval(() => {
//   console.log("111");
//   console.log(CLASSNAME);

//   $target.addClass(CLASSNAME);
//     console.log( $target);
//   setTimeout(() => {
//       console.log("222");
//     $target.removeClass(CLASSNAME);
//     // console.log( $target);
//   }, TIMEOUT);
// }, TIMEOUT * 2);

setInterval(() => {
  //$target.addClass(CLASSNAME);
  const p = document.getElementById("aaa");
  p.classList.add(CLASSNAME);

  setTimeout(() => {
    //$target.removeClass(CLASSNAME);
    p.classList.remove(CLASSNAME)
    console.log("222");
  }, TIMEOUT);
}, TIMEOUT * 2);

