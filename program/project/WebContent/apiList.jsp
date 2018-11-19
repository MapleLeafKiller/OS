<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonArray" %>
<%@ page import="com.google.gson.JsonIOException" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="com.google.gson.JsonParser" %>
<%@ page import="com.google.gson.JsonSyntaxException" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>

<!-- API列表页面
	 点击某项API跳转到其对应的详细页面 -->

<html>
		
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		
		
			
	</head>
	
	
	
	<body>
		
		<%
			// 获取json数据并解析
			String tempJson = "{\"msg\":\"\",\"code\":0,\"data\":[{\"api_id\":1,\"api_name\":\"creat\",\"api_desc\":\"创建一个新文件\",\"api_func\":\"int creat (const char *path , mode_t mode) ;\",\"api_para\":\"pathname：指向欲建立的文件路径字符串    \\n\\nmode : 指定用户操作权限，S_IS[UG]ID 、S_ISVTX 、\\nS_I[RWX](USR|GRP|0TH)\\n\\r\\n\",\"api_return\":\"若成功，返回为只写打开的文件描述符； 若出错，返回-1\"},{\"api_id\":2,\"api_name\":\"open\",\"api_desc\":\"打开或创建一个文件\",\"api_func\":\"open (const char *pa th, int oflag, ... /* mode_t mode */ ) ;\\r\\n\",\"api_para\":\"O_EXEC只执行打开,\\r\\nO_SEARCH只搜索打开目录,\\r\\nO_APPEND追加写,\\r\\nO_NONBLOCK非阻塞模式,\\r\\nO_SYNC等待写完成（数据和屈性）,\\r\\nO_DSYNC等待写完成（仅数据）,\\r\\nO_RSYNC同步读和写\\r\\nO_FSYNC等待写完成（仅FreeBSD 和Mac OS X),\\r\\nO_ASYNC异步I/0 ( 仅F reeBSD 和Mac OS X)\\r\\n\\r\\nmode : 指定用户操作权限，S_IS[UG]ID 、S_ISVTX 、\\r\\nS_I[RWX](USR|GRP|0TH)\",\"api_return\":\"若成功，返回文件描述符； 若出错，返回-1\\r\\n\"}]}";
			JsonParser parse =new JsonParser();  //创建json解析器
			JsonObject temp=(JsonObject) parse.parse(tempJson);
			// 获取api列表
			JsonArray list=temp.get("data").getAsJsonArray();
			Gson gson = new Gson();
			List apiList = gson.fromJson(list,List.class); //将数据从JsonArray类型转换为list类型
			request.setAttribute("apiList",apiList);
		%>
	
		<!-- api列表：只展示每个api的名字.描述.函数原型信息 -->   
	    <c:forEach items="${apiList}" var="api">
	    	<a href="http://www.baidu.com" style="text-decoration:none;">
	    	<table border="1">
	    		<tr>
	    			<td  rowspan="2">
	        			<c:out value="${api.api_name}"></c:out><br/>
	    			</td>
	    			<td>
	        			<c:out value="${api.api_desc}"></c:out><br/>
	        		</td>
	    		</tr>
	    		<tr>
	    			<td>
	        			<c:out value="${api.api_func}"></c:out><br/>
	        		</td>
	    		</tr>
	    	</table>
	    	</a>
   	    </c:forEach>



	</body>
	<!-- <script>
			var apiListJson = '{"msg":"","code":0,"data":[{"api_id":1,"api_name":"creat","api_desc":"创建一个新文件","api_func":"int creat (const char *path , mode_t mode) ;","api_para":"pathname：指向欲建立的文件路径字符串    \n\nmode : 指定用户操作权限，S_IS[UG]ID 、S_ISVTX 、\nS_I[RWX](USR|GRP|0TH)\n\r\n","api_return":"若成功，返回为只写打开的文件描述符； 若出错，返回-1"},{"api_id":2,"api_name":"open","api_desc":"打开或创建一个文件","api_func":"open (const char *pa th, int oflag, ... /* mode_t mode */ ) ;\r\n","api_para":"O_EXEC只执行打开,\r\nO_SEARCH只搜索打开目录,\r\nO_APPEND追加写,\r\nO_NONBLOCK非阻塞模式,\r\nO_SYNC等待写完成（数据和屈性）,\r\nO_DSYNC等待写完成（仅数据）,\r\nO_RSYNC同步读和写\r\nO_FSYNC等待写完成（仅FreeBSD 和Mac OS X),\r\nO_ASYNC异步I/0 ( 仅F reeBSD 和Mac OS X)\r\n\r\nmode : 指定用户操作权限，S_IS[UG]ID 、S_ISVTX 、\r\nS_I[RWX](USR|GRP|0TH)","api_return":"若成功，返回文件描述符； 若出错，返回-1\r\n"}]}';//JSON字符串
			// 需要对json中的\n \r进行以下处理，否则解析时出错
			apiListJson = apiListJson.replace(/\n/g,"\\\\n").replace(/\r/g,"\\\\r")
			var apiList = JSON.parse(apiListJson); //由JSON字符串转换为JSON对象
			
	</script> -->
</html>