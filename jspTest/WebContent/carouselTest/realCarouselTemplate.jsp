<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


<style type="text/css">

/* 캐러셀 영역 설정 */
#recipeCarousel{
	margin: 10px;
	padding: 20px;
}

/* 이미지 캐러셀 크기 설정 */
.img-fluid{
	max-height: 180px;
}

/* 캐러셀 이미지 내부 캡션 영역 */
.innerCarouselCaption{
	float: left;
	background-color: rgba(0,0,0,0.8);
}

.item_section {
	float: left;
	position: relative;
	width: 100px;
	height: 310px;
	margin-left: 27px;
	background: #fff;
	-webkit-box-shadow: 3px 4px 5px 0 rgba(2, 2, 2, .2);
	box-shadow: 3px 4px 5px 0 rgba(2, 2, 2, .2);
	text-align: center;
}
</style>

</head>
<body>

<div class="container text-center my-3">
    <h3>관광지</h3>
    <div id="recipeCarousel" class="carousel slide w-100" data-ride="carousel">
        <div class="carousel-inner w-100" role="listbox">
            
            <div class="carousel-item row no-gutters active">
                <div class="col-3 float-left">
               		<img class="img-fluid" src="https://api.visitjeju.net/photomng/thumbnailpath/201804/30/e1c2f9e4-bf4c-488c-884c-5674f8d8b119.jpg">
                </div>
                <div class="col-3 float-left">
                	<img class="img-fluid" src="https://api.visitjeju.net/photomng/thumbnailpath/201810/17/e798d53c-1c8a-4d44-a8ab-111beae96db4.gif">
                </div>
                <div class="col-3 float-left">
                	<img class="img-fluid" src="https://api.visitjeju.net/photomng/thumbnailpath/201804/30/c9c42359-f82f-43a4-919e-03ecd197a2eb.jpg">
                </div>
                <div class="col-3 float-left">
                	<img class="img-fluid" src="https://api.visitjeju.net/photomng/thumbnailpath/201804/30/7b9e075d-fcd5-4eb6-83e9-e55cf799c2ba.jpg">
                </div>
            </div>
            
            <div class="carousel-item row no-gutters">
                <div class="col-3 float-left">
                	<img class="img-fluid" src="https://api.visitjeju.net/photomng/thumbnailpath/201804/30/4788623b-fe05-4b21-a9ef-2406c8eadb23.jpg">
                </div>
                <div class="col-3 float-left">
                	<img class="img-fluid" src="https://api.visitjeju.net/photomng/thumbnailpath/201804/30/d218b9b6-a3d2-4f64-8f93-fafcb4f9278b.jpg">
                </div>
                <div class="col-3 float-left">
                	<img class="img-fluid" src="https://api.visitjeju.net/photomng/thumbnailpath/201804/30/a0da4b95-9da0-45f3-921b-a820ccc5d427.jpg">
                </div>
                <div class="col-3 float-left">
                	<img class="img-fluid" src="https://api.visitjeju.net/photomng/thumbnailpath/201804/30/a7b4a973-40e9-44e6-87d9-46a4c4f3b367.jpg">
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#recipeCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#recipeCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>



</body>
</html>