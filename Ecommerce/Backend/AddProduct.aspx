<%@ Page Title="" Language="C#" MasterPageFile="~/Backend/Ecommerce.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Ecommerce.Backend.Product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="text-center">Fill the Product  Form</h1>
        <hr />
        <div class="row">
            <div class="col-md-6 form-group">
                Select Category
                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Category" ControlToValidate="DropDownList1" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-6  form-group">
                Select Subcategory
                <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" ></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select SubCategory"  ControlToValidate="DropDownList2" ForeColor="Red"></asp:RequiredFieldValidator>
            
            </div>
        </div>

        <div class="row pt-3">

            <div class="col-md-6 form-group">
                Enter the Product Name
                <asp:TextBox ID="name"  CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter the Product name" ControlToValidate="name" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
            <div class="col-md-6 form-group">
                Enter the Price 
                <asp:TextBox ID="Price" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Enter the Product Price" ControlToValidate="Price" ForeColor="Red"></asp:RequiredFieldValidator>
         
                </div>
        </div>
        <div class="row pt-3">
            <div class="col-md-6 form-group">
                Quntity
                <asp:TextBox ID="Quntity" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter the Product Quntity" ControlToValidate="Quntity" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
            <div class="col-md-6  form-group">
                Color
                <asp:TextBox ID="Color" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Enter the Color name" ControlToValidate="Color" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
        </div>
        <div class="row pt-3">
            <div class="col-md-4 form-group">
                Image 1
                <asp:FileUpload ID="Image1" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter the Product Image1" ControlToValidate="Image1" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
            <div class="col-md-4 form-group">
                Image 2
                <asp:FileUpload ID="Image2" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Enter the Product Image2" ControlToValidate="Image2" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
            <div class="col-md-4 form-group">
                Image 3
                <asp:FileUpload ID="Image3" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Enter the Product Image3" ControlToValidate="Image3" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
        </div>
        <div>
            <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Button" OnClick="Button1_Click"  />
        </div>
    </div>
</asp:Content>
