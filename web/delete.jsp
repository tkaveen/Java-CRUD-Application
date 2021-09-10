<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<%

    String id = request.getParameter("id");

    Connection con;
    PreparedStatement pat;
    ResultSet rs;

    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/student", "root", "");
    pat = con.prepareStatement("delete from records where id= ?");

    pat.setString(1, id);
    pat.executeUpdate();
%>

<script>
    alert("Record Deleted")
</script>

