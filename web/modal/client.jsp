<%@page import="java.sql.*"%>
<%
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
%>
<script>
    alert("Client enregiste");
</script>
<%
    }catch(Exception e){
        out.println(e);
    }
    
    }
  %> 
<div class="modal fade" id="addclient">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title"><b>Ajouter un client</b></h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
              
            </div>
            <div class="modal-body" style="padding-right: 2px;">
              <form class="form-horizontal" method="POST" action="">
                <div class="form-group">

                    <div class="col-sm-9" style="left: 8px;">
                        <div class="form-group">
                            <input type="text" class="form-control" name="nom" placeholder="Nom" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="postnom" placeholder="Post-nom" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="prenom" placeholder="Prenom" required>
                        </div>
                        <div class="form-group">
                            <select class="form-control" name="sexe">
                                <option>M</option>
                                <option>F</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="lieunaiss" placeholder="Lieu de naissance" required>
                        </div>
                        <div class="form-group">
                            <input type="date" class="form-control" name="datenaiss" placeholder="Date de naissance" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="adresse" placeholder="Adresse" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="telephone" placeholder="Telephone" required>
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" name="email" placeholder="Email" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="profession" placeholder="Profession" required>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" name="avoir" placeholder="Total des avoirs" required>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
              <button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Fermer</button>
              <button type="submit" class="btn btn-primary btn-flat" name="add"><i class="fa fa-save"></i> Enregistrer</button>
              </form>
            </div>
        </div>
    </div>
</div>
