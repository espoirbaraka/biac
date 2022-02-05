<%@page import="java.sql.*"%>
<%
    if(request.getParameter("payer")!=null)
    {
    String montant = request.getParameter("montant");
    String mois = request.getParameter("mois");
    String annee = request.getParameter("annee");
    String id5 = request.getParameter("id");
    try{
        ResultSet rs;
        PreparedStatement pst;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
       
       PreparedStatement ps = conn.prepareStatement("INSERT INTO t_salaire(Montant, CodeMois, CodeAnnee, CodeAgent)VALUES(?,?,?,?)");
       ps.setString(1, montant);
       ps.setString(2, mois);
       ps.setString(3, annee);
       ps.setString(4, id5);
      int x=ps.executeUpdate();
%>
<script>
    alert("Salaire payer");
</script>
<%
    }catch(Exception e){
        out.println(e);
    }
    
    }else if(request.getParameter("create")!=null)
    {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String id6 = request.getParameter("id");
    try{
        ResultSet rs;
        PreparedStatement pst;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
       
       PreparedStatement ps = conn.prepareStatement("UPDATE t_agent SET Username=?, Password=? WHERE CodeAgent=?");
       ps.setString(1, username);
       ps.setString(2, password);
       ps.setString(3, id6);
      int x=ps.executeUpdate();
%>
<script>
    alert("Compte modifie");
</script>
<%
    }catch(Exception e){
        out.println(e);
    }
    
    }
  %> 
<!DOCTYPE html>
<html>

