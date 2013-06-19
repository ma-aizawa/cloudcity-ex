var selectedTabID = 'nav_01';

Event.observe(window, 'load', function(){
	var tabs = document.getElementById('navigation').getElementsByTagName('li');
	var tabNums = tabs.length;

	for(var i = 0; i < tabNums ; i++) {
		tabID = 'nav_0'+(i+1);
		Event.observe(tabID, 'click',function(){tabSelect(this.id);});
		item = $(tabID);
		if (Element.hasClassName(item, 'selected')) {
			tabSelect(tabID);
		}
	}
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