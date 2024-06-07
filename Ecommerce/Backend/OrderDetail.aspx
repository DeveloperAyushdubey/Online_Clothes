<%@ Page Title="" Language="C#" MasterPageFile="~/Backend/Ecommerce.Master" AutoEventWireup="true" CodeBehind="OrderDetail.aspx.cs" Inherits="Ecommerce.Backend.OrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-12 mb-5">
                <div class="row">
                    <div class="col-md-3 form-group">
                        Id
                     <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="col-md-3 form-group">
                        Name
                     <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="col-md-3 form-group">
                        Status
                      <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="col-md-3 form-group">
                    Update  Status<asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                            <asp:ListItem>Ordered</asp:ListItem>
                            <asp:ListItem>Pending</asp:ListItem>
                            <asp:ListItem>Delivered</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="mt-3">
                    <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" CssClass="btn btn-info" />
                </div>
            </div>
        </div>

        <div class="row d-flex">
         
            <h3 class="text-center">Search  Order Detail</h3>
            <div class="col-md-12 d-flex">
                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"  placeholder="Enter the name,Price,Quntity,ProductId, Username, Status"></asp:TextBox>
                <asp:Button ID="Button2" runat="server" Text="Search" Class="btn btn-primary"  OnClick="Button2_Click"/>
            </div>

        </div>

        <div class="row mt-5">
            <hr />
            <div class="col-md-12">
                <asp:GridView ID="GridView1" runat="server" ShowHeaderWhenEmpty="true" EmptyDataText="Record is not Found" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="Oid" HeaderText="Id" />
                        <asp:BoundField DataField="Oname" HeaderText="Name" />
                        <asp:BoundField DataField="Oprice" HeaderText="Price" />
                        <asp:BoundField DataField="Oquntity" HeaderText="Quntity" />
                        <asp:BoundField DataField="Pid" HeaderText="Product_Id" />
                        <asp:BoundField DataField="Customername" HeaderText="Customer_Email" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:BoundField DataField="Orderdate" HeaderText="OrderDate" />
                        <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass="btn btn-primary" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
