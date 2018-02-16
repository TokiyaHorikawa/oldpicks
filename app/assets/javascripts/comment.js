$(function(){

  function buildHTML(comment) {

  // フォームにデータを送る際に作成されるトークンの定義
    var name = $('meta[name="csrf-token"]');

  // フォームのデータ送信時にログインユーザーのコメント表示部分に差し込むhtml
    var html =  '<div class = "section-header">' +
                  'フォローしているユーザーのコメント' +
                '</div>' +
                '<div class="comment-container">' +
                  '<div class="comment-row-no-border">' +
                    '<div class="user-bar">' +
                      '<div class="user-cover">' +
                        '<img class="user-icon" src="' + comment.avatar_image + '">' +
                      '</div>' +
                      '<div class="user-profile">' +
                        '<div class="user-name">' +
                          comment.name +
                        '</div>' +
                        '<div class="follower-only">' +
                          '<img class="follower-only-icon" src="/assets/follower-only.png" alt="Follower only">' +
                          '<div class="follower-only-text">' +
                            'フォロワーのみ' +
                          '</div>' +
                        '</div>' +
                        '<div class="user-job">' +
                          comment.company +
                          comment.position +
                        '</div>' +
                        '<div class="pick-time">' +
                          comment.time +
                        '</div>' +
                      '</div>' +
                      '<div class="dropdown">' +
                        '<button aria-expanded="false" aria-haspopup="true" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" id="dropdownMenuButton" type="button">' +
                          '▼' +
                        '</button>' +
                        '<div aria-labelledby="dropdownMenuButton" class="dropdown-menu">' +
                          '<a class="dropdown-item">' +
                            '<div class="edit-drop-menu" id="edit-drop-button">' +
                              '編集' +
                            '</div>' +
                          '</a>' +
                          '<a class="dropdown-item">' +
                            '<div class="delete-drop-menu" id="delete-drop-js-button" >' +
                              '削除' +
                            '</div>' +
                          '</a>' +
                        '</div>' +
                      '</div>' +
                      '<div class="comment-delete-modal">' +
                        '<div class="background">' +
                          '<div class="modal-content-wrapper">' +
                            '<div class="message-box">' +
                              '<div class="labels">' +
                                '<div class="alert-title">' +
                                  'Pickを削除してもよろしいですか？' +
                                '</div>' +
                                '<div class="alert-message">' +
                                  'Pickを削除すると元に戻すことは出来ません。' +
                                '</div>' +
                                '<div class="alert-buttons">' +
                                  '<div class="negative-button" id="cancel_delete">' +
                                    'キャンセル' +
                                  '</div>' +
                                  '<a class="delete-button" rel="nofollow" data-method="delete" href="/comments/' + comment.id + '">' +
                                    'Pickを削除する' +
                                  '</a>' +
                                '</div>' +
                              '</div>' +
                            '</div>' +
                          '</div>' +
                        '</div>' +
                      '</div>' +
                    '</div>' +
                    '<div class="comment-box">' +
                      '<div class="comment" id="your-comment">' +
                        comment.content +
                      '</div>' +
                      '<div class="edit-comment-box">' +
                        '<form class="edit_comment" id="edit_comment_' + comment.id + '" action="/comments/' + comment.id + '" accept-charset="UTF-8" method="post">' +
                          '<input name="utf8" type="hidden" value="✓">' +
                          '<input type="hidden" name="_method" value="patch">' +
                          '<input type="hidden" name="authenticity_token" value="' + name.attr("content") + '">' +
                          '<textarea class="your-comment-form" name="comment[content]" id="comment_content">' +
                            comment.content +
                          '</textarea>' +
                          '<div class="pick-control">' +
                            '<div class="description">' +
                              'シェアする' +
                            '</div>' +
                            '<div class="sns-twitter">' +
                              '<img class="twitter-mark" src="/assets/twitter-gray.png" alt="Twitter gray">' +
                            '</div>' +
                            '<div class="sns-facebook">' +
                              '<img class="facebook-mark" src="/assets/facebook-gray.png" alt="Facebook gray">' +
                            '</div>' +
                            '<input type="submit" name="commit" value="Pick" class="pick-button" data-disable-with="Pick">' +
                            '<div class="cancel-button">' +
                              'キャンセル' +
                            '</div>' +
                          '</div>' +
                        '</form>' +
                      '</div>' +
                      '<div class="like-panel" id="your-like">' +
                        '<img class="like-icon" src="/assets/like-gray.png" alt="Like gray">' +
                        '<div class="like-count-box">' +
                        '<div class="like-count">' +
                          '0' +
                        '</div>' +
                      '</div>' +
                      '<div class="like-label">' +
                        'Likes' +
                      '</div>' +
                    '</div>' +
                  '</div>' +
                '</div>';
    return html;
  }

  $('#comment_form').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var href = window.location.href + '/comments';
    $.ajax({
      url: href,
      type: "POST",
      dataType: 'json',
      data: formData,
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.follow-comment').append(html);
      $('.comment-form-area').val("");
    })
    return false;
  });
});
