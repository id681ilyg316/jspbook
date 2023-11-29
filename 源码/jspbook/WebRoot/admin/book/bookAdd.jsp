<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.text.SimpleDateFormat" />

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

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

<script type='text/javascript'
	src='<%=path %>/dwr/interface/loginService.js'></script>
<script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>

<script language="javascript">
           var i=0;
           function findAllCatelog()
           {
               if(i==0)
               {
                   document.getElementById("indicator").style.display="block";
                   loginService.catelogAll(callback);
                   i=1;
               }
               
           }
           function callback(data)
           {
        	   alert(data);
               document.getElementById("indicator").style.display="none";
               DWRUtil.addOptions("catelog_id",data,"id","name");
           }
           
           function check()
           {
               if(document.formAdd.catelogId.value==0)
               { 
                   alert("请选择图书类别");
                   return false;
               }
               return true;
           }
        </script>
</head>

<body leftmargin="2" topmargin="9"
	background='<%=path %>/images/allbg.gif'>
	<form action="<%=path %>/book?type=bookAdd" name="formAdd"
		method="post">
		<table width="98%" align="center" border="0" cellpadding="4"
			cellspacing="1" bgcolor="#BBC9E8" style="margin-bottom: 8px">
			<tr bgcolor="#EEF4EA">
				<td colspan="3" class='title'><span>图书添加</span></td>
			</tr>
			<tr align='center' bgcolor="#FFFFFF"
				onMouseMove="javascript:this.bgColor='red';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<td width="25%" bgcolor="#FFFFFF" align="right">图书类别：</td>
				<td width="75%" bgcolor="#FFFFFF" align="left">
					<table border="0">
						<tr>
							<td><select name="catelog_id" id="catelog_id">
									<option value="0">请选择类别</option>
									<c:forEach items="${requestScope.catelogList}" var="catelog">
										<option value="${catelog.id} ">${catelog.name}</option>
									</c:forEach>
							</select></td>
							<td><img id="indicator" src="<%=path %>/img/loading.gif"
								style="display: none" /></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr align='center' bgcolor="#FFFFFF"
				onMouseMove="javascript:this.bgColor='red';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<td width="25%" bgcolor="#FFFFFF" align="right">图书名称：</td>
				<td width="75%" bgcolor="#FFFFFF" align="left"><input
					type="text" name="name" size="20" /></td>
			</tr>
			<tr align='center' bgcolor="#FFFFFF"
				onMouseMove="javascript:this.bgColor='red';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<td width="25%" bgcolor="#FFFFFF" align="right">
					作&nbsp;&nbsp;&nbsp;者：</td>
				<td width="75%" bgcolor="#FFFFFF" align="left"><input
					type="text" name="zuozhe" size="20" /></td>
			</tr>
			<tr align='center' bgcolor="#FFFFFF"
				onMouseMove="javascript:this.bgColor='red';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<td width="25%" bgcolor="#FFFFFF" align="right">出版社：</td>
				<td width="75%" bgcolor="#FFFFFF" align="left"><input
					type="text" name="chubanshe" size="20" /></td>
			</tr>
			<tr align='center' bgcolor="#FFFFFF"
				onMouseMove="javascript:this.bgColor='red';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<td width="25%" bgcolor="#FFFFFF" align="right">出版日期：</td>
				<td width="75%" bgcolor="#FFFFFF" align="left"><input
					name="chubanriqi" type="text"
					value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>" />
				</td>
			</tr>
			<tr align='center' bgcolor="#FFFFFF"
				onMouseMove="javascript:this.bgColor='red';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<td width="25%" bgcolor="#FFFFFF" align="right">图书书号：</td>
				<td width="75%" bgcolor="#FFFFFF" align="left"><input
					type="text" name="isbm" size="20" /></td>
			</tr>
			<tr align='center' bgcolor="#FFFFFF"
				onMouseMove="javascript:this.bgColor='red';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<td width="25%" bgcolor="#FFFFFF" align="right">图书定价：</td>
				<td width="75%" bgcolor="#FFFFFF" align="left"><input
					type="text" name="price" size="20" /></td>
			</tr>
			<tr align='center' bgcolor="#FFFFFF"
				onMouseMove="javascript:this.bgColor='red';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<td width="25%" bgcolor="#FFFFFF" align="right">图书页码：</td>
				<td width="75%" bgcolor="#FFFFFF" align="left"><input
					type="text" name="yeshu" size="20" /></td>
			</tr>
			<tr align='center' bgcolor="#FFFFFF"
				onMouseMove="javascript:this.bgColor='red';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<td width="25%" bgcolor="#FFFFFF" align="right">库存数量：</td>
				<td width="75%" bgcolor="#FFFFFF" align="left"><input
					type="text" name="kucun" size="20" /></td>
			</tr>
			<tr align='center' bgcolor="#FFFFFF"
				onMouseMove="javascript:this.bgColor='red';"
				onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
				<td width="25%" bgcolor="#FFFFFF" align="right">&nbsp;</td>
				<td width="75%" bgcolor="#FFFFFF" align="left"><input
					type="submit" value="提交" onclick="return check()" />&nbsp; <input
					type="reset" value="重置" />&nbsp;</td>
			</tr>
		</table>
	</form>
</body>
</html>
