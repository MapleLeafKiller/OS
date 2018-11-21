<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.google.gson.JsonArray" %>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="com.google.gson.JsonParser" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>

<!-- case列表页面,点击某项case跳转到其对应的详情页面 
	   不使用ajax获取数据,数据由转发到此页面的超链接中以参数形式给出
-->

<html>
		
	<head>
		<meta content="text/html; charset=UTF-8">
		<title>case列表页面</title>
		
	</head>
	
	<body>
		
		<%
			/* 	
				获取json数据并解析
			*/
			// String caseListData = request.getParameter("caseListData"); //数据由转发到此页面的超链接中以参数形式给出
			String caseListData = "{\"msg\": \"\", 	\"code\": 0, 	\"data\": [{ 		\"case_id\": 1, 		\"case_name\": \"用于测试对其标准输入能否设置偏移量\", 		\"case_code\": \"\\\"#include \\\"\\\"apue .h\\\"\\\"\\nint main{void)\\n{\\n     if (lseek (STDIN_FILENO, 0 , SEEK_CUR) == -1)\\n            printf (\\\"\\\" cannot seek\\\\n \\\"\\\");\\n     else\\n            printf (\\\"\\\" seek OK\\\\ n\\\"\\\") ;\\n     exit(0);\\n}\\\"\\r\\n\" 	}, { 		\"case_id\": 2, 		\"case_name\": \"创建一个具有空洞的文件\", 		\"case_code\": \"\\\"#include \\\"\\\"apue.h\\\"\\\"\\n#include <fcntl.h>\\n\\nchar buf1[] = \\\"\\\"abcdefghij\\\"\\\";\\nchar buf2[] = \\\"\\\"abcdefghij\\\"\\\";\\n\\nint main(void)\\n{\\n    int fd;\\n\\n    if((fd = creat(\\\"\\\"file.hole\\\"\\\", FILE_MODE)) < 0)\\n        err_sys(\\\"\\\"creat error\\\"\\\");\\n\\n    if(write(fd, buf1,10) != 10)\\n        err_sys(\\\"\\\"buf1 write error\\\"\\\");\\n    /* offset now = 10*/\\n\\n    if(lssek(fd, 16384, SEEK_SET) == -1)\\n        err_sys(\\\"\\\"lseek error\\\"\\\");\\n    /*offset now = 16384*/\\n\\n    if(write(fd, buf2, 10))\\n        err_sys(\\\"\\\"buf2 write error\\\"\\\");\\n    /* offset now = 16394*/\\n\\n    exit(0);\\n}\\\"\\r\\n\" 	}] }";
			
			JsonParser parse =new JsonParser();  //创建json解析器
			JsonObject temp=(JsonObject) parse.parse(caseListData);
			JsonArray list=temp.get("data").getAsJsonArray();
			Gson gson = new Gson();
			List caseList = gson.fromJson(list,List.class); //将数据从JsonArray类型转换为list类型
			request.setAttribute("caseList",caseList); //将caseList设置在request域中,这样转发时可以获取
			request.setCharacterEncoding("utf-8"); //设置参数编码
		%>
		
	
		<!-- case列表,每一个case以表格形式展现,并用超链接包裹,点击可跳转至详情页面 -->
		<c:forEach items="${caseList}" var="caseI"><!-- 这里的循环变量不能写case,因为case是jsp关键字 -->
			<a href="javascript:jump('${caseI.case_name}')" style="text-decoration:none;">
				<table>
		    		<tr>
		    			<td  rowspan="2"><!-- case名称 -->
		        			<p><font size="25">${caseI.case_name}&nbsp;&nbsp;</font></p>
		    			</td>
		    		</tr>
		    	</table>
			</a>
		</c:forEach>

		<!-- 跳转到指定case的详情页面 -->
		<script type="text/javascript">
			function jump(case_name){
				// 跳转到case详情页面，case_name以及case列表数据作为参数传递过去
				var param = encodeURI('<%=caseListData%>');
				// window.self.location.href="caseDetail.jsp?case_name="+case_name+"&caseListData="+param;
				window.self.location.href="http://www.baidu.com";
			}
		</script>

	</body>

</html>