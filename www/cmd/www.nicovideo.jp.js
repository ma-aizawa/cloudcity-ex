function url2cmd(url) {

    if (url.match(/^http:\/\/(?:www\.|)nicovideo\.jp\/(watch\/|watch\?v=|thumb\/|thumb\?v=)([\w-]+)$/)) {

    var id = RegExp.$2;
    var html = '<script type="text/javascript" src="http://ext.nicovideo.jp/thumb_watch/'
        + id
        + '?w=425&h=337"></script><noscript><a href="http://www.nicovideo.jp/watch/'
        + id
        + '" target="_blank">'
        + url
        + '</a></noscript>';

    document.write(html);

    }else if (url.match(/^http:\/\/(?:www\.|)nicovideo\.jp\/mylist\/([\d]+)$/)) {

    /*マイリストの場合*/

    var id = RegExp.$1;
    var html = '<iframe width="312" height="176" src="http://www.nicovideo.jp/thumb_mylist/'
            + id
            + '" frameborder="0" scrolling="no" style="border:solid 1px #CCC;"><a href="'
            + url
            + ' target=_blank">'
            + url
            +'</a></iframe>';
    document.write(html);

    }else{

    /*マイリストじゃないとき*/

    var html = '<a href="'
            + url
            + '" target="_blank">'
            + url
            +'</a>';
    document.write(html);

          }

    return;

}
