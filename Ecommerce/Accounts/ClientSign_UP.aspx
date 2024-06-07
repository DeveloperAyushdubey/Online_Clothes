<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientSign_UP.aspx.cs" Inherits="Ecommerce.Accounts.ClientSign_UP" %>



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
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
                        <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-8">
                            <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                                <div class="d-flex align-items-center mb-3">
                                    <a href="index.html" class="">
                                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i></h3>
                                    </a>
                                    <h4>Sign Up</h4>
                                </div>
                                <div class="row">
                                    <div class="col-md-6  form-group">
                                        ayush
                             <asp:TextBox ID="name" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="name" ForeColor="Red"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="col-md-6 form-group">
                                        Email
                             <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter the Email" ControlToValidate="email" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter the valid Email id" ControlToValidate="email" ForeColor="Red" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="row mb-3 mt-4">
                                    <div class="col-md-6  form-group">
                                        Mobile N0.
                                    <asp:TextBox ID="Mobile" runat="server" MaxLength="10" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter the Mobile No." ControlToValidate="Mobile" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        Addressh

                                     <asp:TextBox ID="addressh" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter  the Addressh" ControlToValidate="addressh"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6  form-group">
                                        Password
                                         <asp:TextBox ID="pass" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter  the Pass" ControlToValidate="pass" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        Con Pass
                                    <asp:TextBox ID="ConPass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter the Con Pass " ControlToValidate="ConPass" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Not match Conpass" ControlToCompare="pass" ControlToValidate="Conpass"></asp:CompareValidator>
                                    </div>
                                </div>
                              <div class="row mt-3">
                                    <asp:Button ID="Button1" class="btn btn-primary py-3 w-100 mb-4" runat="server" Text="Button" OnClick="Button1_Click" />
                              </div>

                                <p class="text-center mb-0">Already have an Account? <a href="Client_Login.aspx">Sign In</a></p>
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
