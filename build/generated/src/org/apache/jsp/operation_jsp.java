package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class operation_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
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
      out.write("        Operations\n");
      out.write("      </h1>\n");
      out.write("      <ol class=\"breadcrumb\">\n");
      out.write("        <li><a href=\"#\"><i class=\"fa fa-dashboard\"></i> Home</a></li>\n");
      out.write("        <li><a href=\"#\">Operations</a></li>\n");
      out.write("      </ol>\n");
      out.write("    </section>\n");
      out.write("\n");
      out.write("    <!-- Main content -->\n");
      out.write("    <section class=\"content\">\n");
      out.write("      <div class=\"row\">\n");
      out.write("        <div class=\"col-xs-12\">\n");
      out.write("          <div class=\"box\" style=\"overflow: auto;\">\n");
      out.write("            <div class=\"box-header\">\n");
      out.write("                <button class=\"btn btn-primary btn sm btn-flat\" onclick=\"imprimer();\" style=\"float: right;\">Imprimer</button>\n");
      out.write("            </div>\n");
      out.write("            <!-- /.box-header -->\n");
      out.write("            <div class=\"box-body\">\n");
      out.write("              <table id=\"example1\" class=\"table table-bordered table-hover\">\n");
      out.write("                <thead>\n");
      out.write("                <tr>\n");
      out.write("                  <th>Date</th>\n");
      out.write("                  <th>Compte</th>\n");
      out.write("                  <th>Type d'operation</th>\n");
      out.write("                  <th>Montant</th>\n");
      out.write("                  <th>Titulaire du compte</th>\n");
      out.write("                  <th>Action</th>\n");
      out.write("                </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("                              \n");
      out.write("                                ");

                                ResultSet rs;
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
                                String query = ("SELECT * FROM t_mouvement INNER JOIN t_compte ON t_mouvement.CodeCompte=t_compte.CodeCompte INNER JOIN t_client ON t_compte.CodeClient=t_client.CodeClient");
                                Statement st = conn3.createStatement();
                                rs = st.executeQuery(query);
                                while(rs.next())
                                {
                                    String id = rs.getString("CodeMouvement");
                                    
      out.write("\n");
      out.write("                                                <tr>\n");
      out.write("                                                    <td>");
      out.print(rs.getString("Date") );
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(rs.getString("NumeroCompte") );
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(rs.getString("NumeroCompte") );
      out.write("</td>\n");
      out.write("                                                    <td>");
      out.print(rs.getString("Montant") );
      out.write(" $</td>\n");
      out.write("                                                    <td>");
      out.print(rs.getString("NomClient")+' '+rs.getString("PostnomClient")+' '+rs.getString("PostnomClient") );
      out.write("</td>\n");
      out.write("                                                    <td>\n");
      out.write("                                                        <a href='printoperation.jsp?id=");
      out.print(id );
      out.write("' class='btn btn-primary btn-sm btn-flat'><i class='fa fa-print'>Imprimer</i></a>\n");
      out.write("                                                    </td>\n");
      out.write("                                                </tr>\n");
      out.write("                                    ");

                                } 
      out.write("\n");
      out.write("                               \n");
      out.write("                            </tbody>\n");
      out.write("                \n");
      out.write("              </table>\n");
      out.write("            </div>\n");
      out.write("            <!-- /.box-body -->\n");
      out.write("          </div>\n");
      out.write("          <!-- /.box -->\n");
      out.write("\n");
      out.write("          \n");
      out.write("          \n");
      out.write("          \n");
      out.write("          <!-- /.box -->\n");
      out.write("        </div>\n");
      out.write("        <!-- /.col -->\n");
      out.write("      </div>\n");
      out.write("      <!-- /.row -->\n");
      out.write("    </section>\n");
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
      out.write("<div class=\"modal fade\" id=\"addclient\">\n");
      out.write("    <div class=\"modal-dialog\">\n");
      out.write("        <div class=\"modal-content\">\n");
      out.write("            <div class=\"modal-header\">\n");
      out.write("            <h4 class=\"modal-title\"><b>Ajouter un client</b></h4>\n");
      out.write("              <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-label=\"Close\">\n");
      out.write("                  <span aria-hidden=\"true\">&times;</span></button>\n");
      out.write("              \n");
      out.write("            </div>\n");
      out.write("            <div class=\"modal-body\" style=\"padding-right: 2px;\">\n");
      out.write("              <form class=\"form-horizontal\" method=\"POST\" action=\"\">\n");
      out.write("                <div class=\"form-group\">\n");
      out.write("\n");
      out.write("                    <div class=\"col-sm-9\" style=\"left: 8px;\">\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"nom\" placeholder=\"Nom\" required>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"postnom\" placeholder=\"Post-nom\" required>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"prenom\" placeholder=\"Prenom\" required>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <select class=\"form-control\" name=\"sexe\">\n");
      out.write("                                <option>M</option>\n");
      out.write("                                <option>F</option>\n");
      out.write("                            </select>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"lieunaiss\" placeholder=\"Lieu de naissance\" required>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <input type=\"date\" class=\"form-control\" name=\"datenaiss\" placeholder=\"Date de naissance\" required>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"adresse\" placeholder=\"Adresse\" required>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"telephone\" placeholder=\"Telephone\" required>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <input type=\"email\" class=\"form-control\" name=\"email\" placeholder=\"Email\" required>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"profession\" placeholder=\"Profession\" required>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <input type=\"number\" class=\"form-control\" name=\"avoir\" placeholder=\"Total des avoirs\" required>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"modal-footer\">\n");
      out.write("              <button type=\"button\" class=\"btn btn-default btn-flat pull-left\" data-dismiss=\"modal\"><i class=\"fa fa-close\"></i> Fermer</button>\n");
      out.write("              <button type=\"submit\" class=\"btn btn-primary btn-flat\" name=\"add\"><i class=\"fa fa-save\"></i> Enregistrer</button>\n");
      out.write("              </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
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
      out.write("\n");
      out.write("\n");
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
      out.write("        var url = window.location;\n");
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
      out.write("    <script>\n");
      out.write("        function imprimer(){\n");
      out.write("            window.print();\n");
      out.write("            }\n");
      out.write("    </script>\n");
      out.write("   \n");
      out.write("    <!-- Add -->\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
      out.write("\n");
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
