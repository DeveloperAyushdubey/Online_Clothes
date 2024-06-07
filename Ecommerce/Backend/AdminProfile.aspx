<%@ Page Title="" Language="C#" MasterPageFile="~/Backend/Ecommerce.Master" AutoEventWireup="true" CodeBehind="AdminProfile.aspx.cs" Inherits="Ecommerce.Backend.AdminProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row mt-5">
            <h1>Your  Profile</h1>
            <div class="col-md-12">
                <div class="row d-flex">
                    <div class="col-md-3 form-group">
                        <h5>Your Id</h5>
                    </div>
                    <div class="col-md-9 form-group">
                        <asp:TextBox ID="id" runat="server" CssClass="form-control" ></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="col-md-12 mt-4">
                <div class="row d-flex">
                    <div class="col-md-3 form-group">
                        <h5>Name</h5>
                    </div>
                    <div class="col-md-9 form-group ">
                        <asp:TextBox ID="name" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter the Name" ControlToValidate="name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <div class="col-md-12 mt-4">
                <div class="row d-flex">
                    <div class="col-md-3  form-group">
                        <h5>Email</h5>
                    </div>
                    <div class="col-md-9  form-group">
                        <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter the Email" ControlToValidate="email" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Enter the Valid Email" ForeColor="Red" ControlToValidate="email" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>
            <div class="col-md-12 mt-4">
                <div class="row d-flex">
                    <div class="col-md-3  form-group">
                        <h5>Password</h5>
                    </div>
                    <div class="col-md-9  form-group">
                        <asp:TextBox ID="pass" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter the Pass" ControlToValidate="pass" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <div class="col-md-12 mt-4">
                <asp:Button ID="Button1" runat="server" Text="Update"  CssClass="btn btn-primary" OnClick="Button1_Click"/>
            </div>

        </div>
    </div>
</asp:Content>
