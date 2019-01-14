<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="oracle.jdbc.driver.DBConversion"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터베이스 정보
	final String HOST = "jdbc:mysql://192.168.0.126:3306/chhak";
	final String USER = "chhak";
	final String PASS = "1234";

	// 1단계 - JDBC 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계 - DB접속
	Connection conn = DriverManager.getConnection(HOST, USER, PASS);
	
	// 3단계 - 쿼리실행 객체 생성
	Statement stmt = conn.createStatement();
	
	// 4단계 - 쿼리실행
	ResultSet rs = stmt.executeQuery("SELECT * FROM `JSP_TERMS`");
	
	// 5단계 - 결과셋 처리(SELECT 경우)
	String terms 	= null;
	String privacy 	= null;
	
	if(rs.next()){
		terms 	= rs.getString(1);
		privacy = rs.getString(2);
	}
	
	// 6단계 - DB자원 해제
	rs.close();
	stmt.close();
	conn.close();
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>terms</title>
		<link rel="stylesheet" href="./css/style.css" />		
	</head>

	<body>
		<div id="terms">
			<section>
				<table>
					<caption>사이트 이용약관</caption>
					<tr>
						<td>
							<textarea readonly><%= terms %></textarea>
							<div>
								<label><input type="checkbox" name="chk1" />&nbsp;동의합니다.</label>        
							</div>
						</td>
					</tr>
				</table>
			</section>			
			<section>
				<table>
					<caption>개인정보 취급방침</caption>
					<tr>
						<td>
							<textarea readonly><%= privacy %></textarea>
							<div>
								<label><input type="checkbox" name="chk2" />&nbsp;동의합니다.</label>        
							</div>
						</td>
					</tr>
				</table>
			</section>
			
			<div>
				<a href="#" class="btnCancel">취소</a>
				<a href="#" class="btnNext">다음</a>
			</div>
			
		</div>
	</body>
</html>










