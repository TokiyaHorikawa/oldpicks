$(document).on('turbolinks:load', function() {

  $(function() {

    function buildPageinfo(page) {
      // 記事概要HTML生成
      var html = `<div class="pageinfo">
                    <div class="page-thumbnail" style="background-image: url(${ page.image }); background-size: contain; height: 120px; width: 120px;"></div>
                    <div class="texts">
                      <div class="title_ellipsised" style="overflow: initial;">
                      <span>${ page.title }</span>
                      </div>
                      <div class="summary_ellipsised" title="${ page.title }" style="overflow: initial;">
                        <span>${ page.description }</span>
                      </div>
                    </div>
                  </div>`
          return html;
    }

    // Pickボタンを押すとhiden解除
    $('#pick_button').on('click', function() {
      $('.modal').show();
      return false;
    });
    // バツボタンを押すとhiden
    $('.close-btn').on('click', function() {
      $('.modal').hide();
      return false;
    });

    $('#url-pick-box').keyup(function() {
      if($(this).val() == "") {
        $('.urlpick-dialog-content').empty();
      }
    });

    // keyupでコメント入力欄表示
    $("#url-pick-box").on('keyup', function() {
      $('.cover-controls').show();
    });
    // keyupで記事概要表示
    $("#url-pick-box").on("keyup", function() {
      var input = $('#url-pick-box').val();
      $.ajax({
        type: 'GET',
        url: '/get_urls',
        data: { url: input },
        dataType: 'json'
      })

      .done(function(page) {
        var pageinfo = buildPageinfo(page)

        $('.message').empty();
        $('.pick-site').append(pageinfo)
        $('.cover-controls').show();
      })

        $('notfound').show();

    });
  });
});


