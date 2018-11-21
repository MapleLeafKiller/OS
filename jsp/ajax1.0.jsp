<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
</head>

<body>
	<select id="api_list"></select>
	<script>
		$(document).ready(function() {
		 	getApiList(); //页面加载时调用函数，获取api列表信息
		});
		/* 
			获取api列表信息
		*/
		function getApiList(){
			$.ajax({
		    	url : "http://125.216.243.166:8888/all_api",
		        type : 'get', 
		        dataType : 'json', 
		        success : function (res) { 
                    var apiListData = res.data;
                    /*
                    	遍历api列表数据,对每一个api,生成一个table展示它的信息,用并一个超链接将这个table包裹起来
                    	如此,点击一个api时就能跳转到超链接指定的该api的详情页面
                    */
        		    for(var i = 0;i < apiListData.length; i++){ //遍历一下json数据 
        			    var table = getTable(apiListData[i]);
        			    // 设置超链接并包裹table
        		    	var link = document.createElement("a");
        		    	var api_name = apiListData[i].api_name;
        		    	// 设置跳转的页面:api详细页面(参数为api名)
        		    	// link.href="apiDetail.jsp?api_name="+api_name; 
        		    	link.href="http://www.baidu.com";
        		    	link.appendChild(table); //用超链接包裹table,点击table就可以跳转
        		    	link.style="text-decoration:none;" //设置超链接不显示下划线
        			    document.body.appendChild(link); //放到页面上
        		    }
		        } 
			}); 
		}
		/*
			定义一个表格,在表格中展示api的信息
		*/
		function getTable(api){
			var table = document.createElement("table");
			var row1 = document.createElement('tr');
			// 第一列数据放api的描述
		    var nameCell = document.createElement('td');
		    nameCell.innerHTML = JSON.stringify(api.api_name); //注意:要使用JSON.stringify()取数据
		    row1.appendChild(nameCell);
			// 第一列数据放api的描述
		    var descCell = document.createElement('td');
		    descCell.innerHTML = JSON.stringify(api.api_desc); //注意:要使用JSON.stringify()取数据
		    row1.appendChild(descCell);
		 	// 第二列数据放api的函数原型
		    var funcCell = document.createElement('td');
		    funcCell.innerHTML = JSON.stringify(api.api_func); 
		    row1.appendChild(funcCell); 
		    
			table.appendChild(row1); 
		    return table;
		}
	</script>　
	
</body>

</html>