<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonArray" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="com.google.gson.JsonParser" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>

<!-- API列表页面，点击某项API跳转到其对应的详情页面 -->

<html>
		
	<head>
		<meta content="text/html; charset=UTF-8">
		<title>API列表页面</title>
	</head>
	
	<body>
		
		<%
			// 获取json数据并解析
			// String tempJson = request.getAttribute("tempJson");
			String tempJson = "{\"msg\":\"\",\"code\":0,\"data\":[{\"api_id\":1,\"api_name\":\"creat\",\"api_desc\":\"创建一个新文件\",\"api_func\":\"int creat (const char *path , mode_t mode) ;\",\"api_para\":\"pathname：指向欲建立的文件路径字符串    \\n\\nmode : 指定用户操作权限，S_IS[UG]ID 、S_ISVTX 、\\nS_I[RWX](USR|GRP|0TH)\\n\\r\\n\",\"api_return\":\"若成功，返回为只写打开的文件描述符； 若出错，返回-1\"},{\"api_id\":2,\"api_name\":\"open\",\"api_desc\":\"打开或创建一个文件\",\"api_func\":\"open (const char *pa th, int oflag, ... /* mode_t mode */ ) ;\\r\\n\",\"api_para\":\"O_EXEC只执行打开,\\r\\nO_SEARCH只搜索打开目录,\\r\\nO_APPEND追加写,\\r\\nO_NONBLOCK非阻塞模式,\\r\\nO_SYNC等待写完成（数据和屈性）,\\r\\nO_DSYNC等待写完成（仅数据）,\\r\\nO_RSYNC同步读和写\\r\\nO_FSYNC等待写完成（仅FreeBSD 和Mac OS X),\\r\\nO_ASYNC异步I/0 ( 仅F reeBSD 和Mac OS X)\\r\\n\\r\\nmode : 指定用户操作权限，S_IS[UG]ID 、S_ISVTX 、\\r\\nS_I[RWX](USR|GRP|0TH)\",\"api_return\":\"若成功，返回文件描述符； 若出错，返回-1\\r\\n\"}]}";
			JsonParser parse =new JsonParser();  //创建json解析器
			JsonObject temp=(JsonObject) parse.parse(tempJson);
			// 获取api列表
			JsonArray list=temp.get("data").getAsJsonArray();
			Gson gson = new Gson();
			List apiList = gson.fromJson(list,List.class); //将数据从JsonArray类型转换为list类型
			request.setAttribute("apiList",apiList);
		%>
	
		<!-- api列表，每一个api以表格形式展现，点击可跳转至详情页面 -->
		<c:forEach items="${apiList}" var="api">
			<a href="javascript:jump('${api.api_name}')" style="text-decoration:none;">
		    	<table>
		    		<tr>
		    			<td  rowspan="2">
		        			<p><font size="25">${api.api_name}&nbsp;&nbsp;</font></p>
		    			</td>
		    			<td>
		        			<p><font size="5">${api.api_desc}</font></p>
		        		</td>
		    		</tr>
		    		<tr>
		    			<td>
		        			<p ><font size="5">${api.api_func}</font></p>
		        		</td>
		    		</tr>
		    	</table>
			</a>
		</c:forEach>

		<script type="text/javascript">
		    function () {
		        // 发送ajax 请求 需要 五步
		
		        // （1）创建异步对象
		        var ajaxObj = new XMLHttpRequest();
		
		        // （2）设置请求的参数。包括：请求的方法、请求的url。
		        ajaxObj.open('get', 'http://125.216.243.166:8888/all_api');
		
		        // （3）发送请求
		        ajaxObj.send();
		
		        //（4）注册事件。 onreadystatechange事件，状态改变时就会调用。
		        //如果要在数据完整请求回来的时候才调用，我们需要手动写一些判断的逻辑。
		        ajaxObj.onreadystatechange = function () {
		            // 为了保证 数据 完整返回，我们一般会判断 两个值
		            if (ajaxObj.readyState == 4 && ajaxObj.status == 200) {
		                // 如果能够进到这个判断 说明 数据 完美的回来了,并且请求的页面是存在的
		                // 5.在注册的事件中 获取 返回的 内容 并修改页面的显示
		                console.log('数据返回成功');
		
		                // 数据是保存在 异步对象的 属性中
		                console.log(ajaxObj.responseText);
		
		                // 修改页面的显示
		                document.querySelector('h1').innerHTML = ajaxObj.responseText;
		            }
		        }
		    }
		</script>

		<script type="text/javascript">
			// 跳转到指定api的详情页面
			function jump(api_name){
				// 跳转到api详情页面，api_name作为参数传递过去
				// window.self.location.href="api.jsp?api_name=" + api_name;
				window.self.location.href="http://www.baidu.com";
			}
		</script>

	</body>

</html>