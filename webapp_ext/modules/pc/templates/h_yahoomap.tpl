<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<title>({$smarty.const.SNS_NAME})</title>
({if defined('OPENPNE_VERSION') && $smarty.const.OPENPNE_VERSION})
<script src="js/prototype.js" type="text/javascript"></script>
({else})
<script src="js/javascript/prototype.js" type="text/javascript"></script>
({/if})
<script src="http://api.map.yahoo.co.jp/MapsService/js/V1/?appid=({$smarty.const.YAHOO_APPLICATION_ID})" type="text/javascript"></script>
<script type="text/javascript">
//<![CDATA[
Event.observe(window.parent,"load", loadYahooMaps({$name}));
var yMap({$name});
function loadYahooMaps({$name})() {
    if (typeof(YahooMapsCtrl) != 'undefined') {
        var pos  = new YLLPoint("({$lat}),({$lon})");
        var layer = ({$layer});
        var mode = ('({$mode})'.toUpperCase() == 'AERO') ? YMapMode.AERO : YMapMode.MAP;
        var type = 'L4';
        var label = '({if $memo})({$memo})({else})({$p})({/if})';
        yMap({$name}) = new YahooMapsCtrl('map({$name})', pos , layer, mode);
        yMap({$name}).addIcon('icon', pos, '({$memo})', type, label);
        yMap({$name}).setVisibleSliderbar(true);
    }
}
//]]>
</script>
</head>
<body>
<div id="map({$name})" style="width:410px;height:320px"></div>
</body>
</html>
