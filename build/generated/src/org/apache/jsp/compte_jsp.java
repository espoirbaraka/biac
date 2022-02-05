package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class compte_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/includes/header.jsp");
    _jspx_dependants.add("/includes/aside.jsp");
    _jspx_dependants.add("/includes/footer.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');

    if(request.getParameter("creer")!=null)
    {
        String id = request.getParameter("id");
        String categorie = request.getParameter("categorie");
        String statut = "1";
        String solde = "0";
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
       PreparedStatement ps = conn.prepareStatement("INSERT INTO t_compte(CodeCategorie, CodeClient, CodeStatut, Solde)VALUES(?,?,?,?)");
       ps.setString(1, categorie);
       ps.setString(2, id);
       ps.setString(3, statut);
       ps.setString(4, solde);
      int x=ps.executeUpdate();

      out.write("\n");
      out.write("<script>\n");
      out.write("    alert(\"Compte creer\");\n");
      out.write("</script>\n");

    }catch(Exception e){
        out.println(e);
    }
    
    }
  
      out.write("  \n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("\n");
      out.write("<!-- Mirrored from adminlte.io/themes/AdminLTE/pages/tables/data.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 21 Sep 2021 10:11:07 GMT -->\n");
      out.write("<!-- Added by HTTrack --><meta http-equiv=\"content-type\" content=\"text/html;charset=utf-8\" /><!-- /Added by HTTrack -->\n");
      out.write("<head>\n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("  <title>BIAC</title>\n");
      out.write("  <!-- Tell the browser to be responsive to screen width -->\n");
      out.write("  <meta content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\" name=\"viewport\">\n");
      out.write("  <!-- Bootstrap 3.3.7 -->\n");
      out.write("  <link rel=\"stylesheet\" href=\"bower_components/bootstrap/dist/css/bootstrap.min.css\">\n");
      out.write("  <!-- Font Awesome -->\n");
      out.write("  <link rel=\"stylesheet\" href=\"bower_components/font-awesome/css/font-awesome.min.css\">\n");
      out.write("  <!-- Ionicons -->\n");
      out.write("  <link rel=\"stylesheet\" href=\"bower_components/Ionicons/css/ionicons.min.css\">\n");
      out.write("  <!-- DataTables -->\n");
      out.write("  <link rel=\"stylesheet\" href=\"bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css\">\n");
      out.write("  <!-- Theme style -->\n");
      out.write("  <link rel=\"stylesheet\" href=\"dist/css/AdminLTE.min.css\">\n");
      out.write("  <!-- AdminLTE Skins. Choose a skin from the css/skins\n");
      out.write("       folder instead of downloading all of them to reduce the load. -->\n");
      out.write("  <link rel=\"stylesheet\" href=\"dist/css/skins/_all-skins.min.css\">\n");
      out.write("\n");
      out.write("  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->\n");
      out.write("  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->\n");
      out.write("  <!--[if lt IE 9]>\n");
      out.write("  <script src=\"https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js\"></script>\n");
      out.write("  <script src=\"https://oss.maxcdn.com/respond/1.4.2/respond.min.js\"></script>\n");
      out.write("  <![endif]-->\n");
      out.write("\n");
      out.write("  <!-- Google Font -->\n");
      out.write("  <link rel=\"stylesheet\"\n");
      out.write("        href=\"https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic\">\n");
      out.write("</head>\n");
      out.write("<body class=\"hold-transition skin-blue sidebar-mini\">\n");
      out.write("<div class=\"wrapper\">\n");
      out.write("\n");
      out.write(" ");
      out.write("<header class=\"main-header\">\n");
      out.write("\n");
      out.write("    <!-- Logo -->\n");
      out.write("    <a href=\"index2.html\" class=\"logo\">\n");
      out.write("      <!-- mini logo for sidebar mini 50x50 pixels -->\n");
      out.write("      <span class=\"logo-mini\"><b>B</b></span>\n");
      out.write("      <!-- logo for regular state and mobile devices -->\n");
      out.write("      <span class=\"logo-lg\"><b>BIAC</b></span>\n");
      out.write("    </a>\n");
      out.write("\n");
      out.write("    <!-- Header Navbar: style can be found in header.less -->\n");
      out.write("    <nav class=\"navbar navbar-static-top\">\n");
      out.write("      <!-- Sidebar toggle button-->\n");
      out.write("      <a href=\"#\" class=\"sidebar-toggle\" data-toggle=\"push-menu\" role=\"button\">\n");
      out.write("        <span class=\"sr-only\">Toggle navigation</span>\n");
      out.write("      </a>\n");
      out.write("      <!-- Navbar Right Menu -->\n");
      out.write("      <div class=\"navbar-custom-menu\">\n");
      out.write("        <ul class=\"nav navbar-nav\">\n");
      out.write("         \n");
      out.write("          <!-- User Account: style can be found in dropdown.less -->\n");
      out.write("          <li class=\"dropdown user user-menu\">\n");
      out.write("            <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">\n");
      out.write("              <img src=\"dist/img/user1.png\" class=\"user-image\" alt=\"User Image\">\n");
      out.write("              <span class=\"hidden-xs\">Espoir Baraka</span>\n");
      out.write("            </a>\n");
      out.write("            <ul class=\"dropdown-menu\">\n");
      out.write("              <!-- User image -->\n");
      out.write("              <li class=\"user-header\">\n");
      out.write("                <img src=\"dist/img/user1.png\" class=\"img-circle\" alt=\"User Image\">\n");
      out.write("\n");
      out.write("                <p>\n");
      out.write("                  Espoir Baraka - Comptable\n");
      out.write("                  <small>Member since Nov. 2012</small>\n");
      out.write("                </p>\n");
      out.write("              </li>\n");
      out.write("              <!-- Menu Body -->\n");
      out.write("              <li class=\"user-body\">\n");
      out.write("                \n");
      out.write("                <!-- /.row -->\n");
      out.write("              </li>\n");
      out.write("              <!-- Menu Footer-->\n");
      out.write("              <li class=\"user-footer\">\n");
      out.write("                <div class=\"pull-left\">\n");
      out.write("                  <a href=\"#\" class=\"btn btn-default btn-flat\">Profile</a>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"pull-right\">\n");
      out.write("                  <a href=\"index.jsp\" class=\"btn btn-default btn-flat\">Deconnexion</a>\n");
      out.write("                </div>\n");
      out.write("              </li>\n");
      out.write("            </ul>\n");
      out.write("          </li>\n");
      out.write("          <!-- Control Sidebar Toggle Button -->\n");
      out.write("          <li>\n");
      out.write("            <a href=\"#\" data-toggle=\"control-sidebar\"><i class=\"fa fa-gears\"></i></a>\n");
      out.write("          </li>\n");
      out.write("        </ul>\n");
      out.write("      </div>\n");
      out.write("\n");
      out.write("    </nav>\n");
      out.write("  </header>\n");
      out.write('\n');
      out.write(' ');
      out.write("<aside class=\"main-sidebar\">\n");
      out.write("    <!-- sidebar: style can be found in sidebar.less -->\n");
      out.write("    <section class=\"sidebar\">\n");
      out.write("      <!-- Sidebar user panel -->\n");
      out.write("      <div class=\"user-panel\">\n");
      out.write("        <div class=\"pull-left image\">\n");
      out.write("          <img src=\"dist/img/user1.png\" class=\"img-circle\" alt=\"User Image\">\n");
      out.write("        </div>\n");
      out.write("        <div class=\"pull-left info\">\n");
      out.write("          <p>Espoir Baraka</p>\n");
      out.write("          <a href=\"#\"><i class=\"fa fa-circle text-success\"></i> Online</a>\n");
      out.write("        </div>\n");
      out.write("      </div>\n");
      out.write("      <!-- search form -->\n");
      out.write("<!--      <form action=\"#\" method=\"get\" class=\"sidebar-form\">\n");
      out.write("        <div class=\"input-group\">\n");
      out.write("          <input type=\"text\" name=\"q\" class=\"form-control\" placeholder=\"Rechercher...\">\n");
      out.write("          <span class=\"input-group-btn\">\n");
      out.write("                <button type=\"submit\" name=\"search\" id=\"search-btn\" class=\"btn btn-flat\">\n");
      out.write("                  <i class=\"fa fa-search\"></i>\n");
      out.write("                </button>\n");
      out.write("              </span>\n");
      out.write("        </div>\n");
      out.write("      </form>-->\n");
      out.write("\n");
      out.write("      <ul class=\"sidebar-menu\" data-widget=\"tree\">\n");
      out.write("        <li class=\"header\">MENU</li>\n");
      out.write("        <li>\n");
      out.write("          <a href=\"home.jsp\">\n");
      out.write("            <i class=\"fa fa-dashboard\"></i> <span>Acceuil</span>\n");
      out.write("          </a>\n");
      out.write("        </li>\n");
      out.write("        <li>\n");
      out.write("          <a href=\"client.jsp\">\n");
      out.write("            <i class=\"fa fa-users\"></i> <span>Client</span>\n");
      out.write("          </a>\n");
      out.write("        </li>\n");
      out.write("        <li>\n");
      out.write("          <a href=\"compte.jsp\">\n");
      out.write("            <i class=\"fa fa-user\"></i> <span>Compte</span>\n");
      out.write("          </a>\n");
      out.write("        </li>\n");
      out.write("        <li>\n");
      out.write("          <a href=\"operation.jsp\">\n");
      out.write("            <i class=\"fa fa-money\"></i> <span>Operation</span>\n");
      out.write("          </a>\n");
      out.write("        </li>\n");
      out.write("        <li>\n");
      out.write("          <a href=\"pret.jsp\">\n");
      out.write("            <i class=\"fa fa-dashboard\"></i> <span>Octroi pret</span>\n");
      out.write("          </a>\n");
      out.write("        </li>\n");
      out.write("        <li>\n");
      out.write("          <a href=\"agent.jsp\">\n");
      out.write("            <i class=\"fa fa-dashboard\"></i> <span>Agent</span>\n");
      out.write("          </a>\n");
      out.write("        </li>\n");
      out.write("<!--        <li>\n");
      out.write("          <a href=\"home.jsp\">\n");
      out.write("            <i class=\"fa fa-dashboard\"></i> <span>Acceuil</span>\n");
      out.write("          </a>\n");
      out.write("        </li>\n");
      out.write("        <li class=\"treeview menu-open\">\n");
      out.write("          <a href=\"#\">\n");
      out.write("            <i class=\"fa fa-users\"></i> <span>Client</span>\n");
      out.write("            <span class=\"pull-right-container\">\n");
      out.write("              <i class=\"fa fa-angle-left pull-right\"></i>\n");
      out.write("            </span>\n");
      out.write("          </a>\n");
      out.write("          <ul class=\"treeview-menu\">\n");
      out.write("            <li><a href=\"addclient.jsp\"><i class=\"fa fa-circle-o\"></i> Nouveau client</a></li>\n");
      out.write("            <li><a href=\"client.jsp\"><i class=\"fa fa-circle-o\"></i> Clients</a></li>\n");
      out.write("          </ul>\n");
      out.write("        </li>\n");
      out.write("        <li class=\"treeview menu-open\">\n");
      out.write("          <a href=\"#\">\n");
      out.write("            <i class=\"fa fa-users\"></i> <span>Compte</span>\n");
      out.write("            <span class=\"pull-right-container\">\n");
      out.write("              <i class=\"fa fa-angle-left pull-right\"></i>\n");
      out.write("            </span>\n");
      out.write("          </a>\n");
      out.write("          <ul class=\"treeview-menu\">\n");
      out.write("            <li><a href=\"addclient.jsp\"><i class=\"fa fa-circle-o\"></i> Nouveau compte</a></li>\n");
      out.write("            <li><a href=\"client.jsp\"><i class=\"fa fa-circle-o\"></i> Comptes bancaires</a></li>\n");
      out.write("          </ul>\n");
      out.write("        </li>-->\n");
      out.write("        \n");
      out.write("      </ul>\n");
      out.write("\n");
      out.write("    </section>\n");
      out.write("    <!-- /.sidebar -->\n");
      out.write("  </aside>\n");
      out.write("\n");
      out.write("\n");
      out.write("  <!-- Content Wrapper. Contains page content -->\n");
      out.write("  <div class=\"content-wrapper\">\n");
      out.write("    <!-- Content Header (Page header) -->\n");
      out.write("    <section class=\"content-header\">\n");
      out.write("      <h1>\n");
      out.write("        Compte bancaire\n");
      out.write("      </h1>\n");
      out.write("      <ol class=\"breadcrumb\">\n");
      out.write("        <li><a href=\"#\"><i class=\"fa fa-dashboard\"></i> Home</a></li>\n");
      out.write("        <li><a href=\"#\">Compte bancaire</a></li>\n");
      out.write("      </ol>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    \n");
      out.write("    ");

        ResultSet rs;
        PreparedStatement pst;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
        String id = request.getParameter("id");
        pst = conn.prepareStatement("SELECT * FROM t_compte INNER JOIN t_client ON t_compte.CodeClient=t_client.CodeClient INNER JOIN t_categorie_compte ON t_compte.CodeCategorie=t_categorie_compte.CodeCategorie WHERE t_compte.CodeCompte=?");
        pst.setString(1, id);
        rs = pst.executeQuery();
        while(rs.next())
                                {
                                    
      out.write("\n");
      out.write("<section class=\"content\">\n");
      out.write("\n");
      out.write("      <div class=\"row\">\n");
      out.write("        <div class=\"col-md-3\">\n");
      out.write("\n");
      out.write("          <!-- Profile Image -->\n");
      out.write("          <div class=\"box box-primary\">\n");
      out.write("            <div class=\"box-body box-profile\">\n");
      out.write("              <img class=\"profile-user-img img-responsive img-circle\" src=\"dist/img/compte.png\" alt=\"User profile picture\">\n");
      out.write("\n");
      out.write("              <h3 class=\"profile-username text-center\">");
      out.print(rs.getString("NumeroCompte"));
      out.write("</h3>\n");
      out.write("\n");
      out.write("          \n");
      out.write("\n");
      out.write("              <ul class=\"list-group list-group-unbordered\">\n");
      out.write("                <li class=\"list-group-item\">\n");
      out.write("                  <b>Titulaire</b> : <a class=\"pull-right\">");
      out.print(rs.getString("NomClient")+' '+rs.getString("PostnomClient")+' '+rs.getString("PrenomClient"));
      out.write("</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"list-group-item\">\n");
      out.write("                  <b>Categorie</b> : <a class=\"pull-right\">");
      out.print(rs.getString("Categorie") );
      out.write("</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"list-group-item\">\n");
      out.write("                  <b>Solde</b> : <a class=\"pull-right\">");
      out.print(rs.getString("Solde") );
      out.write("</a>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"list-group-item\">\n");
      out.write("                  <b>Date de creation</b>   : <a class=\"pull-right\">");
      out.print(rs.getString("Created_on") );
      out.write("</a>\n");
      out.write("                </li>\n");
      out.write("                \n");
      out.write("              </ul>\n");
      out.write("\n");
      out.write("              <a href=\"#\" class=\"btn btn-primary btn-block\"><b>Message</b></a>\n");
      out.write("            </div>\n");
      out.write("            <!-- /.box-body -->\n");
      out.write("          </div>\n");
      out.write("          <!-- /.box -->\n");
      out.write("\n");
      out.write("          <!-- About Me Box -->\n");
      out.write("          \n");
      out.write("          <!-- /.box -->\n");
      out.write("        </div>\n");
      out.write("        <!-- /.col -->\n");
      out.write("        <div class=\"col-md-9\">\n");
      out.write("          <div class=\"nav-tabs-custom\">\n");
      out.write("            <ul class=\"nav nav-tabs\">\n");
      out.write("              <li class=\"active\"><a href=\"#compte\" data-toggle=\"tab\">Compte</a></li>\n");
      out.write("              <li><a href=\"#creercompte\" data-toggle=\"tab\">Creer un compte</a></li>\n");
      out.write("            </ul>\n");
      out.write("            <div class=\"tab-content\">\n");
      out.write("              <div class=\"active tab-pane\" id=\"compte\">\n");
      out.write("                <table id=\"example1\" class=\"table table-bordered table-hover\">\n");
      out.write("                <thead>\n");
      out.write("                <tr>\n");
      out.write("                  <th>Numero de compte</th>\n");
      out.write("                  <th>Categorie</th>\n");
      out.write("                  <th>Statut</th>\n");
      out.write("                  <th>Solde</th>\n");
      out.write("                  <th>Action</th>\n");
      out.write("                </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("                              \n");
      out.write("                                ");

                                ResultSet rs2;
                                PreparedStatement pst2;
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
                                String id2 = request.getParameter("id");
                                pst = conn.prepareStatement("SELECT * FROM t_compte INNER JOIN t_statut_compte ON t_compte.CodeStatut=t_statut_compte.CodeStatut INNER JOIN t_categorie_compte ON t_compte.CodeCategorie=t_categorie_compte.CodeCategorie WHERE t_compte.CodeClient=?");
                                pst.setString(1, id2);
                                rs2 = pst.executeQuery();
                                while(rs2.next())
                                {
                                    String id3 = rs2.getString("CodeCompte");
                                    float solde = rs2.getFloat("Solde");
                                    if(solde<20)
                                    {
                                        
      out.write("\n");
      out.write("                                        <tr>\n");
      out.write("                                                    <td>");
      out.print(rs2.getString("NumeroCompte") );
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(rs2.getString("Categorie") );
      out.write("</td>\n");
      out.write("                                                    <td style=\"color: red;\">Non active</td>\n");
      out.write("                                                    <td>");
      out.print(rs2.getString("Solde") );
      out.write(" $</td>\n");
      out.write("                                                    <td><a href='activation.jsp?id=");
      out.print(id3 );
      out.write("' class='btn btn-danger btn-sm btn-flat'><i class='fa fa-money'></i> Frais d'activation</a></td>\n");
      out.write("                                        </tr>\n");
      out.write("                                        ");

                                    }else{
                                    
      out.write("\n");
      out.write("                                        <tr>\n");
      out.write("                                                    <td>");
      out.print(rs2.getString("NumeroCompte") );
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(rs2.getString("Categorie") );
      out.write("</td>\n");
      out.write("                                                    <td style=\"color: green;\">Compte active</td>\n");
      out.write("                                                    <td>");
      out.print(rs2.getString("Solde") );
      out.write(" $</td>\n");
      out.write("                                                    <td><a href='compte.jsp?id=");
      out.print(id3 );
      out.write("' class='btn btn-success btn-sm btn-flat'><i class='fa fa-edit'></i> Passer operation</a></td>\n");
      out.write("                                        </tr>\n");
      out.write("                                    ");

                                    }
                                    
                                } 
      out.write("\n");
      out.write("                               \n");
      out.write("                            </tbody>\n");
      out.write("                \n");
      out.write("              </table>\n");
      out.write("              </div>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("                \n");
      out.write("             \n");
      out.write("                        \n");
      out.write("                        \n");
      out.write("              <div class=\"tab-pane\" id=\"creercompte\">\n");
      out.write("                  <form class=\"form-horizontal\" method=\"POST\" action=\"\">\n");
      out.write("                  <div class=\"form-group\">\n");
      out.write("                    <label for=\"username\" class=\"col-sm-2 control-label\">Categorie</label>\n");
      out.write("\n");
      out.write("                    <div class=\"col-sm-10\">\n");
      out.write("                      <select class=\"form-control\" name=\"categorie\">\n");
      out.write("                            ");

                            ResultSet rs3;
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
                            String query2 = ("SELECT * FROM t_categorie_compte");
                            Statement st2 = conn3.createStatement();
                            rs3 = st2.executeQuery(query2);
                            while(rs3.next())
                            {
                            
      out.write("\n");
      out.write("                               <option value=\"");
      out.print(rs3.getString("CodeCategorie") );
      out.write('"');
      out.write('>');
      out.print(rs3.getString("Categorie") );
      out.write("</option>\n");
      out.write("                            ");

                            }
                            
      out.write("\n");
      out.write("                       </select>\n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("                  \n");
      out.write("                  \n");
      out.write("                  <div class=\"form-group\">\n");
      out.write("                    <div class=\"col-sm-offset-2 col-sm-10\">\n");
      out.write("                      <button type=\"submit\" name=\"creer\" class=\"btn btn-success\">Creer</button>\n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("                </form>\n");
      out.write("              </div>\n");
      out.write("              <!-- /.tab-pane -->\n");
      out.write("            </div>\n");
      out.write("            <!-- /.tab-content -->\n");
      out.write("          </div>\n");
      out.write("          <!-- /.nav-tabs-custom -->\n");
      out.write("        </div>\n");
      out.write("        <!-- /.col -->\n");
      out.write("      </div>\n");
      out.write("      <!-- /.row -->\n");
      out.write("\n");
      out.write("    </section>\n");
      out.write("                                     ");

                                }
                
      out.write("\n");
      out.write("    <!-- Main content -->\n");
      out.write("    \n");
      out.write("    <!-- /.content -->\n");
      out.write("  </div>\n");
      out.write("  <!-- /.content-wrapper -->\n");
      out.write("  ");
      out.write("<footer class=\"main-footer\" style=\"bottom: 0px;\">\n");
      out.write("    <div class=\"pull-right hidden-xs\">\n");
      out.write("      <b>Version</b> 2.4.13\n");
      out.write("    </div>\n");
      out.write("    <strong>Copyright &copy; 2020-2021 <a href=\"https://adminlte.io/\">BIAC</a>.</strong> \n");
      out.write("  </footer>");
      out.write("\n");
      out.write("\n");
      out.write("  <!-- Control Sidebar -->\n");
      out.write("  \n");
      out.write("  <!-- /.control-sidebar -->\n");
      out.write("  <!-- Add the sidebar's background. This div must be placed\n");
      out.write("       immediately after the control sidebar -->\n");
      out.write("  <div class=\"control-sidebar-bg\"></div>\n");
      out.write("</div>\n");
      out.write("<!-- ./wrapper -->\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- jQuery 3 -->\n");
      out.write("<script src=\"bower_components/jquery/dist/jquery.min.js\"></script>\n");
      out.write("<!-- Bootstrap 3.3.7 -->\n");
      out.write("<script src=\"bower_components/bootstrap/dist/js/bootstrap.min.js\"></script>\n");
      out.write("<!-- DataTables -->\n");
      out.write("<script src=\"bower_components/datatables.net/js/jquery.dataTables.min.js\"></script>\n");
      out.write("<script src=\"bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js\"></script>\n");
      out.write("<!-- SlimScroll -->\n");
      out.write("<script src=\"bower_components/jquery-slimscroll/jquery.slimscroll.min.js\"></script>\n");
      out.write("<!-- FastClick -->\n");
      out.write("<script src=\"bower_components/fastclick/lib/fastclick.js\"></script>\n");
      out.write("<!-- AdminLTE App -->\n");
      out.write("<script src=\"dist/js/adminlte.min.js\"></script>\n");
      out.write("<!-- AdminLTE for demo purposes -->\n");
      out.write("<script src=\"dist/js/demo.js\"></script>\n");
      out.write("<!-- page script -->\n");
      out.write("<script>\n");
      out.write("  $(function () {\n");
      out.write("    $('#example1').DataTable()\n");
      out.write("    $('#example2').DataTable({\n");
      out.write("      'paging'      : true,\n");
      out.write("      'lengthChange': false,\n");
      out.write("      'searching'   : false,\n");
      out.write("      'ordering'    : true,\n");
      out.write("      'info'        : true,\n");
      out.write("      'autoWidth'   : false\n");
      out.write("    })\n");
      out.write("  })\n");
      out.write("</script>\n");
      out.write("<script>\n");
      out.write("    $(function(){\n");
      out.write("        /** add active class and stay opened when selected */\n");
      out.write("        var url = 'http://localhost:8080/biac/compte.jsp';\n");
      out.write("        \n");
      out.write("        // meilleure logique\n");
      out.write("        $('ul.sidebar-menu li a').filter(function() {\n");
      out.write("            return this.href == url;\n");
      out.write("        }).parent().addClass('active');\n");
      out.write("        // fin logique\n");
      out.write("\n");
      out.write("        \n");
      out.write("\n");
      out.write("    });\n");
      out.write("    </script>\n");
      out.write("    <!-- Add -->\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
