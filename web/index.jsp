
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%
    if (request.getParameter("submit") != null) {
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");

        Connection con;
        PreparedStatement pat;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/student", "root", "");
        pat = con.prepareStatement("insert into records(fname,lname,course,fee)values(?,?,?,?)");
        pat.setString(1, fname);
        pat.setString(2, lname);
        pat.setString(3, course);
        pat.setString(4, fee);
        pat.executeUpdate();
%>

<script>
    alert("Record Added")
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
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Navbar</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>


                    </ul>

                </div>
            </div>
        </nav>

        <div class="container-sm shadow p-3 mb-5 rounded" style="margin-top: 140px">
            <h1 class="text-center mt-3 mb-5">Student Management</h1>
            <div class="row">

                <div class="col"> <form method="POST" action="#">
                        <div class="row">
                            <div class="col">
                                <div class="mb-2 ">
                                    <label for="exampleInputEmail1" class="form-label">First Name</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="fname" id="fname" required>
                                </div>
                            </div>
                            <div class="col">
                                <div class="mb-2">
                                    <label for="exampleInputEmail1" class="form-label">Last Name</label>
                                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="lname" id="lname" required>
                                </div>
                            </div>
                        </div>
                        <div class="mb-2">
                            <label for="exampleInputEmail1" class="form-label">Courses</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="course" id="course" required>
                        </div>

                        <div class="mb-2">
                            <label for="exampleInputEmail1" class="form-label">Fee</label>
                            <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="fee" id="fee" required>
                        </div>

                        <button type="submit" id="submit" value="submit" name="submit" class="btn btn-primary mt-3 mb-5">Submit</button>
                        <button type="reset" id="reset" value="reset" name="reset" class="btn btn-danger mt-3 mb-5">Reset</button>
                    </form></div>
                <div class="col ml-5">
                    <table class="table ml-5">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">First Name</th>
                                <th scope="col">Last Name</th>
                                <th scope="col">Courses</th>
                                <th scope="col">Fee</th>
                                <th scope="col">Actions</th>
                            </tr>
                        </thead>                       

                        <tbody>
                            <%
                                Connection con;
                                PreparedStatement pat;
                                ResultSet rs;

                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost/student", "root", "");

                                String query = "select * from records";
                                Statement st = con.createStatement();
                                rs = st.executeQuery(query);
                                while (rs.next()) {
                                    String id = rs.getString("id");


                            %>
                            <tr>
                                <td><%=rs.getString("id")%></td>
                                <td><%=rs.getString("fname")%></td>
                                <td><%=rs.getString("lname")%></td>
                                <td><%=rs.getString("course")%></td>
                                <td><%=rs.getString("fee")%></td>
                                <td> 
                                    <button type="edit" id="edit" value="edit" name="edit" class="btn btn-success btn-sm">Edit</button>
                                     <button type="delete" id="delete" value="delete" name="delete" class="btn btn-danger btn-sm">Delete</button>
                                </td>
                            </tr>
                            <%                                  }

                            %>

                        </tbody>
                    </table>
                </div>


            </div>

        </div>
    </body>
</html>
