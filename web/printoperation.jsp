<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>

<!-- Mirrored from adminlte.io/themes/AdminLTE/pages/tables/data.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 21 Sep 2021 10:11:07 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=utf-8" /><!-- /Added by HTTrack -->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
<body class="hold-transition skin-blue sidebar-mini" onload="imprimer();" style="background-color: #3c8dbc;">

    <div class="container" style="padding: 10px;">
        <div class="row">
            <div class="col-lg-12">
                <h3 style="text-align: center;">FICHE D'OPERATION DE LA BIAC</h3>
                <br>
                <br>
                <table>
                    <tbody>
                        <%
        ResultSet rs;
        PreparedStatement pst;
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspbanque","root","");
        String id = request.getParameter("id");
        pst = conn.prepareStatement("SELECT * FROM t_mouvement INNER JOIN t_compte ON t_mouvement.CodeCompte=t_compte.CodeCompte INNER JOIN t_client ON t_compte.CodeClient=t_client.CodeClient WHERE t_mouvement.CodeMouvement=?");
        pst.setString(1, id);
        rs = pst.executeQuery();
        while(rs.next())
                                {
                                    int type = rs.getInt("CodeType");
                                    
                                    %>
                        <tr>
                            <td>Compte : </td>
                            <td><%=rs.getString("NumeroCompte") %></td>
                        </tr>
                        <%
                            if(type==1){
                                %>
                                <tr>
                                    <td>Type d'operation :</td>
                                    <td>Depot</td>
                                </tr>
                                <%
                                
                            }else if(type==2){
                                %>
                                <tr>
                                    <td>Type d'operation :</td>
                                    <td>Retrait</td>
                                </tr>
                                <%
                                
                            }else if(type==3){
                                %>
                                <tr>
                                    <td>Type d'operation :</td>
                                    <td>Virement</td>
                                </tr>
                                <%
                                
                                    }
                            %>
                        
                        <tr>
                            <td>Date : </td>
                            <td><%=rs.getString("Date") %></td>
                        </tr>
                        <tr>
                            <td>Montant : </td>
                            <td><%=rs.getString("Montant") %> $</td>
                        </tr>
                        <tr>
                            <td>Responsable du compte : </td>
                            <td><%=rs.getString("NomClient")+' '+rs.getString("PostnomClient")+' '+rs.getString("PostnomClient") %></td>
                        </tr>
                                    <%
                                } %>
                        
                    </tbody>
                </table>
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
        function imprimer(){
            window.print();
            }
    </script>
   
    <!-- Add -->

</body>

</html>



