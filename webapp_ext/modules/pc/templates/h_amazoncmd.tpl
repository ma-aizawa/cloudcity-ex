<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<title>({$product.ItemAttributes.Title}) - Amazon小窓</title>
<style type="text/css">
body {
  margin:0;
  background:#FFF;
}

p {
  margin: 0 0 10px 0;
}

#containerMain {
  border:1px solid #ccc;
  width:418px;
  font-size:12px;
}

#containerMain h1 {
  background:#eee;
  margin:0px 0px 0px 0px;
  padding:5px;
  font-size:14px;
}

#containerMain .middle {
  background:#fff;
}

#containerMain #boxPhoto {
  float:left;
  width:170px;
  height:190px;
  text-align:center;
}

#containerMain #boxPhoto img {
}

#containerMain #boxText {
  position:relative;
  float:right;
  width:248px;
  height:190px;
}

#containerMain #boxInfo {
  clear:both;
  padding:5px;
  height:70px;
  background:#eff;
}

#containerMain h2 {
  background:#eee;
  margin:0;
  padding:5px;
  height:15px;
  font-weight:normal;
  font-size:14px;
  text-align:right;
}

br.clear {
  clear:both;
}
</style>
</head>
<body>
<div id="containerMain">
<h1>
<a href="http://www.amazon.co.jp/({$AFFID})/dp/({$ASIN})" target="_blank" title="({$product.ItemAttributes.Title})を新しいウインドウで開く">({$product.ItemAttributes.Title|t_truncate:56:'...'})</a>
</h1>

<div id="boxPhoto" class="middle">
<img src="({if $product.MediumImage.URL})({$product.MediumImage.URL})({else})({t_img_url_skin filename=no_image w=120 h=120})({/if})" alt="({$product.ItemAttributes.Title})の写真" title="({$product.ItemAttributes.Title})の写真" />
<br />
<p>提供：Amazon</p>
</div>
<div id="boxText" class="middle">
({if $product.ItemAttributes.Creator})
<p>(({$product.ItemAttributes.Creator.0.Role})) ({$product.ItemAttributes.Creator.0._content})</p>
({/if})
({if $product.ItemAttributes.Publisher})
<p>出版社: ({$product.ItemAttributes.Publisher})</p>
({/if})
({if $product.ItemAttributes.ReleaseDate})
<p>発売日: ({$product.ItemAttributes.ReleaseDate|date_format:'%Y年%m月%d日'})</p>
({/if})
({if $product.OfferSummary.LowestNewPrice.FormattedPrice})
<p>販売価格: ({$product.OfferSummary.LowestNewPrice.FormattedPrice})</p>
({/if})
({if $product.ItemAttributes.ListPrice.FormattedPrice})
<p>[ 定価: ({$product.ItemAttributes.ListPrice.FormattedPrice}) ]</p>
({/if})
({if $product.ItemAttributes.ISBN})
<p>ISBN-10: ({$product.ItemAttributes.ISBN})</p>
({/if})
({if $product.SalesRank})
<p>Amazon.co.jp ランキング: ({$product.SalesRank})位</p>
({/if})
({if $product.Offers.Offer.OfferListing.Availability})
<p>({$product.Offers.Offer.OfferListing.Availability})</p>
({/if})
</div>

<div id="boxInfo">
<p>この商品を買った人はこんな商品も買っています</p>
({foreach from=$product.SimilarProducts.SimilarProduct item=item name=similar})
({if $smarty.foreach.similar.iteration < 4})
<a href="http://www.amazon.co.jp/({$AFFID})/dp/({$item.ASIN})" target="_blank" title="({$item.Title})を新しいウインドウで開く">({$item.Title})</a><br />
({/if})
({/foreach})
</div>

<h2><strong>Amazon小窓</strong> Powered by <a href="http://www.amazon.co.jp/" target="_blank">amazon</a>  <a href="http://amazon.openpne.jp/help/" target="_blank">[help]</a></h2>

</div>
</body>
</html>
