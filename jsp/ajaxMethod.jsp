<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>

    <meta charset="UTF-8">
    <title>Document</title>
    
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String api_name = request.getParameter("tempJson");
	
	request.setAttribute("tempJson",api_name);
	String newparam = new String(api_name.getBytes("iso-8859-1"),"utf-8");
	System.out.println(newparam);
%>
    <%
	System.out.println("aaaa");
	%>
    <h1>获取 json 数据</h1>
    <input type="button"  value="获取json" id='btnJson'>
    <button>向页面发送 HTTP GET 请求，然后获得返回的结果</button>
    
    <form  method="post" action="ajaxMethod.jsp" id ="innerValue" name="form1"> 
    	<input id = 'test1' type = 'hidden' name="test1"> 
    	<input id = 'tempJson' type = 'hidden' name="tempJson" value='"<%=api_name%>"'> 
    </form> 
    <%
    	//String jsObj = request.getParameter("jsValue");
    	//if(jsObj==null) 
        //	System.out.print("null!");
    	//System.out.print("jsValue="+jsObj);
    %>
    
	
	

<script type="text/javascript">
    // 获取的是一个 如果要获取多个
    // document.querySelectorAll(selector)
    document.querySelector("#btnJson").onclick = function () {
        var ajax = new XMLHttpRequest();

        ajax.open('get','http://125.216.243.166:8888/all_api');

        ajax.send();

        ajax.onreadystatechange = function () {
        	console.log(ajax.status);
            if (ajax.readyState==4&&ajax.status==200) {
                // json 字符串 是字符串 所以我们可以 通过  responseText获取
                //alert(ajax.responseText);

                // 转化为 js对象
                var jsObj = JSON.parse(ajax.responseText);
                //alert(jsObj);

                var test = '111'; //定义js变量 
                alert("aaa");
                document.form1.elements[0] = test;
                //将js变量的值放到form中的一个隐藏域中 
                var formObj = document.getElementById('innerValue');
                alert("bbb");
                formObj.submit();
                alert("ccc");
                
                // 设置到界面上

                document.body.innerHTML = jsObj.code;
            }
        }
    }
</script>

<%
	  request.setCharacterEncoding("utf-8");
	  String txtMsg = request.getParameter("test1"); 
	  System.out.println("be");
	  if(txtMsg==null)
		  System.out.println("null!");
	  System.out.println(txtMsg);
	%> 
	
<script>
$(document).ready(function(){
  $("button").click(function(){
	  $.ajax({
		    type:"get",    //请求方式
		    async:true,    //是否异步
		    url:"http://localhost:8080/project/jsp/home.jsp",
		    dataType:"jsonp",    //跨域json请求一定是jsonp
		    jsonp: "callbackparam",    //跨域请求的参数名，默认是callback
		        //jsonpCallback:"successCallback",    //自定义跨域参数值，回调函数名也是一样，默认为jQuery自动生成的字符串
		    data:{},    //请求参数

		    beforeSend: function() {
		        //请求前的处理
		    },

		    success: function(data) {
		        //请求成功处理，和本地回调完全一样
		        alert(123);
		    },

		    complete: function() {
		        //请求完成的处理
		    },

		    error: function() {
		        //请求出错处理
		    }
		});
  });
});
</script>
</body>
</html>