<!-- Mirrored from adminlte.io/themes/AdminLTE/pages/tables/data.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 21 Sep 2021 10:11:07 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>BIAC</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="bower_components/Ionicons/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

 <%@include file="includes/header.jsp" %>
 <%@include file="includes/aside.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Profile agents
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Agents</a></li>
      </ol>
    </section>

    
    <%
        ResultSet rs;
        PreparedStatement pst;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
        String id = request.getParameter("id");
        pst = conn.prepareStatement("SELECT * FROM t_agent INNER JOIN t_fonction ON t_agent.CodeFonction=t_fonction.CodeFonction LEFT JOIN t_user ON t_agent.CodeAgent=t_user.CodeAgent WHERE t_agent.CodeAgent=?");
        pst.setString(1, id);
        rs = pst.executeQuery();
        while(rs.next())
                                {
                                    %>
<section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-body box-profile">
              <img class="profile-user-img img-responsive img-circle" src="dist/img/user1.png" alt="User profile picture">

              <h3 class="profile-username text-center"><%=rs.getString("NomAgent")+' '+rs.getString("PostnomAgent")+' '+rs.getString("PrenomAgent")%></h3>

              <p class="text-muted text-center"><%=rs.getString("Fonction") %></p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Telephone</b> : <a class="pull-right"><%=rs.getString("TelephoneAgent") %></a>
                </li>
                <li class="list-group-item">
                  <b>Adresse</b>   : <a class="pull-right"><%=rs.getString("AdresseAgent") %></a>
                </li>
                <li class="list-group-item">
                  <b>Salaire mensuel</b>     : <a class="pull-right"><%=rs.getString("SalaireMensuel") %> $</a>
                </li>
              </ul>

              <a href="#" class="btn btn-primary btn-block"><b>Message</b></a>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
          
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#activity" data-toggle="tab">Paiement</a></li>
              <li><a href="#payer" data-toggle="tab">Payer</a></li>
              <li><a href="#compte" data-toggle="tab">Creer un compte</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="activity">
                <table id="example1" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Montant</th>
                  <th>Mois</th>
                  <th>Annee</th>
                </tr>
                </thead>
                <tbody>
                              
                                <%
                                ResultSet rs2;
                                PreparedStatement pst2;
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
                                String id2 = request.getParameter("id");
                                pst = conn.prepareStatement("SELECT * FROM t_salaire INNER JOIN t_mois ON t_salaire.CodeMois=t_mois.CodeMois INNER JOIN t_annee ON t_salaire.CodeAnnee=t_annee.CodeAnnee WHERE t_salaire.CodeAgent=?");
                                pst.setString(1, id2);
                                rs2 = pst.executeQuery();
                                while(rs2.next())
                                {
                                    String id3 = rs2.getString("CodeSalaire");
                                    %>
                                                <tr>
                                                    <td><%=rs2.getString("Montant") %> $</td>
                                                    <td><%=rs2.getString("Mois") %></td>
                                                    <td><%=rs2.getString("Annee") %></td>
                                                </tr>
                                    <%
                                } %>
                               
                            </tbody>
                
              </table>
              </div>
                
                
                
                
                
              <!-- /.tab-pane -->
              <div class="tab-pane" id="timeline">
                <!-- The timeline -->
                <ul class="timeline timeline-inverse">
                  <!-- timeline time label -->
                  <li class="time-label">
                        <span class="bg-red">
                          10 Feb. 2014
                        </span>
                  </li>
                  <!-- /.timeline-label -->
                  <!-- timeline item -->
                  <li>
                    <i class="fa fa-envelope bg-blue"></i>

                    <div class="timeline-item">
                      <span class="time"><i class="fa fa-clock-o"></i> 12:05</span>

                      <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>

                      <div class="timeline-body">
                        Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
                        weebly ning heekya handango imeem plugg dopplr jibjab, movity
                        jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
                        quora plaxo ideeli hulu weebly balihoo...
                      </div>
                      <div class="timeline-footer">
                        <a class="btn btn-primary btn-xs">Read more</a>
                        <a class="btn btn-danger btn-xs">Delete</a>
                      </div>
                    </div>
                  </li>
                  <!-- END timeline item -->
                  <!-- timeline item -->
                  <li>
                    <i class="fa fa-user bg-aqua"></i>

                    <div class="timeline-item">
                      <span class="time"><i class="fa fa-clock-o"></i> 5 mins ago</span>

                      <h3 class="timeline-header no-border"><a href="#">Sarah Young</a> accepted your friend request
                      </h3>
                    </div>
                  </li>
                  <!-- END timeline item -->
                  <!-- timeline item -->
                  <li>
                    <i class="fa fa-comments bg-yellow"></i>

                    <div class="timeline-item">
                      <span class="time"><i class="fa fa-clock-o"></i> 27 mins ago</span>

                      <h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>

                      <div class="timeline-body">
                        Take me to your leader!
                        Switzerland is small and neutral!
                        We are more like Germany, ambitious and misunderstood!
                      </div>
                      <div class="timeline-footer">
                        <a class="btn btn-warning btn-flat btn-xs">View comment</a>
                      </div>
                    </div>
                  </li>
                  <!-- END timeline item -->
                  <!-- timeline time label -->
                  <li class="time-label">
                        <span class="bg-green">
                          3 Jan. 2014
                        </span>
                  </li>
                  <!-- /.timeline-label -->
                  <!-- timeline item -->
                  <li>
                    <i class="fa fa-camera bg-purple"></i>

                    <div class="timeline-item">
                      <span class="time"><i class="fa fa-clock-o"></i> 2 days ago</span>

                      <h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>

                      <div class="timeline-body">
                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                        <img src="http://placehold.it/150x100" alt="..." class="margin">
                      </div>
                    </div>
                  </li>
                  <!-- END timeline item -->
                  <li>
                    <i class="fa fa-clock-o bg-gray"></i>
                  </li>
                </ul>
              </div>
              <!-- /.tab-pane -->

              <div class="tab-pane" id="payer">
                  <form class="form-horizontal" method="POST" action="">
                  <div class="form-group">
                    <label for="montant" class="col-sm-2 control-label">Montant</label>

                    <div class="col-sm-10">
                      <input type="number" name="montant" class="form-control" id="inputName" placeholder="Montant">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="mois" class="col-sm-2 control-label">Mois</label>

                    <div class="col-sm-10">
                        <select name="mois" class="form-control">
                            <%
                            ResultSet rs3;
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
                            String query2 = ("SELECT * FROM t_mois");
                            Statement st2 = conn3.createStatement();
                            rs2 = st2.executeQuery(query2);
                            while(rs2.next())
                            {
                            %>
                               <option value="<%=rs2.getString("CodeMois") %>"><%=rs2.getString("Mois") %></option>
                            <%
                            }
                            %>
                        </select>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="annee" class="col-sm-2 control-label">Annee</label>

                    <div class="col-sm-10">
                        <select name="annee" class="form-control">
                            <%
                            ResultSet rs4;
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
                            String query3 = ("SELECT * FROM t_annee");
                            Statement st3 = conn4.createStatement();
                            rs4 = st3.executeQuery(query3);
                            while(rs4.next())
                            {
                            %>
                               <option value="<%=rs4.getString("CodeAnnee") %>"><%=rs4.getString("Annee") %></option>
                            <%
                            }
                            %>
                        </select>
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" name="payer" class="btn btn-success">Payer</button>
                    </div>
                  </div>
                </form>
              </div>
                        
                        
              <div class="tab-pane" id="compte">
                  <form class="form-horizontal" method="POST" action="">
                  <div class="form-group">
                    <label for="username" class="col-sm-2 control-label">Username</label>

                    <div class="col-sm-10">
                      <input type="text" name="username" class="form-control" id="inputName" placeholder="Username" value="<%=rs.getString("Username") %>">
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">Password</label>

                    <div class="col-sm-10">
                      <input type="password" name="password" class="form-control" id="inputName" placeholder="Password" value="<%=rs.getString("Password") %>">
                    </div>
                  </div>
                  
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" name="create" class="btn btn-success">Creer</button>
                    </div>
                  </div>
                </form>
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
                                     <%
                                }
                %>
    <!-- Main content -->
    
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <%@include file="includes/footer.jsp" %>

  <!-- Control Sidebar -->
  
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->



<div class="modal fade" id="addagent">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <h4 class="modal-title"><b>Ajouter un agent</b></h4>
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
                            <input type="text" class="form-control" name="adresse" placeholder="Adresse" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="telephone" placeholder="Telephone" required>
                        </div>
                        <div class="form-group">
                            <select class="form-control" name="fonction">
                            <%
                            ResultSet rs2;
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
                            String query2 = ("SELECT * FROM t_fonction");
                            Statement st2 = conn2.createStatement();
                            rs2 = st2.executeQuery(query2);
                            while(rs2.next())
                            {
                            %>
                               <option value="<%=rs2.getString("CodeFonction") %>"><%=rs2.getString("Fonction") %></option>
                            <%
                            }
                            %>
                            </select>
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


<!-- jQuery 3 -->
<script src="bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- page script -->
<script>
  $(function () {
    $('#example1').DataTable()
    $('#example2').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    })
  })
</script>
<script>
    $(function(){
        /** add active class and stay opened when selected */
        var url = 'http://localhost:8080/biac/agent.jsp';
        
        // meilleure logique
        $('ul.sidebar-menu li a').filter(function() {
            return this.href == url;
        }).parent().addClass('active');
        // fin logique

        

    });
    </script>
    <!-- Add -->

</body>

</html>

