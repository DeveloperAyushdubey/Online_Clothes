<%@ Page Title="" Language="C#" MasterPageFile="~/Backend/Ecommerce.Master" AutoEventWireup="true" CodeBehind="Userpage.aspx.cs" Inherits="Ecommerce.Backend.Userpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    ,<div class="container">
        <h2>User Detail</h2>
        <div class="row">
            <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="false"   CssClass="table table-striped table-bordered" >
                <Columns>
                    <asp:BoundField DataField="Uid" HeaderText="Id" />
                    <asp:BoundField DataField="Uname" HeaderText="Name" />
                    <asp:BoundField DataField="Uemail" HeaderText="Email" />
                    <asp:BoundField DataField="Umob" HeaderText="Mobile No." />
                    <asp:BoundField DataField="Upass" HeaderText="Password" />
                    <asp:BoundField DataField="Uconpass" HeaderText="Confirm Password" />
                    <asp:BoundField DataField="datetime" HeaderText="Join Date" />
                </Columns>
            </asp:GridView>
        </div>
     </div>
</asp:Content>
