<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
    if(request.getParameter("connect")!=null)
    {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    try{
        ResultSet rs;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM t_agent INNER JOIN t_fonction ON t_agent.CodeFonction=t_fonction.CodeFonction WHERE Username=? AND Password=?");
        ps.setString(1, username);
        ps.setString(2, password);
        rs = ps.executeQuery();

       if(rs.next())
       {
        //String code = rs.getString("CodeUser");
        String fonction = rs.getString("Fonction");
        int codefonction = rs.getInt("CodeFonction");
        String codeagent = rs.getString("CodeAgent");
        String user = rs.getString("Username");
        //int categorie = rs.getInt("CodeCategorie");
        
//        if(categorie==1)
//        {
            //session.setAttribute("code", code);
            session.setAttribute("codefonction", codefonction);
            session.setAttribute("codeagent", codeagent);
            session.setAttribute("username", user);
            session.setAttribute("fonction", fonction);
               %>
               <jsp:forward page="home.jsp" />
               <%
            
//        }else if(categorie==2)
//        {
//            session.setAttribute("code", code);
//            session.setAttribute("username", user);
//               %>
//               <jsp:forward page="homeclient.jsp" />
//               <%
//        }

        
       }else{
        %>
           <jsp:forward page="index.jsp" />
           <%
    }
    }catch(Exception e){
        out.println(e);
    }
    }
  %>  
