/**
 * 
 */
$(function(){
	$(".borderSiteMapItem").hide();
	
	/*$(".cmp1SiteMapItem").mouseenter(function(){
		$(".cmp1BorderSiteMapItem").fadeIn(200);
	});*/
	/*$(".innerSiteMapItem h3").mouseenter(function(){
		$(this)
	       .delay(50)
	       .css("border-color", '#EEB403')
	       .css("border-style","solid")
	       .css("border-width","1px");  
		$(this).animate();
	});
	$(".innerSiteMapItem h3").mouseout(function(){
		$(this)
	       .delay(5000)
	       .css("border-color", '#EEB403')
	       .css("border-style","solid")
	       .css("border-width","0px");  
		$(this).fadeOut();
	});*/
	/*
	for( i = 1 ; i < 7 ; i++ ){
		var descriptionClass = ".cmp" + i + "InnerSiteMapItem h3";
		var fadeClass = ".cmp" + i + "BorderSiteMapItem";
		alert('class1: ' + descriptionClass );
		$(descriptionClass).hover(function() {
		    $(fadeClass).fadeIn()}, function() {
		    $(fadeClass).fadeOut();
		});
	}
	*/
	/*
	var asd = $("#sightsSiteMapItem").children().length;
	alert(asd);
	for( i = 1 ; i < 7 ; i++ ){
		//sightsSiteMapItem의 자식 cmp(i)SiteMapItem의 1번 자식 innerSiteMapItem의 0번 자식 h3태그에 hover이벤트 추가
		//hover가 되면 sightsSiteMapItem의 자식 cmp(i)SiteMapItem의2번자식 fade
		var asda = $("#sightsSiteMapItem").children().eq(i).children().eq(1).children().eq(0).text();
		$("#sightsSiteMapItem").children().eq(i).children().eq(1).children().eq(0).hover(function() {
			$("#sightsSiteMapItem").children().eq(i).children().eq(2).fadeIn()},
			function() {
				$("#sightsSiteMapItem").children().eq(i).children().eq(2).fadeOut();
		});
	}
*/
	$(".cmp1InnerSiteMapItem h3").hover(function() {
	    $(".cmp1BorderSiteMapItem").fadeIn()},
	    							function() {
	    $(".cmp1BorderSiteMapItem").fadeOut();
	});
	
	$(".cmp2InnerSiteMapItem h3").hover(function() {
	    $(".cmp2BorderSiteMapItem").fadeIn()},
	    							function() {
	    $(".cmp2BorderSiteMapItem").fadeOut();
	});
	
	$(".cmp3InnerSiteMapItem h3").hover(function() {
	    $(".cmp3BorderSiteMapItem").fadeIn()},
	    							function() {
	    $(".cmp3BorderSiteMapItem").fadeOut();
	});
	
	$(".cmp4InnerSiteMapItem h3").hover(function() {
	    $(".cmp4BorderSiteMapItem").fadeIn()},
	    							function() {
	    $(".cmp4BorderSiteMapItem").fadeOut();
	});
	
	$(".cmp5InnerSiteMapItem h3").hover(function() {
	    $(".cmp5BorderSiteMapItem").fadeIn()},
	    							function() {
	    $(".cmp5BorderSiteMapItem").fadeOut();
	});
	
	$(".cmp6InnerSiteMapItem h3").hover(function() {
	    $(".cmp6BorderSiteMapItem").fadeIn()},
	    							function() {
	    $(".cmp6BorderSiteMapItem").fadeOut();
	});

});