<%@page import="java.sql.*"%>
<%
    if(request.getParameter("activer")!=null)
    {
    int type = 3;
    String montant = request.getParameter("montant");
    String compte = request.getParameter("cptecredit");
    int agent = 1;
    String debiteur = request.getParameter("debiteur");
    String crediteur = request.getParameter("crediteur");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
       PreparedStatement ps = conn.prepareStatement("CALL proc_virement(?,?,?,?,?)");
       ps.setString(1, montant);
       ps.setString(2, debiteur);
       ps.setString(3, crediteur);
       ps.setInt(4, agent);
       ps.setInt(5, type);
      int x=ps.executeUpdate();
%>
<script>
    alert("Virement effectu�");
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
        Montant � transferer
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Montant � transferer</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box" style="overflow: auto;">
            
            <!-- /.box-header -->
            <div class="box-body">
              
                <form method="POST" action="" style="padding: 0px 250px 0px 250px;">
               
                <div class="form-group">
                    <label class="control-label">Montant</label>
                  <input name="montant" class="form-control" type="number">
                  <input name="debiteur" class="form-control" value="<%=request.getParameter("cptedebit")%>" type="hidden">
                  <input name="crediteur" class="form-control" value="<%=request.getParameter("cptecredit")%>" type="hidden">
                </div>
                
                    
                 <div class="form-group">
                     <input class="btn btn-primary" name="activer" type="submit" value="Modifier">
                </div>
                
              </form>
                
                
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
        var url = 'http://localhost:8080/biac/operation.jsp';
        
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

