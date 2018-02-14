$(function() {

  // ログインユーザーが投稿したコメント欄の"▼"をクリックした時の動作
  $('.your-comment-drop-button').on('click',function(){
    $('.your-comment-drop-menu').toggle();
  })

  // ログインユーザーのコメント欄にある"▼"をクリックして出てくる"編集"をクリックした時の動作
  $('.edit-drop-menu').on('click',function(){
    $('#your-comment').hide();
    $('#your-like').hide();
    $('.edit-comment-box').show();
  })

  // 非同期でのログインユーザーのコメント欄にある"▼"をクリックして出てくる"編集"をクリックした時の動作
  $('.follow-comment').on('click','.edit-drop-menu',function(){
    $('#your-comment').hide();
    $('#your-like').hide();
    $('.edit-comment-box').show();
  })

  // ログインユーザーのコメント編集欄にある"キャンセル"をクリックした時の動作
  $('.cancel-button').on('click',function(){
    $('#your-comment').show();
    $('#your-like').show();
    $('.edit-comment-box').hide();
  })

  // 非同期時のログインユーザーのコメント編集欄にある"キャンセル"をクリックした時の動作
  $('.follow-comment').on('click','.cancel-button',function(){
    $('#your-comment').show();
    $('#your-like').show();
    $('.edit-comment-box').hide();
  })

  // ログインユーザーのコメント欄にある"▼"をクリックして出てくる"削除"をクリックした時の動作
  $('#delete-drop-button').on('click',function(){
    $('.comment-delete-modal').toggle();
  })

  // 非同期時のログインユーザーのコメント欄にある"▼"をクリックして出てくる"削除"をクリックした時の動作
  $('.follow-comment').on('click','#delete-drop-js-button',function(){
    $('.comment-delete-modal').toggle();
  })

  // ログインユーザーのコメント削除の確認画面で"キャンセル"をクリックした時の動作
  $('#cancel_delete').on('click',function(){
    $('.comment-delete-modal').toggle();
  })

  // 非同期時のログインユーザーのコメント削除の確認画面で"キャンセル"をクリックした時の動作
  $('.follow-comment').on('click','#cancel_delete',function(){
    $('.comment-delete-modal').toggle();
  })

  $('.recommend-drop-down-button').on('click',function(){
    $('.recommend-drop-menus').toggle();
  })

  // コメント投稿後に再度"Pick"をクリックした時の動作
  $('#update_comment').on('click',function(){
    $('.comment-update-modal').toggle();
  })

  // コメント投稿後に再度"Pick"をクリックして出てくる"キャンセル"をクリックした時の動作
  $('#cancel_update').on('click',function(){
    $('.comment-update-modal').toggle();
  })
});
