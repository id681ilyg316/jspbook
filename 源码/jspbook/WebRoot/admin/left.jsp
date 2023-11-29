<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>管理页面</title>
<!-- 调用CSS，JS -->
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: "宋体";
	font-size: 12px;
	color: #333333;	background-color: #2286C2;

}
-->
</style>
	<link rel="StyleSheet" href="<%=path %>/css/dtree.css" type="text/css" />
	<script type="text/javascript" src="<%=path %>/js/dtree.js"></script>
</head>
<body>
<table width="100%" height="100%" border="0" cellspacing="10" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF" height="600PX"  style="padding-left:10px; padding-top:10px">
    
    
    
   <script type="text/javascript">
							<c:if test="${sessionScope.userType==0}">
											    
														d = new dTree('d');
										        d.add(0,-1,'功能菜单');
												
												d.add(1,0,'基本操作','#');
												d.add(11,1,'密码修改','<%=path %>/admin/userinfo/userPw.jsp','','I2');
												d.add(12,1,'管理员管理','<%=path %>/admin?type=adminMana','','I2');
												
												d.add(2,0,'图书类别管理','#');
												        d.add(21,2,'类别添加','<%=path %>/admin/catelog/catelogAdd.jsp','','I2');
												        d.add(22,2,'类别管理','<%=path %>/catelog?type=catelogMana','','I2');
												
												
												d.add(3,0,'图书管理','#');
														d.add(31,3,'图书添加','<%=path %>/book?type=bookAddPre','','I2');
														d.add(32,3,'图书管理','<%=path %>/book?type=bookMana','','I2');
												
												d.add(4,0,'读者管理','#');
												        d.add(41,4,'读者添加','<%=path %>/admin/user/userAdd.jsp','','I2');
												        d.add(42,4,'读者管理','<%=path %>/user?type=userMana','','I2');
											
											
											
												d.add(5,0,'借阅管理','#');
												        d.add(51,5,'借阅添加','<%=path %>/admin/jieyue/jieyueAdd.jsp','','I2');
												        d.add(52,5,'借阅管理','<%=path %>/jieyue?type=jieyueMana','','I2');
												        d.add(53,5,'归还管理','<%=path %>/jieyue?type=jieyue_huanshu_pre','','I2');
												document.write(d);
      	 </c:if>	
				
				
							<c:if test="${sessionScope.userType==1}">
											    
														d = new dTree('d');
										        d.add(0,-1,'功能菜单');
												
												d.add(1,0,'基本操作','#');
												d.add(11,1,'密码修改','<%=path %>/admin/userinfo/userPw.jsp','','I2');
												
												d.add(2,0,'读者管理','#');
												        d.add(21,2,'读者添加','<%=path %>/admin/user/userAdd.jsp','','I2');
												        d.add(22,2,'读者管理','<%=path %>/user?type=userMana','','I2');
											
											
											
												d.add(3,0,'借阅管理','#');
												        d.add(31,3,'借阅添加','<%=path %>/admin/jieyue/jieyueAdd.jsp','','I2');
												        d.add(32,3,'借阅管理','<%=path %>/jieyue?type=jieyueMana','','I2');
												        d.add(33,3,'归还管理','<%=path %>/jieyue?type=jieyue_huanshu_pre','','I2');
												document.write(d);
      	 </c:if>	
										   </script>
    </td>
  </tr>
</table>
		
	</body>
</html>
