$(document).on('turbolinks:load', function() {
  $(function() {
    $('.popular-drop-down-button').on('click',function(){
      $('.popular-drop-menus').toggle();
    })

    $('.recommend-drop-down-button').on('click',function(){
      $('.recommend-drop-menus').toggle();
    })
  });
})

