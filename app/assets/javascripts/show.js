$(document).on('turbolinks:load', function() {
  $(function() {

    $('.your-comment-drop-button').on('click',function(){
      $('.your-comment-drop-menu').toggle();
    })

    $('#edit-drop-button').on('click',function(){
      $('#your-comment').hide();
      $('#your-like').hide();
      $('.edit-comment-box').show();
    })

    $('.cancel-button').on('click',function(){
      $('#your-comment').show();
      $('#your-like').show();
      $('.edit-comment-box').hide();
    })

    $('.recommend-drop-down-button').on('click',function(){
      $('.recommend-drop-menus').toggle();
    })
  });
})
