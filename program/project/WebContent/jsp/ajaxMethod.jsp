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
    <h1>获取 json 数据</h1>
    <input type="button"  value="获取json" id='btnJson'>
    <button>向页面发送 HTTP GET 请求，然后获得返回的结果</button>
</body>
</html>




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
                alert(ajax.responseText);

                // 转化为 js对象
                var jsObj = JSON.parse(ajax.responseText);

                alert(jsObj);


                // 设置到界面上

                document.body.innerHTML = jsObj.code;
            }
        }
    }
</script>



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