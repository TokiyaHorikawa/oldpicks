$(function(){

  function buildHTML(comment) {
    var html = `<div class = "section-header">
                  フォローしているユーザーのコメント
                </div>
                <div class="comment-container">
                  <div class="comment-row-no-border">
                    <div class="user-bar">
                      <div class="user-cover">
                        <img class="user-icon" src="/assets/${comment.image}">
                      </div>
                      <div class="user-profile">
                        <div class="user-name">
                          ${comment.name}
                        </div>
                        <div class="follower-only">
                          <img class="follower-only-icon" src="/assets/follower-only-19cf0037d2930e3a5b4d47da299dd15c1e9019057240cc3563236644a9c2955e.png" alt="Follower only">
                          <div class="follower-only-text">
                            フォロワーのみ
                          </div>
                        </div>
                        <div class="user-job">
                          ${comment.company}
                          ${comment.position}
                        </div>
                        <div class="pick-time">
                          ${comment.time}
                        </div>
                      </div>
                      <div class="dropdown">
                        <button aria-expanded="false" aria-haspopup="true" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" id="dropdownMenuButton" type="button">
                          ▼
                        </button>
                        <div aria-labelledby="dropdownMenuButton" class="dropdown-menu">
                          <a class="dropdown-item">
                            <div class="edit-drop-menu" id="edit-drop-button">
                              編集
                            </div>
                          </a>
                          <a class="dropdown-item">
                            <div class="delete-drop-menu" id="delete-drop-button" >
                              削除
                            </div>
                          </a>
                        </div>
                      </div>
                      <div class="comment-delete-modal">
                        <div class="background">
                          <div class="modal-content-wrapper">
                            <div class="message-box">
                              <div class="labels">
                                <div class="alert-title">
                                  Pickを削除してもよろしいですか？
                                </div>
                                <div class="alert-message">
                                  Pickを削除すると元に戻すことは出来ません。
                                </div>
                                <div class="alert-buttons">
                                  <div class="negative-button" id="cancel_delete">
                                    キャンセル
                                  </div>
                                  <a class="delete-button" rel="nofollow" data-method="delete" href="/comments/${comment.id}">
                                    Pickを削除する
                                  </a>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="comment-box">
                      <div class="comment" id="your-comment">
                        ${comment.content}
                      </div>
                      <div class="edit-comment-box">
                        <form class="edit_comment" id="edit_comment_${comment.id}" action="/comments/${comment.id}" accept-charset="UTF-8" method="post">
                          <input name="utf8" type="hidden" value="✓">
                          <input type="hidden" name="_method" value="patch">
                          <input type="hidden" name="authenticity_token" value="cauV8/oogC0gNTJPCj3ZggXDG2j4B9ck7V5cHYvBdNP14Ourr+C8b8bqTs2UXxJN40Z497YqPuMB0go7uUzemg==">
                          <textarea class="your-comment-form" name="comment[content]" id="comment_content">
                            ${comment.content}
                          </textarea>
                          <div class="pick-control">
                            <div class="description">
                              シェアする
                            </div>
                            <div class="sns-twitter">
                              <img class="twitter-mark" src="/assets/twitter-gray-c7cebd873d4771c8442ec644380f577b8ac09a594e4a92f4e18535f469c7599d.png" alt="Twitter gray">
                            </div>
                            <div class="sns-facebook">
                              <img class="facebook-mark" src="/assets/facebook-gray-2b75406167b8fb8857eddda4f40d4b97fd8a19931c9ee8469a7c5541939a55e6.png" alt="Facebook gray">
                            </div>
                            <input type="submit" name="commit" value="Pick" class="pick-button" data-disable-with="Pick">
                            <div class="cancel-button">
                              キャンセル
                            </div>
                          </div>
                        </form>
                      </div>
                      <div class="like-panel" id="your-like">
                        <img class="like-icon" src="/assets/like-gray-dc70bbc9521df64bd3a62275608a9210d7dd3a7167918dd5a2540fa86c873859.png" alt="Like gray">
                        <div class="like-count-box">
                        <div class="like-count">
                          0
                        </div>
                      </div>
                      <div class="like-label">
                        Likes
                      </div>
                    </div>
                  </div>
                </div>`
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
  });
});
