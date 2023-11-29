<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>





<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>登陆页面</title>
<!-- 调用CSS，JS -->
<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	background-image: url(<%=path %>/images/login1_08.gif);
	background-repeat: repeat-x;
	margin-bottom: 0px;
	font-family: "宋体";
	font-size: 12px;
	line-height: 1.5;
	font-weight: normal;
	color: #546D87;
	background-color: #BBD9F5;
}
-->
</style>
        
	<script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
        
		<script language="javascript">
		function check1()
		{                                                                                         
		     if(document.ThisForm.userName.value=="")
			 {
			 	alert("请输入用户名");
				document.ThisForm.userName.focus();
				return false;
			 }
			 if(document.ThisForm.userPw.value=="")
			 {
			 	alert("请输入密码");
				document.ThisForm.userPw.focus();
				return false;
			 }
			 document.getElementById("indicator").style.display="block";
			 loginService.login(document.ThisForm.userName.value,document.ThisForm.userPw.value,0,callback);
		}
		
		function callback(data)
		{
		    document.getElementById("indicator").style.display="none";
		    if(data=="no")
		    {
		        alert("用户名或密码错误");
		    }
		    if(data=="yes")
		    {
		        alert("通过验证,系统登录成功");
		        window.location.href="<%=path %>/loginSuccess.jsp";
		    }
		    
		}
	    </script>
</head>
<body>
<table width="990" height="650" border="0"  align="center"  cellpadding="0" cellspacing="0">
  <tr>
    <td width="318" valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="299" align="right"><img src="<%=path %>/images/login1_01.gif" width="318" height="299" /></td>
        </tr>
        <tr>
          <td height="351" align="right"><img src="<%=path %>/images/login1_04.gif" width="318" height="351" /></td>
        </tr>
      </table>
    </td>
    <td width="366" valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="299" background="<%=path %>/images/login_6.gif">&nbsp;</td>
        </tr>
        <tr>
          <td height="96" valign="top" background="<%=path %>/images/login_9.gif">
            
            
            
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <FORM name="ThisForm" action="<%=path %>/adminLogin.action" method=post>
              <tr>
                <td width="25%" height="25">&nbsp;</td>
                <td width="48%" valign="top">
                  <label>
                  <input name="userName" type="text" class="txt" size="25" />
                  </label>
                </td>
                <td width="27%" rowspan="2"> <a href="#"  onClick="check1()"><img src="images/login_2.gif" width="57" height="55" border="0" /></a></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>
                  <input name="userPw" type="password" class="txt" size="25" />
                </td>
              </tr>
              <tr>
                <td height="36">&nbsp;</td>
                <td><img id="indicator" src="<%=path %>/images/loading.gif" style="display:none"/></td>
                <td>&nbsp;</td>
              </tr>
            </form>
            </table>
            
          </td>
        </tr>
        <tr>
          <td height="255" background="images/login1_07.gif">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="129">&nbsp;</td>
              </tr>
              
            </table>
          </td>
        </tr>
      </table>
    </td>
    <td width="318" valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="299" align="left" background="<%=path %>/images/login1_03.gif">&nbsp;</td>
        </tr>
        <tr>
          <td height="351" align="left" background="<%=path %>/images/login1_06.gif">&nbsp;</td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</html>









