<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	String vehicleId = request.getParameter("id");	
	PreparedStatement pstmt = null;	
	ResultSet rs = null;
	
	String sql = "select * from vehicle";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();

	if (rs.next()) {
		sql = "delete from vehicle where v_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vehicleId);
		pstmt.executeUpdate();
	} else
		out.println("일치하는 차량이 없습니다");
	
	if (rs != null)
		rs.close();
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
	
 	response.sendRedirect("editVehicle.jsp?edit=delete");
%>