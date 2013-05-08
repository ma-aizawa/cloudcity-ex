function url2cmd(url)
{
  if (!url.match(/^http:\/\/www\.ustream\.tv\/(channel\/)?(.+)$/)) {
    if (!url.match(/^http:\/\/www\.ustream\.tv\/recorded\/(\d+)$/)) {
      pne_url2a(url);
      return;
    }
  }
  var html = '<iframe marginwidth="0" marginheight="0" vspace="0" frameborder="0" scrolling="no" bordercolor="#000000" src="'
    + 'http://www.openpne.jp/officialcast/www.ustream.tv/?url=' + encodeURI(url)
    + '" width="320" height="260">'
    + '</iframe>';
  document.write(html);
}
