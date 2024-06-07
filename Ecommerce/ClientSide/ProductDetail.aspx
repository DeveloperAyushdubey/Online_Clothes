<%@ Page Title="" Language="C#" MasterPageFile="~/ClientSide/ClientSide.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="Ecommerce.ClientSide.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <div class="row justify-content-center mt-5  mb-5">
            <h3 class="text-center"> <asp:Label ID="Product_name" runat="server" Text=""></asp:Label></h3>
            <hr />
            <div class="col-md-4">

                <asp:Image ID="Image1" runat="server" Height="400" Width="400" />

            </div>
            <div class="col-md-8">
                <table class="table table-striped table-bordered">
                    <tr class="h-25">
                        <th>id</th>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text="" CssClass="form-control"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>name</th>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="" CssClass="form-control"></asp:Label></td>
                    </tr>
                    <tr>
                        <th>quntity</th>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control"></asp:DropDownList>
                        </td>

                    </tr>
                    <tr>
                        <th>Price</th>
                        <td> <asp:Label ID="Label5" runat="server" Text="&#8377;"></asp:Label></td>
                    </tr>

                    <tr>
                        <th>Color </th>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="" CssClass="form-control"></asp:Label></td>
                    </tr>

                    <tr>
                        <th>Total Amount</th>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="&#8377;" CssClass="form-control"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="5">
                            <asp:Button ID="Button1" runat="server" Text="Order Now" Class=" w-100 btn btn-primary mt-5"  OnClick="Button1_Click"/></td>
                    </tr>
                    
                </table>
              
            </div>
        </div>
    </div>
</asp:Content>
