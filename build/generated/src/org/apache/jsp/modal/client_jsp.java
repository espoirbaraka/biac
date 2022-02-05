package org.apache.jsp.modal;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class client_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

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

    if(request.getParameter("add")!=null)
    {
    String postnom = request.getParameter("postnom");
    String nom = request.getParameter("nom");
    String prenom = request.getParameter("prenom");
    String adresse = request.getParameter("adresse");
    String mail = request.getParameter("email");
    String telephone = request.getParameter("telephone");
    String datenaiss = request.getParameter("datenaiss");
    String lieunaiss = request.getParameter("lieunaiss");
    String sexe = request.getParameter("sexe");
    String profession = request.getParameter("profession");
    String avoir = request.getParameter("avoir");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
        PreparedStatement ps = conn.prepareStatement("INSERT INTO t_client(NomClient, PostnomClient, PrenomClient, TelephoneClient, AdresseClient, MailClient, DateNaissance, LieuNaissance,SexeClient,ProfessionClient,AvoirClient)VALUES(?,?,?,?,?,?,?,?,?,?,?)");
       ps.setString(1, nom);
       ps.setString(2, postnom);
       ps.setString(3, prenom);
       ps.setString(4, telephone);
       ps.setString(5, adresse);
       ps.setString(6, mail);
       ps.setString(7, datenaiss);
       ps.setString(8, lieunaiss);
       ps.setString(9, sexe);
       ps.setString(10, profession);
       ps.setString(11, avoir);
      int x=ps.executeUpdate();

      out.write("\n");
      out.write("<script>\n");
      out.write("    alert(\"Client enregiste\");\n");
      out.write("</script>\n");

    }catch(Exception e){
        out.println(e);
    }
    
    }
  
      out.write(" \n");
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
      out.write("                                <option>M</option>\n");
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
