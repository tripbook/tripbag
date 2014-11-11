<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../jquery/jquery.js"></script>
</head>
<body>

<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=7755a5d6fc3181e6de2cf27cca5b0e9245d1fbbb&libraries=services"></script>


<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new daum.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.53539, 126.99366), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places(); 

// 키워드로 장소를 검색합니다
function search(){
	var name=$("#name").val();
	
	ps.keywordSearch(name, placesSearchCB); 
}


// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (status, data, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new daum.maps.LatLngBounds();

        for (var i=0; i<data.places.length; i++) {
           // displayMarker(data.places[i]);    
            bounds.extend(new daum.maps.LatLng(data.places[i].latitude, data.places[i].longitude));
        }
        
        displayMarker();
	
        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker() {
	var name=$("#name").val();
	
	var ServiceKey="ykAa7i4o6hpE37M06pR8%2B8CVyCMk5glltxaLrbk87BfeCYAAtsjC%2BqjnbLh7BF5xejcroX30ZKaFEESZEUTphQ%3D%3D";
	var url="http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?MobileOS=ETC&MobileApp=AppTesting";
	var str=url+"&ServiceKey="+ServiceKey;
	str+="&keyword="+encodeURI(name);
	str+="&numOfRows=20";
	//str+="&contentTypeId=15";
	$("#url").text(str);
	
	$.ajax({
		url:str,
		type:"get",
		dataType:"xml",
		success:function(data){
			//alert(data);
			var itemList = $(data).find("item");
			//alert(itemList.size());
			
			$(itemList).each(function(index){
				var item=itemList.eq(index);
				//alert(item.children("title").text());
				
				var titleText="<span>"+item.children("title").text()+"</span><br/>";
				titleText+="<span>"+item.children("mapx").text()+"</span><br>";
				titleText+="<span>"+item.children("mapy").text()+"</span><br>";
				$("#resultDisplay").append(titleText);
				
				var positions = [
				                 {
				                	 title: item.children("title").text(), 
				                	 latlng: new daum.maps.LatLng(parseFloat(item.children("mapy").text()), parseFloat(item.children("mapx").text()))
				                 }
				             ];

				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
				    
				for (var i = 0; i < positions.length; i ++) {
				    
				    // 마커 이미지의 이미지 크기 입니다
				    var imageSize = new daum.maps.Size(24, 35); 
				    
				    // 마커 이미지를 생성합니다    
				    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
				    
				    // 마커를 생성합니다
				    var marker = new daum.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng, // 마커를 표시할 위치
				        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        image : markerImage, // 마커 이미지 
				        clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
				    });
				}
				
				// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
				var iwContent = '<a href="" style="padding:5px; font-size:12px;">'+item.children("title").text()+'</a>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    iwPosition = new daum.maps.LatLng(33.450701, 126.570667), //인포윈도우 표시 위치입니다
				    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

				// 인포윈도우를 생성합니다
				var infowindow = new daum.maps.InfoWindow({
				    position : iwPosition,
				    content : iwContent,
				    removable : iwRemoveable
				});

				// 마커에 클릭이벤트를 등록합니다
				daum.maps.event.addListener(marker, 'click', function() {
				      // 마커 위에 인포윈도우를 표시합니다
				      infowindow.open(map, marker);  
				});
				
			});
			
			// $("#resultDisplay").html(data);
		},error:function(xhr,status,error){
			alert(status);
		}
	})
}
</script>
<div>
	<input id="name" type="text" />
	<input type="button" onclick="search()"/>
</div>
<div id="resultDisplay"></div>
</body>
</html>