<%@ page language="java" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.util.Date"/>
<jsp:directive.page import="java.text.SimpleDateFormat"/>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
        
        <link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
        
		<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
        
        <script language="javascript">
        function setUser(user_id){
    		 document.getElementById('user_id').value = user_id;
   		 
   }
        function setBook(book_id){
    		 document.getElementById('book_id').value = book_id;
   		 
   }
            function userAll()
		    {
		       	var strUrl = "<%=path %>/user?type=userAll";
				var ret = window.open(strUrl,"","dialogWidth:800px; dialogHeight:400px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
			    if(ret==undefined)
			    {
			       ret="";
			    }
			    document.getElementById("user_id").value=ret;
		    }
		    
		    function catelogAll()
		    {
		       	var strUrl = "<%=path %>/catelog?type=catelogAll";
				var ret = window.open(strUrl,"","dialogWidth:900px; dialogHeight:400px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
			    if(ret==undefined)
			    {
			       ret="";
			    }
			    document.getElementById("book_id").value=ret;
		    }
		    
		    
		    function check()
		    {
		        if(document.getElementById("user_id").value=="")
		        {
		            alert("请选择读者");
		            return false;
		        }
		        if(document.getElementById("book_id").value=="")
		        {
		            alert("请选择图书");
		            return false;
		        }
		        if(document.getElementById("jieyueshuliang").value=="")
		        {
		            alert("请输入借阅数量");
		            return false;
		        }
		    } 
		    
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/images/allbg.gif'>
			<form action="<%=path %>/jieyue?type=jieyueAdd" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#BBC9E8" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3"   class='title'><span>图书借阅</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         读者：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="user_id" id="user_id" readonly/>
						        <input type="button" value="选择" onClick="userAll()"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         图书：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="book_id" id="book_id" readonly/>
						        <input type="button" value="选择" onClick="catelogAll()"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         借阅数量：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="jieyueshuliang" id="jieyueshuliang" onpropertychange="onchange1(this.value)" onKeyUp="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         借阅时间：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input name="jieyueShijian" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date()) %>" type="text" />
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">&nbsp;
						        
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <input type="hidden" name="userId" value="<%=request.getParameter("userId") %>"/>
						       <input type="submit" value="提交" onClick="return check()"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
