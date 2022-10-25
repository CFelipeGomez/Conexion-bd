<%-- 
    Document   : index
    Created on : 9/10/2022, 2:54:10 p. m.
    Author     : fepip
--%>

<%@page import="java.sql.*"%>
<!-- <%//@page import="com.mysql,jdbc.Driver"%> -->
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Lista de empleados</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logeado") == null || sesion.getAttribute("logeado").equals("0")) {
                response.sendRedirect("login.jsp");
            }

            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>
        <div class="container">
            <nav class="navbar bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand">Gestion</a>
                    <form class="d-flex" role="search" action="logout.jsp">
                        <a href="datosUsuario.jsp"><i class="fa fa-user-circle"aria-hidden="true "></i><%= sesion.getAttribute("user")  %></a> 
                        <button class="btn btn-outline-danger ml-3" type="submit">Logout</button>
                    </form>
                </div>
            </nav>
            <div class="row mt-2">
                <div class="col-sm">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col" colspan="4" class="text-center">Estudiante</th>
                                <th scope="col">
                                    <a href="crear.jsp"> <i class="fa fa-user-plus" aria-hidden="true"></i></a>
                                </th>

                            </tr>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Direccion</th>
                                <th scope="col">Telefono</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                try {
                                    Class.forName("com.mysql.cj.jdbc.Driver");
                                    con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp?user=root&password=");
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM `empledos`;");
                                    while (rs.next()) {
                            %>
                            <tr>
                                <th scope="row"><%= rs.getString(1)%></th>
                                <td><%= rs.getString(2)%></td>
                                <td><%= rs.getString(3)%></td>
                                <td><%= rs.getString(4)%></td>
                                <td>
                                    <a href="editar.jsp?id=<%= rs.getString(1)%>&nombre=<%= rs.getString(2)%>&direccion=<%= rs.getString(3)%>&telefono=<%= rs.getString(4)%>"<i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>                            
                                    <a href="borrar.jsp?id=<%= rs.getString(1)%>" class="ml-3" ><i class="fa fa-trash" aria-hidden="true"></i></a>
                                </td>
                            </tr>

                            <%
                                    }
                                } catch (Exception e) {
                                    out.print("ERROR MySQL" + e);
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
    </body>
</html>
