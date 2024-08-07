﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Backend_SignUp.aspx.cs" Inherits="Ecommerce.Accounts.Sinup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="../Assect/lib/owlcarousel/owl.carousel.min.js" rel="stylesheet">
<link href="../Assect/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="../Assect/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="../Assect/css/style.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div>
              <div class="container-xxl position-relative bg-white d-flex p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Sign Up Start -->
        <div class="container-fluid">
            <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
                <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
                    <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <a href="index.html" class="">
                                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>Admin Panel</h3>
                            </a>
                            <h4>Sign Up</h4>
                        </div>
                        <div class="form-floating mb-1">
                        
                            <asp:TextBox ID="name" runat="server" class="form-control"   placeholder="jhondoe"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter the Name" ControlToValidate="name" ForeColor="Red"></asp:RequiredFieldValidator>
                            <label for="floatingText">Username</label>
                        </div>
                        <div class="form-floating mb-1">
                            <asp:TextBox ID="Email" runat="server" class="form-control"   placeholder="name@example.com"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter the Email" ControlToValidate="Email" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter the Valid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email" ForeColor="Red"></asp:RegularExpressionValidator>
                            <label for="floatingInput">Email address</label>
                        </div>
                        <div class="form-floating mb-1">
                            <asp:TextBox ID="Password" runat="server" TextMode="Password" class="form-control"  MaxLength="10"   placeholder="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter the Password" ControlToValidate="Password" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Password must be at least 6 characters long." ValidationExpression=".{6,}" ControlToValidate="Password" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>

                            <label for="floatingPassword">Password</label>
                        </div>
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Check me out</label>
                            </div>
                            <a href="">Forgot Password</a>
                        </div>
                        <asp:Button ID="Button1" class="btn btn-primary py-3 w-100 mb-4" runat="server" Text="Button" OnClick="Button1_Click" />

                        <p class="text-center mb-0">Already have an Account? <a href="Backend_Login.aspx">Sign In</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sign Up End -->
                  
            <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../Assect/lib/chart/chart.min.js"></script>
    <script src="../Assect/lib/chart/chart.min.js"></script>
    <script src="../Assect/lib/waypoints/waypoints.min.js"></script>
    <script src="../Assect/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="../Assect/lib/tempusdominus/js/moment.min.js"></script>
    <script src="../Assect/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="../Assect/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="../Assect/js/main.js"></script>

    </div>
        </div>
    </form>
</body>
</html>
