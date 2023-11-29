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
		<script type="text/javascript" src="<%=path %>/js/popup_shuaxin.js"></script>
        <script language="javascript">
            function jieyue_huanshu(id)
            {
                var url="<%=path %>/admin/jieyue/jieyue_huanshu.jsp?id="+id;
                var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
	            pop.setContent("contentUrl",url);
	            pop.setContent("title","图书归还");
	            pop.build();
	            pop.show();
            }
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/img/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#BBC9E8" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="30" class='title'> 还书管理&nbsp;</td>
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
						${jieyue.shifouguihuan}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						${jieyue.guihuanshijian}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="button" value="还书" onclick="jieyue_huanshu(${jieyue.id})"/>
					</td>
				</tr>
				</c:forEach>
			</table>
	</body>
</html>
