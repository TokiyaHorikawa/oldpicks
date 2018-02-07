json.title        @page.meta["og:title"] ? @page.meta["og:title"] : "タイトル検出不可"
json.description  @page.meta["og:description"] ? @page.meta["og:description"] : "概要検出不可"
json.image        @page.meta["og:image"]  ? @page.meta["og:image"] : "https://news.walkerplus.com/article/127386/710240_615.jpg"
json.site_name    @page.meta["og:site_name"] ? @page.meta["og:site_name"] : "出典検出不可"
