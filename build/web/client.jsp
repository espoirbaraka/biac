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
        Clients
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Clients</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box" style="overflow: auto;">
            <div class="box-header">
                <a href="#addclient" data-toggle="modal" class="btn btn-primary btn-sm btn-flat"><i class="fa fa-plus"></i> Nouveau</a>
                <button class="btn btn-primary btn sm btn-flat" onclick="imprimer();" style="float: right;">Imprimer</button>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Nom</th>
                  <th>Sexe</th>
                  <th>Date de naissance</th>
                  <th>Lieu de naissance</th>
                  <th>Mail</th>
                  <th>Telephone</th>
                  <th>Avoir</th>
                  <th>Action</th>
                </tr>
                </thead>
                <tbody>
                              
                                <%
                                ResultSet rs;
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
                                String query = ("SELECT * FROM t_client");
                                Statement st = conn3.createStatement();
                                rs = st.executeQuery(query);
                                while(rs.next())
                                {
                                    String id = rs.getString("CodeClient");
                                    %>
                                                <tr>
                                                    <td><%=rs.getString("NomClient")+' '+rs.getString("PostnomClient")+' '+rs.getString("PrenomClient") %></td>
                                                    <td><%=rs.getString("SexeClient") %></td>
                                                    <td><%=rs.getString("DateNaissance") %></td>
                                                    <td><%=rs.getString("LieuNaissance") %></td>
                                                    <td><%=rs.getString("MailClient") %></td>
                                                    <td><%=rs.getString("TelephoneClient") %></td>
                                                    <td><%=rs.getString("AvoirClient") %> $</td>
                                                    <td>
                                                        <a href='profileclient.jsp?id=<%=id %>' class='btn btn-primary btn-sm btn-flat'><i class='fa fa-plus'>Compte</i></a>
                                                        <a href='updateclient.jsp?id=<%=id %>' class='btn btn-success btn-sm btn-flat'><i class='fa fa-edit'></i></a>
                                                        <a href='deleteclient.jsp?id=<%=id %>' class='btn btn-danger btn-sm btn-flat'><i class='fa fa-remove'></i></a>
                                                    </td>
                                                </tr>
                                    <%
                                } %>
                               
                </tbody>
                
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          
          
          
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
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
        var url = window.location;
        
        // meilleure logique
        $('ul.sidebar-menu li a').filter(function() {
            return this.href == url;
        }).parent().addClass('active');
        // fin logique

        

    });
    </script>
    <script>
        function imprimer(){
            window.print();
            }
    </script>
    <!-- Add -->

</body>

</html>

