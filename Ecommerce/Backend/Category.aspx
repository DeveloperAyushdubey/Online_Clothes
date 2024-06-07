<%@ Page Title="" Language="C#" MasterPageFile="~/Backend/Ecommerce.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="Ecommerce.Backend.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h1 class="text-center">Category Section</h1>
        <hr />
        <div class="row">

            <div class="col-md-12 form-group">
                Enter the Category name 
          <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter the category name" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-12 form-group pt-3">
                Status 
               <asp:CheckBox ID="CheckBox1" CssClass="form-check" runat="server" />
            </div>

            <div class="from-group py-3">
                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Button" CausesValidation="true"   OnClick="Button1_Click1" />
            </div>

        </div>
        <div  class="row mt-2 mb-5">
            <h3>Search Category</h3>
            <div class="col-md-12 form-group d-flex">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Enter the name,Stock etc "></asp:TextBox>
                <asp:Button ID="Button2" runat="server" Text="Button"  CssClass="btn btn-primary"  OnClick="Button2_Click"  CausesValidation="false"/>
            </div>
        </div>


        <div class="row">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true" EmptyDataText="Record Is Not Found"  PageSize="5" AllowPaging="true"  CssClass="table table-striped table-bordered" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" OnPageIndexChanging="GridView1_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="Cid" HeaderText="Cid" ReadOnly="true"  ControlStyle-CssClass="form-control">
<ControlStyle CssClass="form-control"></ControlStyle>
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Cname">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Cname") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Cname") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cstatus">
                        <EditItemTemplate>
                            <%--<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Cstatus") %>'></asp:TextBox>--%>
                            <asp:CheckBox ID="CheckBox2" runat="server" Text='<%#Bind("Cstock") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Cstock") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                  
                    <asp:CommandField ShowEditButton="True"  CausesValidation="false" HeaderText="Update"  ControlStyle-CssClass="btn btn-primary"/>
                    <asp:CommandField ShowDeleteButton="True"  CausesValidation="false" HeaderText="Delete" ControlStyle-CssClass="btn btn-danger"/>
                  
                    <asp:BoundField />
                  
                </Columns>
            </asp:GridView>
        </div>

    </div>
</asp:Content>
