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
        Choix du compte à debiter
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Choix du compte à debiter</a></li>
      </ol>
    </section>

    
    <%
        ResultSet rs;
        PreparedStatement pst;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
        String id = request.getParameter("cptecredit");
        //String id = "42";
        pst = conn.prepareStatement("SELECT * FROM t_compte INNER JOIN t_client ON t_compte.CodeClient=t_client.CodeClient INNER JOIN t_categorie_compte ON t_compte.CodeCategorie=t_categorie_compte.CodeCategorie WHERE t_compte.CodeCompte=?");
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
              <img class="profile-user-img img-responsive img-circle" src="dist/img/compte.png" alt="User profile picture">

              <h3 class="profile-username text-center"><%=rs.getString("NumeroCompte")%></h3>

          

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Titulaire</b> : <a class="pull-right"><%=rs.getString("NomClient")+' '+rs.getString("PostnomClient")+' '+rs.getString("PrenomClient")%></a>
                </li>
                <li class="list-group-item">
                  <b>Categorie</b> : <a class="pull-right"><%=rs.getString("Categorie") %></a>
                </li>
                <li class="list-group-item">
                  <b>Solde</b> : <a class="pull-right"><%=rs.getString("Solde") %> $</a>
                </li>
                <li class="list-group-item">
                  <b>Date de creation</b>   : <a class="pull-right"><%=rs.getString("Created_on") %></a>
                </li>
                
              </ul>
              
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
              <li class="active"><a href="#operation" data-toggle="tab">Choix du compte</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="operation">
                <table id="example1" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Date</th>
                  <th>Type d'operation</th>
                  <th>Montant</th>
                </tr>
                </thead>
                <tbody>
                              
                                <%
                                ResultSet rs2;
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
                                String query = ("SELECT * FROM t_compte INNER JOIN t_client ON t_compte.CodeClient=t_client.CodeClient");
                                Statement st = conn3.createStatement();
                                rs2 = st.executeQuery(query);
                                while(rs2.next())
                                {
                                    String cptecredit = request.getParameter("cptecredit");
                                    //int cpte1 = 42;
                                    %>
                                                <tr>
                                                    <td><%=rs2.getString("NumeroCompte") %></td>
                                                    <td><%=rs2.getString("NomClient")+' '+rs2.getString("PostnomClient")+' '+rs2.getString("PostnomClient") %></td>
                                                    <td>
                                                        <a href='virer.jsp?cptecredit=<%=cptecredit%>&&cptedebit=<%=rs2.getString("CodeCompte") %>' class='btn btn-primary btn-sm btn-flat'><i class='fa fa-plus'>Vers ce compte</i></a>
                                                    </td>
                                                </tr>
                                    <%
                                } %>
                               
                </tbody>
                
              </table>
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
        var url = 'http://localhost:8080/biac/compte.jsp';
        
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

