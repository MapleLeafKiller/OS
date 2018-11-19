<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- API列表页面
	 点击某项API跳转到其对应的详细页面 -->

<html>
		
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		
		
			
	</head>
	
	
	
	<body>
			
			123
			<p id="demo">一个段落</p>
			
	
		<script>
			var apiListJson = '{"msg":"","code":0,"data":[{"api_id":1,"api_name":"creat","api_desc":"创建一个新文件","api_func":"int creat (const char *path , mode_t mode) ;","api_para":"pathname：指向欲建立的文件路径字符串    \n\nmode : 指定用户操作权限，S_IS[UG]ID 、S_ISVTX 、\nS_I[RWX](USR|GRP|0TH)\n\r\n","api_return":"若成功，返回为只写打开的文件描述符； 若出错，返回-1"},{"api_id":2,"api_name":"open","api_desc":"打开或创建一个文件","api_func":"open (const char *pa th, int oflag, ... /* mode_t mode */ ) ;\r\n","api_para":"O_EXEC只执行打开,\r\nO_SEARCH只搜索打开目录,\r\nO_APPEND追加写,\r\nO_NONBLOCK非阻塞模式,\r\nO_SYNC等待写完成（数据和屈性）,\r\nO_DSYNC等待写完成（仅数据）,\r\nO_RSYNC同步读和写\r\nO_FSYNC等待写完成（仅FreeBSD 和Mac OS X),\r\nO_ASYNC异步I/0 ( 仅F reeBSD 和Mac OS X)\r\n\r\nmode : 指定用户操作权限，S_IS[UG]ID 、S_ISVTX 、\r\nS_I[RWX](USR|GRP|0TH)","api_return":"若成功，返回文件描述符； 若出错，返回-1\r\n"}]}';//JSON字符串
			// 需要对json中的\n \r进行以下处理，否则解析时出错
			apiListJson = apiListJson.replace(/\n/g,"\\\\n").replace(/\r/g,"\\\\r")
			var apiList = JSON.parse(apiListJson); //由JSON字符串转换为JSON对象
			alert(apiList.data[0].api_desc);
		</script>
	</body>
	
</html>