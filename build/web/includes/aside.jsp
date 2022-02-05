<%@page import="java.sql.*"%>
<aside class="main-sidebar">
    <% 
                String code = (String)session.getAttribute("codeagent");
                
          
                try{
                    ResultSet rs;
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
                    PreparedStatement ps = conn.prepareStatement("SELECT * FROM t_agent INNER JOIN t_fonction ON t_agent.CodeFonction=t_fonction.CodeFonction WHERE CodeAgent=?");
                    ps.setString(1, code);
                    rs = ps.executeQuery();
                   while(rs.next())
                   {
                   %>
                       <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/user1.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p><%=rs.getString("NomAgent")+' '+rs.getString("PostnomAgent")%></p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
<!--      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Rechercher...">
          <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat">
                  <i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>-->

      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENU</li>
        <li>
          <a href="home.jsp">
            <i class="fa fa-dashboard"></i> <span>Acceuil</span>
          </a>
        </li>
        <%
                        int fonction=rs.getInt("CodeFonction");
                        if(fonction==1){
                        %>
                        <li>
                            <a href="client.jsp">
                              <i class="fa fa-users"></i> <span>Client</span>
                            </a>
                          </li>
                          
                        <%
                        }else if(fonction==2){
                        %>
                        <li>
                            <a href="client.jsp">
                              <i class="fa fa-users"></i> <span>Client</span>
                            </a>
                          </li>
                        <li>
                            <a href="compte.jsp">
                              <i class="fa fa-user"></i> <span>Compte</span>
                            </a>
                          </li>
                          <li>
                            <a href="operation.jsp">
                              <i class="fa fa-money"></i> <span>Operation</span>
                            </a>
                          </li>
                        <%
                        }else if(fonction==3){
                        %>
                        <li>
                            <a href="agent.jsp">
                              <i class="fa fa-dashboard"></i> <span>Agent</span>
                            </a>
                        </li>
                        <%
                        }
                            %>
        
        
        
<!--        <li>
          <a href="pret.jsp">
            <i class="fa fa-dashboard"></i> <span>Octroi pret</span>
          </a>
        </li>-->
        

        
      </ul>

    </section>
                   <%
                   }
                   
    }catch(Exception e){
        out.println(e);
    }
           %>

    <!-- /.sidebar -->
  </aside>
