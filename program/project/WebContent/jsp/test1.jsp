<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!-- <table width="600" border="1" cellspacing="0">
	<thead> 
	<tr> 
		<th>编号</th> 
	    <th>姓名</th> 
	</tr>  
	</thead> 
	<tbody id="tbMain"></tbody> 
	</table> -->
	<script>
		$(document).ready(function() {
		 	getApiList();
		});
		function getApiList(){
			$.ajax({
				async: false,
		    	url : "http://125.216.243.166:8888/all_api",  //your actual url
		        type : 'get', 
		        dataType : 'json', 
		        success : function (res) { 
                    var apiListData = res.data;
                    /* for(var i=0;i<apiListData.length;i++){
                    	alert(JSON.stringify(apiListData[i]));
                    } */
                    var tbody = document.getElementById('tbMain'); 
        		    for(var i = 0;i < apiListData.length; i++){ //遍历一下json数据 
        		    	//  trow1 = getDataRow1(apiListData[i]); //定义一个方法,返回tr数据
					 	//  trow2 = getDataRow2(apiListData[i]); //定义一个方法,返回tr数据
        			    var table = getTable(apiListData[i]);
        			    
        		    	var x = document.createElement("a");
        		    	var api_name = apiListData[i].api_name; //JSON.stringify(apiListData[i].api_name)
        		    	x.href="home.jsp?api_name="+api_name;
        			    x.appendChild(table);
        			    x.style="text-decoration:none;"
        			    document.body.appendChild(x);
        		    }
		        } 
			}); 
		}
		function getTable(h){
			var table = document.createElement("table");
			
			var row1 = document.createElement('tr'); //创建行 
		    var descCell = document.createElement('td'); //创建第一列
		    descCell.innerHTML = JSON.stringify(h.api_desc); //填充数据 
		    row1.appendChild(descCell); //加入行 ，下面类似 
		    var funcCell = document.createElement('td');//创建第二列
		    funcCell.innerHTML = JSON.stringify(h.api_func); 
		    row1.appendChild(funcCell); 
		    
			
			table.appendChild(row1); 
		    
		    return table;
		}
		function getDataRow1(h){ 
			var row = document.createElement('tr'); //创建行 
		    var nameCell = document.createElement('td'); //创建第一列
		    nameCell.innerHTML = JSON.stringify(h.api_name); //填充数据 
		    row.appendChild(nameCell); //加入行 ，下面类似 
		    var descCell = document.createElement('td');//创建第二列
		    descCell.innerHTML = JSON.stringify(h.api_desc); 
		    row.appendChild(descCell); 
		    return row; //返回tr数据   
		} 
		function getDataRow2(h){ 
			var row = document.createElement('tr'); //创建行 
		    var nameCell = document.createElement('td'); //创建第一列
		    nameCell.innerHTML = JSON.stringify(h.api_name); //填充数据 
		    row.appendChild(nameCell); //加入行 ，下面类似 
		    var funcCell = document.createElement('td');//创建第二列
		    funcCell.innerHTML = JSON.stringify(h.api_func); 
		    row.appendChild(funcCell); 
		    return row; //返回tr数据   
		} 
	</script>　
	
</body>
</html>