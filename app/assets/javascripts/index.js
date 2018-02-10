$(document).on('turbolinks:load', function() {

  $(function() {
    $('.self').on('click',function(){
      $('.user-menu-container').toggle();
    })

    $('.flag').on('click', function(){
      $('.notification-container').toggle();
    })

    $('#menu_bar_button').on('click', function() {
      $('.menu').toggle();
    });
  });

  $('.slide').slick({
      // autoplay: true,
      // autoplaySpeed: 3000,
      pauseOnHover: true,
      dots: true,
      arrows: true,
      accessibility: true,
    });

});
