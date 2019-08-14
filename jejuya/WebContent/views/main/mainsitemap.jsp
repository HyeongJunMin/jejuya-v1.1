<%@page import="com.sights.dto.SightsDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html>
<html> -->

<%
	List<SightsDto> mainSiteMapList = new ArrayList<>();
	
	if( request.getAttribute("mainSiteMapList") != null){
		mainSiteMapList = (List<SightsDto>)request.getAttribute("mainSiteMapList");
	}

%>

<script type="text/javascript" src="/jejuya/resources/js/main/mainsitemap.js"></script>
<link href="/jejuya/resources/css/main/mainsitemap.css" rel="stylesheet">

<div class="mainSiteMapWrap" align="center">
	<div class="mainSiteMapContent">
		<div class="siteMapHeader">
			<ul class="nav nav-tabs" role="tablist">
				<li> <a class="nav-link active" data-toggle="tab" href="#sightsSiteMapItem">인기 여행지</a> </li>
				<li> <a class="nav-link" data-toggle="tab" href="#announceSiteMapItem">공지사항</a> </li>
				<li> <a class="nav-link" data-toggle="tab" href="#shareScheSiteMapItem">일정공유</a> </li>
				<li> <a class="nav-link" data-toggle="tab" href="#tranpSiteMapItem">교통정보</a> </li>
			</ul>
		</div>
		<div class="siteMapBody">
			<!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="sightsSiteMapItem">
                	<div class="titleSiteMapItem">
                		<h3>제주도 추천 여행지</h3>
                    </div>
                    <%
                    	for(int i = 1 ; i < 7 ; i++ ){
                    		SightsDto dto = mainSiteMapList.get(i);
                    		%>
                    			<div class="cmp<%=i %>SiteMapItem">
                    				<img alt="" src="<%=dto.getFilename() %>">
                    				<div class="cmp<%=i %>InnerSiteMapItem innerSiteMapItem">
                    					<a href="/jejuya/SightsController?command=detailBasic&title=<%=dto.getTitle() %>">
                    						<h3><%=dto.getTitle() %></h3>
                    					</a>
                    				</div>
                    				<div class="cmp<%=i %>BorderSiteMapItem borderSiteMapItem"></div>
                    			</div>
                    		<%
                    	}
                    %>     
                </div>
                <div role="tabpanel" class="tab-pane" id="announceSiteMapItem">
                    
                    <div class="cmp1AnnounceSiteMapItem">
                    	<h2>준비 중입니다.</h2>
                    </div>
                    
                </div>
                <div role="tabpanel" class="tab-pane" id="shareScheSiteMapItem">
                    <div class="cmp1ShareSiteMapItem">
                    	<h2>준비 중입니다.</h2>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="SiteMapItem">
                    <div class="cmp1TranspSiteMapItem">
                    	<h2>준비 중입니다.</h2>
                    </div>                    
                </div>
            </div>
		</div>
	</div>	
</div>

<div class="">

</div>

<!-- </html> -->