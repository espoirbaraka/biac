<%@page import="java.sql.*"%>
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
        Operations
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Operations</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box" style="overflow: auto;">
            <div class="box-header">
                <button class="btn btn-primary btn sm btn-flat" onclick="imprimer();" style="float: right;">Imprimer</button>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Date</th>
                  <th>Compte</th>
                  <th>Type d'operation</th>
                  <th>Montant</th>
                  <th>Titulaire du compte</th>
                  <th>Action</th>
                </tr>
                </thead>
                <tbody>
                              
                                <%
                                ResultSet rs;
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
                                String query = ("SELECT * FROM t_mouvement INNER JOIN t_compte ON t_mouvement.CodeCompte=t_compte.CodeCompte INNER JOIN t_client ON t_compte.CodeClient=t_client.CodeClient ORDER BY CodeMouvement DESC");
                                Statement st = conn3.createStatement();
                                rs = st.executeQuery(query);
                                while(rs.next())
                                {
                                    String id = rs.getString("CodeMouvement");
                                    int type = rs.getInt("CodeType");
                                    if(type==1){
                                        %>
                                        <tr>
                                                    <td><%=rs.getString("Date") %></td>
                                                    <td><%=rs.getString("NumeroCompte") %></td>
                                                    <td style="color: green;">Depot</td>
                                                    <td><%=rs.getString("Montant") %> $</td>
                                                    <td><%=rs.getString("NomClient")+' '+rs.getString("PostnomClient")+' '+rs.getString("PrenomClient") %></td>
                                                    <td>
                                                        <a href='printoperation.jsp?id=<%=id %>' class='btn btn-primary btn-sm btn-flat'><i class='fa fa-print'>Imprimer</i></a>
                                                    </td>
                                        </tr>
                                        <%
                                    }else if(type==2){
                                        %>
                                        <tr>
                                                    <td><%=rs.getString("Date") %></td>
                                                    <td><%=rs.getString("NumeroCompte") %></td>
                                                    <td style="color: blue;">Depot</td>
                                                    <td><%=rs.getString("Montant") %> $</td>
                                                    <td><%=rs.getString("NomClient")+' '+rs.getString("PostnomClient")+' '+rs.getString("PrenomClient") %></td>
                                                    <td>
                                                        <a href='printoperation.jsp?id=<%=id %>' class='btn btn-primary btn-sm btn-flat'><i class='fa fa-print'>Imprimer</i></a>
                                                    </td>
                                        </tr>
                                        <%
                                         }else if(type==3){
                                        %>
                                        <tr>
                                                    <td><%=rs.getString("Date") %></td>
                                                    <td><%=rs.getString("NumeroCompte") %></td>
                                                    <td style="color: red;">Virement</td>
                                                    <td><%=rs.getString("Montant") %> $</td>
                                                    <td><%=rs.getString("NomClient")+' '+rs.getString("PostnomClient")+' '+rs.getString("PrenomClient") %></td>
                                                    <td>
                                                        <a href='printoperation.jsp?id=<%=id %>' class='btn btn-primary btn-sm btn-flat'><i class='fa fa-print'>Imprimer</i></a>
                                                    </td>
                                        </tr>
                                        <%
                                            }
                                         }
                                     %>
                               
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


