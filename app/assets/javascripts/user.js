$(document).on('turbolinks:load', function() {

  $(function() {
// 削除するボタンを押すとhiden解除
    $('.unregister-link-enabled').on('click', function() {
      $('.user-modal').show();
      return false;
    });
 // キャンセルを押すとhidden
    $('.negative-button').on('click', function() {
      $('.user-modal').hide();
      return false;
    });
  });
});