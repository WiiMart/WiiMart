function gotoIndex(topPage)
{
	// 目次にもどる
	if (topPage == '') {
		window.open("../index.html","_self");
	} else {
		window.open(topPage,"_self");
	}
}

function jumpPage(pageName)
{
	window.open("../" + pageName + "/" + pageName + ".html", "_self" );
}

function kpress(last, topPath)
{
	var nowpage_url = window.location.pathname;
	var nowpage_idx = nowpage_url.lastIndexOf("_");
	var nowpage = parseInt( nowpage_url.substr( nowpage_idx+1, 2 ) );
	prevpage = nowpage-1;
	nextpage = nowpage+1;
	prev = "page_" + Math.floor( prevpage / 10 ) + prevpage % 10 ;
	next = "page_" + Math.floor( nextpage / 10 ) + nextpage % 10 ;

	// 174 : Core + button
	// 177 : Core Right button
	// 178 : Core Left button

	switch( event.keyCode )
	{
	case 174:
		gotoIndex(topPath);
		wiiCancelSound();
		break;
	case 178:
		if ( event.ctrlKey )
		{
			if ( prevpage > 0 )
			{
				jumpPage(prev);
				wiiSelectSound();
			}
			else
			{
				gotoIndex(topPath);
				wiiCancelSound();
			}
		}
		break;
	case 177:	
		if ( event.ctrlKey )
		{
			if ( !last )
			{
				jumpPage(next);
				wiiSelectSound();
			}
			else
			{
				gotoIndex(topPath);
				wiiCancelSound();
			}
		}
		break;
	}
}
