<%@ page language="java" pageEncoding="UTF-8"%>

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
           function jieyueDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/jieyue?type=jieyueDel&id="+id;
               }
           }
           
           function jieyueAdd()
           {
                 var url="<%=path %>/admin/jieyue/jieyueAdd.jsp";
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#BBC9E8" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="30" class='title'>&nbsp;借阅管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FFFFFF" height="22">
					<td width="10%">图书</td>
					<td width="10%">读者</td>
					<td width="10%">借阅数量</td>
					<td width="10%">借阅时间</td>
					<td width="10%">是否归还</td>
					<td width="10%">归还时间</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.jieyueList}" var="jieyue">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${jieyue.book.name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${jieyue.user.name}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${jieyue.jieyueshuliang}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${jieyue.jieyueshijian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<c:if test="${jieyue.shifouguihuan=='是'}">
						    ${jieyue.shifouguihuan}
						</c:if>
						<c:if test="${jieyue.shifouguihuan=='否'}">
						    <font color="red">${jieyue.shifouguihuan}</font>
						</c:if>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${jieyue.guihuanshijian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="删除" onclick="jieyueDel(${jieyue.id})"/>
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
                  <input type="hidden" name="jumpurl" value="<%=path%>/jieyue?type=jieyueMana&" />
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
			      <input type="button" value="添加" style="width: 80px;" onclick="jieyueAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
