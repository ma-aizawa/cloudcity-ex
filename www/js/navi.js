var selectedTabID = 'nav_01';

Event.observe(window, 'load', function(){
	var tabs = document.getElementById('navigation').getElementsByTagName('li');
	var tabNums = tabs.length;
	var cContentsStr = "";
	
	for(var i = 0; i < tabNums ; i++) {
		tabID = 'nav_0'+(i+1);
		Event.observe(tabID, 'click',function(){tabSelect(this.id);});
		item = $(tabID);
		if (Element.hasClassName(item, 'selected')) {
			tabSelect(tabID);
		}
		cID = tabID + '_c';
		cContentsStr += "<hr>" + $(cID).innerHTML;
	}
	Element.update($("nav_all_contents"),cContentsStr);
	setDate();
	var is_tab = ($F('c_ccn_default_tab') == 1) ? true : false;
	setTab(is_tab);
});


function tabSelect(id){
	//セレクト消去
	selectedTab = $(selectedTabID);
	Element.removeClassName(selectedTab,'selected');
	//コンテンツ非表示
	var selectedTabContentsID = selectedTabID+'_c';
	var selectedTabContents = $(selectedTabContentsID);
	Element.hide(selectedTabContents);

	var clickedTabID = id;
	var clickedTab = $(clickedTabID);	
	Element.addClassName(clickedTab, 'selected');
	//コンテンツ表示
	var clickedTabContentsID = clickedTabID+'_c';
	var clickedTabContents = $(clickedTabContentsID);
	Element.setStyle(clickedTabContents,{'display':'block'});

	//タブ切り替え
	selectedTabID = clickedTabID;
}

function setTab(flg){
	if(flg == true) {
		Element.setStyle($('nav'), {'display':'block'});
		Element.hide($('nav_all'));
	}
	else{
		Element.setStyle($('nav_all'), {'display':'block'});
		Element.hide($('nav'))
	}
	return 0;
}

function setDate(){
	var nowdate = new Date();
	var mon = nowdate.getMonth() + 1;
	var date = nowdate.getDate();
	Element.update($('date_of_today'), mon + "月" + date + "日");
}
