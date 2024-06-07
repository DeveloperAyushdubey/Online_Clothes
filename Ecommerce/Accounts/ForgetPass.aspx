<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPass.aspx.cs" Inherits="Ecommerce.Accounts.ForgetPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
               <!-- Favicon -->
<link href="img/favicon.ico" rel="icon"/>

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com"/>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet"/>

<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet"/>

<!-- Libraries Stylesheet -->
<link href="../Assect/lib/owlcarousel/owl.carousel.min.js" rel="stylesheet"/>
<link href="../Assect/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="../Assect/css/bootstrap.min.css" rel="stylesheet"/>

<!-- Template Stylesheet -->
<link href="../Assect/css/style.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                 <div>
       
            <!-- Sign In Start -->
<div class="container-fluid">
    <div class="row h-100 align-items-center justify-content-center" style="min-height: 100vh;">
        <div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
            <div class="bg-light rounded p-4 p-sm-5 my-4 mx-3">
                <div class="d-flex align-items-center justify-content-between mb-3">
                    <a href="index.html" class="">
                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>Forget Password </h3>
                    </a>
               
                </div>
                <div class="form-floating mb-3">
                    <%--<input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">--%>
                    <asp:TextBox ID="email" runat="server" placeholder="name@example.com" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter the Email" ControlToValidate="email" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter the valid Email" ControlToValidate="email" ForeColor="Red" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <label for="floatingInput">Email address</label>
                </div>
             
                <div class="d-flex align-items-center justify-content-between mb-4">
                  
                  
                </div>
               
                <asp:Button ID="Button2" runat="server"  class="btn btn-primary py-3 w-100 mb-4"  OnClick="Button2_Click"   Text="Button" />
             
                <p class="text-center mb-0">Don't have an Account? <a href="Backend_Login.aspx">Login Page</a></p>
            </div>
        </div>
    </div>
</div>   
<!-- Sign In End -->
     </div>
        </div>
    </form>
</body>
</html>
