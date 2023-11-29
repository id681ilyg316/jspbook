<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!-- 调用CSS，JS -->
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
		var preFrameW = '220,*';
		var FrameHide = 0;
		var curStyle = 1;
		var totalItem = 9;
		function ChangeMenu(way){
			var addwidth = 10,
				  fcols = [],
				  //  btFrame = window.parent.document.getElementsByName("btFrame")[0];
				  // btFrame = window.parent.document.getElementById( 'btFrame' ); 
				  btFrame = window.parent.document.getElementById( "btFrame" );    
		   if ( way == 1 ) {
				  addwidth = 10;
			  } else if ( way == -1) {
				  addwidth = -10;
			  } else if ( way == 0) {
				  if ( FrameHide == 0 ) {
					  preFrameW = btFrame.cols;
					  btFrame.cols = '0,*';
					  FrameHide = 1;
					  return;
				  } else {
					  btFrame.cols = preFrameW;
					  FrameHide = 0;
					  return;
				  }
			  }
			  fcols = btFrame.cols.split( ',' );
			  fcols[0] = parseInt( fcols[0] ) + addwidth;
			  btFrame.cols = fcols[0] + ',*';
		}
	    function logout()
		{
		   if(confirm("确定要退出本系统吗??"))
		   {
			   window.parent.location="<%=path %>/login.jsp";
		   }
		}
	</script>
	
	<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	background-color: #2286C2;
}
-->
</style>
</head>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="74" colspan="2" background="<%=path %>/images/index1_03.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="33%" rowspan="2"><img src="<%=path %>/images/index1_01.gif" width="253" height="74" /></td>
          <td width="6%" rowspan="2">&nbsp;</td>
          <td width="61%" height="38" align="right"><table width="220" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="center" > <SCRIPT>setInterval("clock.innerHTML=new Date().getMonth()+1+'月'+new Date().getDate()+'日 '+new Date().getHours()+':'+new Date().getMinutes()+':'+new Date().getSeconds();",1000)</SCRIPT><SPAN id=clock></SPAN>&nbsp;&nbsp;&nbsp;</td>
               
              </tr>
            </table></td>
        </tr>
        <tr>
          <td align="right"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="right" class="font2" style="padding-right:10px">&nbsp;当前登录用户：<c:if test="${sessionScope.userType==0}">
											    系统管理员
											 </c:if>
											 <c:if test="${sessionScope.userType==1}">
											     普通管理员
											 </c:if>
											 &nbsp;&nbsp;&nbsp;|&nbsp;<a href="<%=path %>/admin/userinfo/userPw.jsp" class="font2" target="I2">密码修改</a>
				
				&nbsp;|&nbsp;	<a href="javascript:ChangeMenu(0);"  class="font2">显示主框架</a> 
				&nbsp;|&nbsp;	<a href="#" class="font2"  onClick="logout()">退出</a>&nbsp;
				
				
				</td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
   
  
</table></body>
</html>

	
