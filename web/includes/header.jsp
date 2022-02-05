<%@page import="java.sql.*"%>
<header class="main-header">

    <!-- Logo -->
    <a href="home.jsp" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>B</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>BIAC</b></span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <% 
                String code2 = (String)session.getAttribute("codeagent");
                
          
                try{
                    ResultSet rs;
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
                    PreparedStatement ps = conn.prepareStatement("SELECT * FROM t_agent INNER JOIN t_fonction ON t_agent.CodeFonction=t_fonction.CodeFonction WHERE CodeAgent=?");
                    ps.setString(1, code2);
                    rs = ps.executeQuery();
                   while(rs.next())
                   {
                   %>
                   <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
         
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="dist/img/user1.png" class="user-image" alt="User Image">
              <span class="hidden-xs"><%=rs.getString("NomAgent")+' '+rs.getString("PostnomAgent")%></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/user1.png" class="img-circle" alt="User Image">

                <p>
                  <%=rs.getString("NomAgent")+' '+rs.getString("PostnomAgent")%> - <%=rs.getString("Fonction")%>
                  
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="index.jsp" class="btn btn-default btn-flat">Deconnexion</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
                   <%
                   }
                   
    }catch(Exception e){
        out.println(e);
    }
           %>
      <!-- Navbar Right Menu -->
      

    </nav>
  </header>
