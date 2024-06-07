<%@ Page Title="" Language="C#" MasterPageFile="~/Backend/Ecommerce.Master" AutoEventWireup="true" CodeBehind="Subcategory.aspx.cs" Inherits="Ecommerce.Backend.Subcategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


      <div class="container">
          <h1 class="text-center">Subcategory Section</h1>
          <hr />
      <div class="row">


          <div class="col-md-12 from-group">
             Select  Category
              <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Select the category" ControlToValidate="DropDownList1" ForeColor="Red"  Display="Dynamic"></asp:RequiredFieldValidator>
              <asp:Label ID="Label1" runat="server" Text="sELECT" ForeColor="Red" Visible="false"></asp:Label>
          </div>

          <div class="col-md-12 form-group py-3">
              Enter the Subcateory name 
        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter the Subcategory name" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>

          </div>
          <div class="col-md-12 form-group pt-2">
              Status 
             <asp:CheckBox ID="CheckBox1" CssClass="form-check" runat="server" />
          </div>

          <div class="from-group pt-1">
              <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Button" OnClick="Button1_Click"  CausesValidation="true"/>
          </div>

      </div>

          <div class="row mt-5 mb-5">
              <h3>Search Subcategory</h3>
              <div class="col-md-12 d-flex from-group">
                  <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Enter the name,Stock etc "> </asp:TextBox>
                  <asp:Button ID="Button2" runat="server" Text="Button" CssClass="btn btn-primary" CausesValidation="false" OnClick="Button2_Click"/>
              </div>
          </div>


      <div class="row mt-3">
          <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False"  PageSize="7"   CssClass="table table-striped table-bordered" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnPageIndexChanging="GridView1_PageIndexChanging">
              <Columns>
                  <asp:BoundField DataField="Sid" HeaderText="Sid"  ReadOnly="true" />
                  <asp:TemplateField HeaderText="Sname">
                      <EditItemTemplate>
                          <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Sname") %>'></asp:TextBox>
                      </EditItemTemplate>
                      <ItemTemplate>
                          <asp:Label ID="Label1" runat="server" Text='<%# Bind("Sname") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="Sstatus">
                      <EditItemTemplate>
                          <%--<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Sstock") %>'></asp:TextBox>--%>
                          <asp:CheckBox ID="CheckBox2" runat="server"  Text='<%#Bind("Sstock") %>' />
                      </EditItemTemplate>
                      <ItemTemplate>
                          <asp:Label ID="Label2" runat="server" Text='<%# Bind("Sstock") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>
                  <asp:BoundField DataField="Cid" HeaderText="Cid" ReadOnly="True" />
                  <asp:BoundField DataField="Datetime" HeaderText="Datetime" ReadOnly="true" />
                  <asp:CommandField HeaderText="Update" ShowEditButton="True" CausesValidation="false"  ControlStyle-CssClass="btn btn-primary" />
                  <asp:CommandField HeaderText="Delete" ShowDeleteButton="True"  CausesValidation="false" ControlStyle-CssClass="btn btn-danger"/>
              </Columns>
          </asp:GridView>
      </div>
  </div>
</asp:Content>
