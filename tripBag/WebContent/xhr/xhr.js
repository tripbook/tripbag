function createXHR(){
	if(window.ActiveXObject){
		try{
			return new ActiveXObject("Msxml2.XMLHTTP");
		}catch(E1){
			try{
				return new ActiveXObject("Microsoft.XMLHTTP");
			}catch(E2){
				return null;
			}
		}
	}else if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}else{
		return null;
	}
}


var xhr=null;
function sendRequest(method,url,callback,params){
	xhr=createXHR();
	//alert(params);
	var httpMethod=method;
	if(httpMethod!="GET" &&httpMethod!="POST"){
		httpMethod="GET";
	}
	
	var httpParams=(params==null||params=="") ? null : params;
	var httpUrl=url;
	if(httpMethod=="GET" && httpParams!=null){
		httpUrl+="?"+httpParams;
	}
	
	//alert(httpMethod+","+httpUrl+","+httpParams);
	xhr.open(httpMethod,httpUrl,true);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send(httpMethod=="POST" ? httpParams:null);
	xhr.onreadystatechange=callback;
}