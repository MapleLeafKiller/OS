<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonArray" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="com.google.gson.JsonParser" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>

<!-- Case列表页面，点击某项Case跳转到其对应的详情页面 -->

<html>
		
	<head>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
		<meta content="text/html; charset=UTF-8">
		<title>API列表页面</title>
		
	</head>
	
	<body>
		
		<%
			// 获取json数据并解析
			request.setCharacterEncoding("utf-8");
			String apiListData = "";
			if(request.getParameter("apiListData")!=null){
				apiListData = request.getParameter("apiListData"); //这里的数据是ajax获得的api列表数据
				apiListData = new String(apiListData.getBytes("iso-8859-1"),"utf-8");
				System.out.print(apiListData);
				// String apiListData = "{\"msg\":\"\",\"code\":0,\"data\":[{\"api_id\":1,\"api_name\":\"creat\",\"api_desc\":\"创建一个新文件\",\"api_func\":\"int creat (const char *path , mode_t mode) ;\",\"api_para\":\"pathname：指向欲建立的文件路径字符串    \\n\\nmode : 指定用户操作权限，S_IS[UG]ID 、S_ISVTX 、\\nS_I[RWX](USR|GRP|0TH)\\n\\r\\n\",\"api_return\":\"若成功，返回为只写打开的文件描述符； 若出错，返回-1\"},{\"api_id\":2,\"api_name\":\"open\",\"api_desc\":\"打开或创建一个文件\",\"api_func\":\"open (const char *pa th, int oflag, ... /* mode_t mode */ ) ;\\r\\n\",\"api_para\":\"O_EXEC只执行打开,\\r\\nO_SEARCH只搜索打开目录,\\r\\nO_APPEND追加写,\\r\\nO_NONBLOCK非阻塞模式,\\r\\nO_SYNC等待写完成（数据和屈性）,\\r\\nO_DSYNC等待写完成（仅数据）,\\r\\nO_RSYNC同步读和写\\r\\nO_FSYNC等待写完成（仅FreeBSD 和Mac OS X),\\r\\nO_ASYNC异步I/0 ( 仅F reeBSD 和Mac OS X)\\r\\n\\r\\nmode : 指定用户操作权限，S_IS[UG]ID 、S_ISVTX 、\\r\\nS_I[RWX](USR|GRP|0TH)\",\"api_return\":\"若成功，返回文件描述符； 若出错，返回-1\\r\\n\"}]}";
				JsonParser parse =new JsonParser();  //创建json解析器
				JsonObject temp=(JsonObject) parse.parse(apiListData);
				// 获取api列表
				JsonArray list=temp.get("data").getAsJsonArray();
				Gson gson = new Gson();
				List apiList = gson.fromJson(list,List.class); //将数据从JsonArray类型转换为list类型
				request.setAttribute("apiList",apiList);
			}
				
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
		
		<!-- 隐藏表单项，结合js:getData函数使得api列表数据可以在java代码中获取 -->
		<form  method="post" action="" name="form1" id="form1"> 
	    	<input type = 'hidden' id = 'apiListData' name="apiListData"> 
	    </form> 

		<!-- 从接口获取api列表数据 -->
		<script type="text/javascript">
		$(document).ready(function(){
			  $.ajax({
				    type:"get",    //请求方式
				    async:true,    //是否异步
				    url:"http://125.216.243.166:8888/all_api",
				    contentType:"application/x-www-form-urlencoded; charset=UTF-8",
				    data:{},    //请求参数

				    success: function(data) {
				        //请求成功处理，和本地回调完全一样
				        alert(123);
				        var apiListData = encodeURI(data);
		                // apiListData = encodeURI(JSON.parse(ajax.responseText));
		                
		                document.form1.elements[0] = apiListData;
		                document.getElementById('form1').submit();
				    },

				    complete: function() {
				        //请求完成的处理
				    },

				});
			});
		</script>

		

		<!-- 跳转到指定api的详情页面 -->
		<script type="text/javascript">
			function jump(api_name){
				// 跳转到api详情页面，api_name以及api列表数据作为参数传递过去
				var param = encodeURI('<%=apiListData%>');
				window.self.location.href="home.jsp?api_name="+api_name+"&apiListData="+apiListData;
			}
		</script>

	</body>

</html>