
<%@page import="java.sql.*"%>
<!-- <%//@page import="com.mysql,jdbc.Driver"%> -->
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">        
        <title>Login</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form method="post" action="login.jsp">
                        <div class="form-group">
                            <label>Usuario</label>
                            <input type="text" class="form-control" name="user" placeholder="Usuario">
                        </div>
                        <div class="form-group">
                            <label>Constraseña</label>
                            <input type="password" class="form-control" name="password" placeholder="Contraseña">
                        </div>
                        <button type="submit" class="btn btn-primary" name="login">Login</button>
                    </form> 
                    <%
                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;

                        if (request.getParameter("login") != null) {
                            String user = request.getParameter("user");
                            String password = request.getParameter("password");
                            HttpSession sesion = request.getSession();
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp?user=root&password=");
                                st = con.createStatement();
                                rs = st.executeQuery(" SELECT * FROM `user` where user='" + user + "' and password='" + password + "'; ");
                                while (rs.next()) {
                                    sesion.setAttribute("logeado", "1");
                                    sesion.setAttribute("user", rs.getString("user"));
                                    sesion.setAttribute("id", rs.getString("id"));
                                    response.sendRedirect("index.jsp");
                                }
                                out.print(" <div class=\"alert alert-danger\" role=\"alert\">Usuario No encontrado </div>");
                            } catch (Exception e) {
                            }
                        }

                        /* if (request.getParameter("login") != null) {
           String user = request.getParameter("user");
           String password = request.getParameter("password");
           //propiedad jsp para generar un login
           HttpSession sesion = request.getSession();
           if (user.equals("admin") && password.equals("admin")) {
           sesion.setAttribute("logeado","1");
           sesion.setAttribute("user",user);
           response.sendRedirect("index.jsp");
           }
           else{
               out.print("revisa tu contraseña o usuario");
            
           }
       }*/

                    %>
                </div>
            </div>
        </div>
    </body>
</html>
