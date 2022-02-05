<%@page import="java.sql.*"%>
<%
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
%>
<script>
    alert("Compte creer");
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
        Profile client
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Client</a></li>
      </ol>
    </section>

    
    <%
        ResultSet rs;
        PreparedStatement pst;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
        String id = request.getParameter("id");
        pst = conn.prepareStatement("SELECT * FROM t_client WHERE CodeClient=?");
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

              <h3 class="profile-username text-center"><%=rs.getString("NomClient")+' '+rs.getString("PostnomClient")+' '+rs.getString("PrenomClient")%></h3>

          

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Telephone</b> : <a class="pull-right"><%=rs.getString("TelephoneClient") %></a>
                </li>
                <li class="list-group-item">
                  <b>Email</b> : <a class="pull-right"><%=rs.getString("MailClient") %></a>
                </li>
                <li class="list-group-item">
                  <b>Adresse</b>   : <a class="pull-right"><%=rs.getString("AdresseClient") %></a>
                </li>
                <li class="list-group-item">
                  <b>Sexe</b>     : <a class="pull-right"><%=rs.getString("SexeClient") %></a>
                </li>
                <li class="list-group-item">
                  <b>Naissance</b>     : <a class="pull-right"><%=rs.getString("LieuNaissance")+' '+rs.getString("DateNaissance")%></a>
                </li>
                <li class="list-group-item">
                  <b>Profession</b> : <a class="pull-right"><%=rs.getString("ProfessionClient") %></a>
                </li>
                <li class="list-group-item">
                  <b>Son avoir</b> : <a class="pull-right"><%=rs.getString("AvoirClient") %> $</a>
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
              <li class="active"><a href="#compte" data-toggle="tab">Compte</a></li>
              <li><a href="#creercompte" data-toggle="tab">Creer un compte</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="compte">
                <table id="example1" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Numero de compte</th>
                  <th>Categorie</th>
                  <th>Statut</th>
                  <th>Solde</th>
                  <th>Action</th>
                </tr>
                </thead>
                <tbody>
                              
                                <%
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
                                        %>
                                        <tr>
                                                    <td><%=rs2.getString("NumeroCompte") %></td>
                                                    <td><%=rs2.getString("Categorie") %></td>
                                                    <td style="color: red;">Non active</td>
                                                    <td><%=rs2.getString("Solde") %> $</td>
                                                    <td><a href='activation.jsp?id=<%=id3 %>' class='btn btn-danger btn-sm btn-flat'><i class='fa fa-money'></i> Frais d'activation</a></td>
                                        </tr>
                                        <%
                                    }else{
                                    %>
                                        <tr>
                                                    <td><%=rs2.getString("NumeroCompte") %></td>
                                                    <td><%=rs2.getString("Categorie") %></td>
                                                    <td style="color: green;">Compte active</td>
                                                    <td><%=rs2.getString("Solde") %> $</td>
                                                    <td><a href='compteclient.jsp?id=<%=id3 %>' class='btn btn-success btn-sm btn-flat'><i class='fa fa-edit'></i> Passer operation</a></td>
                                        </tr>
                                    <%
                                    }
                                    
                                } %>
                               
                            </tbody>
                
              </table>
              </div>
                
                
                
                
                
             
                        
                        
              <div class="tab-pane" id="creercompte">
                  <form class="form-horizontal" method="POST" action="">
                  <div class="form-group">
                    <label for="username" class="col-sm-2 control-label">Categorie</label>

                    <div class="col-sm-10">
                      <select class="form-control" name="categorie">
                            <%
                            ResultSet rs3;
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
                            String query2 = ("SELECT * FROM t_categorie_compte");
                            Statement st2 = conn3.createStatement();
                            rs3 = st2.executeQuery(query2);
                            while(rs3.next())
                            {
                            %>
                               <option value="<%=rs3.getString("CodeCategorie") %>"><%=rs3.getString("Categorie") %></option>
                            <%
                            }
                            %>
                       </select>
                    </div>
                  </div>
                  
                  
                  <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                      <button type="submit" name="creer" class="btn btn-success">Creer</button>
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
        var url = 'http://localhost:8080/biac/client.jsp';
        
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

