<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String addrji =request.getParameter("addrji");

if(addrji==null){

addrji = "37.827677, 127.514767";
}
%>

<!-- 
 String[] addrji= addrji.split(" , "); 
 String[0] addrji=[0]
 String[1] addrji=[1]
 -->
<%
String[] sad = addrji.split(",");

String a = (String) sad[0];
String b = (String) sad[1];

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>




<body>



<div id="map" style="width:650px;height:580px; float:right; margin-right:1px; border: 2px solid red;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f360af1e4d59c2403323bcdc63e3fb7"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(<%=a %>,<%=b %>), // 지도의 중심좌표 , 프로젝트 강남점
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(<%=a %>,<%=b %>); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>
</body>
</html>