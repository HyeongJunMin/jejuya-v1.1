<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<script type="text/javascript" src="/jejuya/resources/js/main/maincontent.js"></script>
<link href="/jejuya/resources/css/main/maincontent.css" rel="stylesheet">

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>




<br><br><br><br><br><br>

<div class="container text-center my-3">
    <h3>관광지</h3>
    <div id="recipeCarousel" class="carousel slide w-100" data-ride="carousel">
        <div class="carousel-inner w-100" role="listbox">
            <div class="carousel-item row no-gutters active">
                <div class="col-3 float-left">
               		<!-- <img class="img-fluid" src="https://api.visitjeju.net/photomng/thumbnailpath/201804/30/e1c2f9e4-bf4c-488c-884c-5674f8d8b119.jpg"> -->
               		<dl class="item_section">
						<dt class="item_top">
							<span class="s_day">category</span> 
							<!-- 받아온 DB정보에서 seq번호로 디테일화면으로 넘어가기 -->
							<a href="/jejuya/SightsController?command=SightDetail&title=dto.getTitle() ">
								<img height="130px" width="100%" alt="dto.getFilename()"
								class="" src="https://api.visitjeju.net/photomng/thumbnailpath/201804/30/e1c2f9e4-bf4c-488c-884c-5674f8d8b119.jpg">
							</a>
				
							<p class="s_tit">dto.getTitle()</p>
							<p class="s_readcount">조회수:dto.getReadcount() </p>
							<p class="s_addSchedule">리뷰등록수:dto.getAddSchedule() </p>
							<p class="s_theme">테마:dto.getTheme()</p>
							<p class="s_content">정보:dto.getContent()</p>
							
						</dt>
					</dl>
                </div>
                <div class="col-3 float-left">
                	<!-- <img class="img-fluid" src="https://api.visitjeju.net/photomng/thumbnailpath/201810/17/e798d53c-1c8a-4d44-a8ab-111beae96db4.gif"> -->
               		<dl class="item_section">
						<dt class="item_top">
							<span class="s_day">category</span> 
							<!-- 받아온 DB정보에서 seq번호로 디테일화면으로 넘어가기 -->
							<a href="/jejuya/SightsController?command=SightDetail&title=dto.getTitle() ">
								<img height="130px" width="100%" alt="dto.getFilename()"
								class="" src="https://api.visitjeju.net/photomng/thumbnailpath/201804/30/e1c2f9e4-bf4c-488c-884c-5674f8d8b119.jpg">
							</a>
				
							<p class="s_tit">dto.getTitle()</p>
							<p class="s_readcount">조회수:dto.getReadcount() </p>
							<p class="s_addSchedule">리뷰등록수:dto.getAddSchedule() </p>
							<p class="s_theme">테마:dto.getTheme()</p>
							<p class="s_content">정보:dto.getContent()</p>
							
						</dt>
					</dl>
                </div>
                <div class="col-3 float-left">
                	<!-- <img class="img-fluid" src="https://api.visitjeju.net/photomng/thumbnailpath/201804/30/c9c42359-f82f-43a4-919e-03ecd197a2eb.jpg"> -->
                	<dl class="item_section">
						<dt class="item_top">
							<span class="s_day">category</span> 
							<!-- 받아온 DB정보에서 seq번호로 디테일화면으로 넘어가기 -->
							<a href="/jejuya/SightsController?command=SightDetail&title=dto.getTitle() ">
								<img height="130px" width="100%" alt="dto.getFilename()"
								class="" src="https://api.visitjeju.net/photomng/thumbnailpath/201804/30/e1c2f9e4-bf4c-488c-884c-5674f8d8b119.jpg">
							</a>
				
							<p class="s_tit">dto.getTitle()</p>
							<p class="s_readcount">조회수:dto.getReadcount() </p>
							<p class="s_addSchedule">리뷰등록수:dto.getAddSchedule() </p>
							<p class="s_theme">테마:dto.getTheme()</p>
							<p class="s_content">정보:dto.getContent()</p>
							
						</dt>
					</dl>
                </div>
                <div class="col-3 float-left">
                	<!-- <img class="img-fluid" src="https://api.visitjeju.net/photomng/thumbnailpath/201804/30/7b9e075d-fcd5-4eb6-83e9-e55cf799c2ba.jpg"> -->
                	<dl class="item_section">
						<dt class="item_top">
							<span class="s_day">category</span> 
							<!-- 받아온 DB정보에서 seq번호로 디테일화면으로 넘어가기 -->
							<a href="/jejuya/SightsController?command=SightDetail&title=dto.getTitle() ">
								<img height="130px" width="100%" alt="dto.getFilename()"
								class="" src="https://api.visitjeju.net/photomng/thumbnailpath/201804/30/e1c2f9e4-bf4c-488c-884c-5674f8d8b119.jpg">
							</a>
				
							<p class="s_tit">dto.getTitle()</p>
							<p class="s_readcount">조회수:dto.getReadcount() </p>
							<p class="s_addSchedule">리뷰등록수:dto.getAddSchedule() </p>
							<p class="s_theme">테마:dto.getTheme()</p>
							<p class="s_content">정보:dto.getContent()</p>
							
						</dt>
					</dl>
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

    <h4>제주도의 아름다운 관광지</h4>
    <a href="#">더보기</a>
</div>

<br><br><br><br><br>


</html>