<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    if (request.getParameter("submit") != null) {
        String id = request.getParameter("id");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");

        Connection con;
        PreparedStatement pat;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/student", "root", "");
        pat = con.prepareStatement("update records set fname = ?,lname = ?, course = ?, fee = ? where id = ?");
        pat.setString(1, fname);
        pat.setString(2, lname);
        pat.setString(3, course);
        pat.setString(4, fee);
        pat.setString(5, id);
        pat.executeUpdate();
%>

<script>
    alert("Record Updated")
</script>

<%
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-sm shadow p-3 mb-5 rounded" style="margin-top: 140px">
            <h1 class="mt-3">Update User</h1>
            <div class="col mt-4">
                <form method="POST" action="#">

                    <%
                        Connection con;
                        PreparedStatement pat;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/student", "root", "");

                        String id = request.getParameter("id");
                        pat = con.prepareStatement("select * from records where id = ?");
                        pat.setString(1, id);
                        rs = pat.executeQuery();
                        while (rs.next()) {


                    %>

                    <div class="row">
                        <div class="col">
                            <div class="mb-2 ">
                                <label for="exampleInputEmail1" class="form-label">First Name</label>
                                <input type="text" value="<%=rs.getString("fname")%>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="fname" id="fname" required>
                            </div>
                        </div>
                        <div class="col">
                            <div class="mb-2">
                                <label for="exampleInputEmail1" class="form-label">Last Name</label>
                                <input type="text" value="<%=rs.getString("lname")%>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="lname" id="lname" required>
                            </div>
                        </div>
                    </div>
                    <div class="mb-2">
                        <label for="exampleInputEmail1" class="form-label">Courses</label>
                        <input type="text" class="form-control" value="<%=rs.getString("course")%>" id="exampleInputEmail1" aria-describedby="emailHelp" name="course" id="course" required>
                    </div>

                    <div class="mb-2">
                        <label for="exampleInputEmail1" class="form-label">Fee</label>
                        <input type="text" class="form-control" value="<%=rs.getString("fee")%>" id="exampleInputEmail1" aria-describedby="emailHelp" name="fee" id="fee" required>
                    </div>

                    <% }%>


                    <button type="submit" id="submit" value="submit" name="submit" class="btn btn-primary mt-3 mb-5">Update</button>
                    <a href="index.jsp" class="btn btn-danger mt-3 mb-5" role="button">Cancel</a>
                </form></div>
        </div>

    </body>
</html>
