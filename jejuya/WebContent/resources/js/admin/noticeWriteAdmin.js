/**
 * 
 */

//context path
var ctx = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
alert(ctx);
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({ 
	oAppRef: oEditors, 
	elPlaceHolder: 'inputContent', 
	sSkinURI: ctx + '/resources/texteditor/SmartEditor2Skin.html', 
	fCreator: 'createSEditor2' 
}); 

$("#noticeBtnSave").click(function(){
	alert('save!');
	oEditors.getById["inputContent"].exec("UPDATE_CONTENTS_FIELD", []); 
	$("#noticeWriteForm").submit();
});