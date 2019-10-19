// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import '../stylesheets/application'
import '../stylesheets/header'
import '../stylesheets/login'

window.onload = (function(){
  $('.menu-trigger').on('click',function(){
    if($(this).hasClass('active')){
      $(this).removeClass('active');
      $('nav').removeClass('open');
      $('.overlay').removeClass('open');
    } else {
      $(this).addClass('active');
      $('nav').addClass('open');
      $('.overlay').addClass('open');
    }
  });
  $('.overlay').on('click',function(){
    if($(this).hasClass('open')){
      $(this).removeClass('open');
      $('.menu-trigger').removeClass('active');
      $('nav').removeClass('open');
    }
  });
});
