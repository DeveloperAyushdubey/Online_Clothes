<%@ Page Title="" Language="C#" MasterPageFile="~/ClientSide/ClientSide.Master" AutoEventWireup="true" CodeBehind="YourOrder.aspx.cs" Inherits="Ecommerce.ClientSide.YourOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mb-5">

        <div class="row mt-5  mb-5">
            <h3 class="bg-primary text-light p-3 text-center">Your Order</h3>
              <table  CssClass="table table-striped table-bordered border-3">
                  <tr class="border-2 bg-primary text-light p-5 text-center">
                      <th class="p-3">Order Name</th>
                      <th>Order Quntity</th>
                      <th>Order Price</th>
                      <th>Order TotalAmount</th>
                      <th>Status</th>
                  </tr>
                  <tr class="border-2 text-center text-dark p-3">
                      <td class="p-3"> <asp:Label ID="name" runat="server" Text=""></asp:Label></td>
                      <td> <asp:Label ID="quntity" runat="server" Text=""></asp:Label></td>
                      <td> <asp:Label ID="price" runat="server" Text=""></asp:Label></td>
                      <td> <asp:Label ID="TotalAmount" runat="server" Text=""></asp:Label></td>
                      <td> <asp:Label ID="Status" runat="server" Text=""></asp:Label></td>
                  </tr>
              </table>
        </div>
    </div>
</asp:Content>
