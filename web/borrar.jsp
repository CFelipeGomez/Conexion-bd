<%-- 
    Document   : borrar
    Created on : 19/10/2022, 11:23:46 a. m.
    Author     : fepip
--%>

<%@page import="java.sql.*"%>
<%//@page import="com.mysql,jdbc.Driver"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp?user=root&password=");
                st = con.createStatement();
                st.executeUpdate("delete FROM empledos where id='"+request.getParameter("id") +"';");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }catch (Exception e){
               out.print(e);
            }
        %>
    </body>
</html>
