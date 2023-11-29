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
           function bookDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/book?type=bookDel&id="+id;
               }
           }
           
           function bookAdd()
           {
                 var url="<%=path %>/admin/book/bookAdd.jsp";
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
					<td height="14" colspan="10"  class='title'>&nbsp;图书管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FFFFFF" height="22">
					<td width="10%">图书名称</td>
					<td width="10%">作者</td>
					<td width="10%">出版社</td>
					<td width="10%">出版日期</td>
					<td width="10%">图书书号</td>
					<td width="10%">图书定价</td>
					<td width="10%">图书页码</td>
					<td width="10%">库存数量</td>
					<td width="10%">操作</td>
		        </tr>	
				<c:forEach items="${requestScope.bookList}" var="book">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${book.name }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${book.zuozhe }
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${book.chubanshe }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${book.chubanriqi }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${book.isbm }
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    ${book.price }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${book.yeshu }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${book.kucun }
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a href="#" onclick="bookDel(${book.id })" class="pn-loperator">删除</a>
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
                  <input type="hidden" name="jumpurl" value="<%=path%>/book?type=bookMana&" />
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
			      <input type="button" value="添加" style="width: 80px;" onclick="bookAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
