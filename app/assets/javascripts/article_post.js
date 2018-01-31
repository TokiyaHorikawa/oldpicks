$(function() {
  $('#pick_button').on('click', function() {
    $('.modal').show();
    console.log('a')
    return false;
  });

  $('.close-btn').on('click', function() {
    $('.modal').hide();
    return false;
  });
});
