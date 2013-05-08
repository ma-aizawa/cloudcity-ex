// Copyright (c) 2007, Naoya Shimada <shima3amihs at gmail.com> 
// The PHP License, version 3.01
function url2cmd(url) {
    if (!url.match(/^http:\/\/cookpad\.com\/mykitchen\/recipe\/([0-9]+)\/?/)){
        try { pne_url2a(url); } catch(e) { document.write('<a href="'+url+'" target="_blank">'+url+'</a>'); }
        return;
    }
    var id = RegExp.$1;
    var width = 400;
    var height = 300;
    main(id, width, height);
}
function main(id, width, height) {
    if (!id.match(/^[0-9]+$/)) {
        return;
    }
    if (!width) width = 0; else width = parseInt(width);
    if (!height) height = 0; else height = parseInt(height);
    if (width <= 0 || width > 480) {
        width = 480;
    }
    if (height <= 0 || height > 680) {
        height = 680;
    }
    var html = '<iframe marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="1" bordercolor="#E9EAF0" '
    + 'width="'
    + width
    + '" height="'
    + height
    + '" src="http://cookpad.com/mykitchen/recipe/print.cfm?rid='
    + id
    + '"'
    + '></iframe>'
    + '<br /><a href="http://cookpad.com/?utm_source=bt&utm_medium=bt_r" target="_blank">'
    + '<img src="http://img2.cookpad.com/image/link/cpicon.gif" border="0" align="absmiddle" alt="レシピ" /></a>'
    + ' <a href="http://cookpad.com/recipe/'
    + id
    + '/?utm_source=bt&utm_medium=bt_r" style="color:#9ea73d;font-weight:bold;" target="_blank">COOKPAD レシピID:'
    + id
    + '</a>';
    document.write(html);
}
