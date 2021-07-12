<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
	String id = request.getParameter("id");
%>
<!--<sql:setDataSource var="dataSource"	url="jdbc:mysql://localhost:3306/PorscheDB"
	driver="com.mysql.jdbc.Driver" user="root" password="1234" />-->
	
<sql:setDataSource var="dataSource"	url="jdbc:mysql://3.128.196.84:3306/PorscheDB"
	driver="com.mysql.jdbc.Driver" user="ha" password="1234" />

<sql:update dataSource="${dataSource}" var="resultSet">
   DELETE FROM member WHERE id = ?
   <sql:param value="<%=id%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:redirect url="resultMember.jsp" />
</c:if>

