<%@page import="java.sql.*"%>
<%
    if(request.getParameter("add")!=null)
    {
    String postnom = request.getParameter("postnom");
    String nom = request.getParameter("nom");
    String prenom = request.getParameter("prenom");
    String adresse = request.getParameter("adresse");
    String fonction = request.getParameter("fonction");
    String telephone = request.getParameter("telephone");
    String salaire = request.getParameter("salaire");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
       PreparedStatement ps = conn.prepareStatement("INSERT INTO t_agent(NomAgent, PostnomAgent, PrenomAgent, TelephoneAgent, AdresseAgent, CodeFonction, SalaireMensuel, Username, Password)VALUES(?,?,?,?,?,?,?,?,?)");
       ps.setString(1, nom);
       ps.setString(2, postnom);
       ps.setString(3, prenom);
       ps.setString(4, telephone);
       ps.setString(5, adresse);
       ps.setString(6, fonction);
       ps.setString(7, salaire);
       ps.setString(8, username);
       ps.setString(9, password);
      int x=ps.executeUpdate();
%>
<script>
    alert("Agent bien enregiste");
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
        Agents
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Agents</a></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box" style="overflow: auto;">
            <div class="box-header">
                <a href="#addagent" data-toggle="modal" class="btn btn-primary btn-sm btn-flat"><i class="fa fa-plus"></i> Nouveau</a>
                
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Nom</th>
                  <th>Telephone</th>
                  <th>Adresse</th>
                  <th>Fonction</th>
                  <th>Salaire</th>
                  <th>Username</th>
                  <th>Password</th>
                  <th>Action</th>
                </tr>
                </thead>
                <tbody>
                              
                                <%
                                ResultSet rs;
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
                                String query = ("SELECT * FROM t_agent INNER JOIN t_fonction ON t_agent.CodeFonction=t_fonction.CodeFonction LEFT JOIN t_user ON t_agent.CodeAgent=t_user.CodeAgent");
                                Statement st = conn3.createStatement();
                                rs = st.executeQuery(query);
                                while(rs.next())
                                {
                                    String id = rs.getString("CodeAgent");
                                    %>
                                                <tr>
                                                    <td><%=rs.getString("NomAgent")+' '+rs.getString("PostnomAgent")+' '+rs.getString("PrenomAgent") %></td>
                                                    <td><%=rs.getString("TelephoneAgent") %></td>
                                                    <td><%=rs.getString("AdresseAgent") %></td>
                                                    <td><%=rs.getString("Fonction") %></td>
                                                    <td><%=rs.getString("SalaireMensuel") %> $</td>
                                                    <td><%=rs.getString("Username") %></td>
                                                    <td><%=rs.getString("Password") %></td>
                                                    <td>
                                                        <a href='profileagent.jsp?id=<%=id %>' class='btn btn-primary btn-sm btn-flat'><i class='fa fa-user'> Profile</i></a>
                                                        <a href='updateagent.jsp?id=<%=id %>' class='btn btn-success btn-sm btn-flat'><i class='fa fa-edit'></i></a>
                                                        <a href='deleteagent.jsp?id=<%=id %>' class='btn btn-danger btn-sm btn-flat'><i class='fa fa-remove'></i></a>
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
                            <input type="number" class="form-control" name="salaire" placeholder="Salaire" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="username" placeholder="Username" required>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" name="password" placeholder="Password" required>
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
        var url = window.location;
        
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

