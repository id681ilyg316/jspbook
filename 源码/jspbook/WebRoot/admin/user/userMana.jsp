<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
		
        <script language="javascript">
           function userDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/user?type=userDel&id="+id;
               }
           }
           function userAdd()
           {
                 var url="<%=path %>/admin/user/userAdd.jsp";
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#BBC9E8" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="8"  class='title'>&nbsp;读者管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FFFFFF" height="22">
					<td width="12%">借书证号</td>
					<td width="12%">姓名</td>
					<td width="12%">性别</td>
					<td width="12%">年龄</td>
					<td width="16%">住址</td>
					<td width="12%">联系方式</td>
					<td width="12%">E-mail</td>
					<td width="12%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.userList}" var="user">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
					    ${user.jiehao }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${user.name }
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   ${user.sex }
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${user.age }
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${user.address }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${user.tel }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${user.email }
					</td>
					<td  bgcolor="#FFFFFF" align="center">
						<a href="#" onclick="userDel(${user.id })" class="pn-loperator">删除</a>
					</td>
				</tr>
				</c:forEach>
			</table>
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			 <TR align="right">
              <TD ><form action="" name="formpage">
                  <input type="hidden" name="pageCount" value="${requestScope.pagecount}" />
                  <!--//用于给上面javascript传值-->
                  <input type="hidden" name="page" value="${requestScope.page}" />
                  <!--//用于给上面javascript传值-->
                  <input type="hidden" name="jumpurl" value="<%=path%>/user?type=userMana&" />
                  <!--//用于给上面javascript传值--> 
                  <a href="#" onClick="PageTop()"><strong>首页</strong></a>&nbsp;&nbsp;&nbsp; 
                  <a href="#" onClick='PagePre()'><strong>上一页</strong></a>&nbsp;&nbsp;&nbsp;
                  共${requestScope.cou}条记录,
                  共计${requestScope.pagecount}页,
                  当前第${requestScope.page}页&nbsp;&nbsp;&nbsp; 
                  <a href="#" onClick="PageNext()"><strong>下一页</strong></a>&nbsp;&nbsp;&nbsp; 
                  <a href="#" onClick="PageLast()"><strong>尾页</strong></a> 第
                  <input name="busjump" type="text" size="3" value="${requestScope.page}" style=" width:15px"/>
                  页<a href="#" onClick="bjump()"><strong>跳转</strong></a>&nbsp;&nbsp;&nbsp;
                </form>
                <script type="text/javascript" src="<%=path%>/js/page.js"></script></TD>
            </TR>
		    </table>
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="userAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
