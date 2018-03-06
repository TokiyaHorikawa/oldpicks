$(document).on('turbolinks:load', function() {

  $(function() {

    function buildPageinfo(page) {
      // 記事概要HTML生成
      var html = '<div class="pageinfo">' +
                    '<div class="page-thumbnail" style="background-image: url(' + page.image + '); background-size: cover; height: 120px; width: 120px;"></div>' +
                    '<div class="texts">' +
                      '<div class="title_ellipsised" style="overflow: hidden; height: 45px;">' +
                      '<span> ' + page.title + ' </span>' +
                      '</div>' +
                      '<div class="summary_ellipsised" title=' + page.title + ' style="overflow: hidden; height: 75px;">' +
                        '<span> ' + page.description + ' </span>' +
                       '</div>' +
                    '</div>' +
                  '</div>';
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

    // URL入力欄が空なら消す
    $('#url-pick-box').keyup(function() {
      if($(this).val() ==  "") {
        $('.urlpick-dialog-content').hide();
        // js作成htmlとコメントの削除
        $('.pageinfo').empty();
        $('.comment').empty();
        // pickボタンをhiden
        $('.pick').hide();
        $('.pick-font').hide();
      }
    });

    // keyupでコメント入力欄表示
    $("#url-pick-box").on('keyup', function() {
      $('.cover-controls').show();
    });
    // keyupでPickボタン表示
    $("#url-pick-box").on('keyup', function() {
      $('.pick').show();
    });
    // keyupで記事概要表示
    $("#url-pick-box").one("keyup", function() {
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
        // 記事情報をテキストエリアに記述
        $('.post_title').append(page.title)
        $('.post_description').append(page.description)
        $('.post_image').append(page.image)
        $('.post_site_name').append(page.site_name)
        $('.notfound').show();
      })
        // 条件分岐に変える
        // $('.notfound').show();
    });
  });
});
