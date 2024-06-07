<%@ Page Title="" Language="C#" MasterPageFile="~/Backend/Ecommerce.Master" AutoEventWireup="true" CodeBehind="Productpage.aspx.cs" Inherits="Ecommerce.Backend.Productpage"  ValidateRequest="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row mb-4">
            <div class="col-md-4 form-group">
                Id
                 <asp:TextBox ID="TextBox6" CssClass="form-control" runat="server" ReadOnly="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select the Product" ControlToValidate="TextBox6" ForeColor="Red"></asp:RequiredFieldValidator>

            </div> 
            <div class="col-md-4 form-group">
                name
                <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select the Product" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
            <div class="col-md-4 form-group">
                Price
                <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Select the Product" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
           
        </div>

        <div class="row">
            <div class="col-md-4 form-group">
                Quntity
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Select the Product" ControlToValidate="TextBox3" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
            <div class="col-md-4 form-group">
                Color
                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Select the Product" ControlToValidate="TextBox4" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>
            <div class="col-md-4 form-group">
                TotalAmoount
                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Select the Product" ControlToValidate="TextBox5" ForeColor="Red"></asp:RequiredFieldValidator>


            </div>
          <div class="row mt-4">
              <asp:Button ID="Button2" runat="server" Text="Update"  CssClass="col-md-3 btn btn-info"  OnClick="Button2_Click"  CausesValidation="true"/>
              <asp:Button ID="Button1" runat="server" Text="Delete"  CssClass="col-md-3  btn btn-danger"  OnClick="Button1_Click" CausesValidation="true"/>
          </div>
        </div>

        <div class="row mt-5 mb-5">
            <h3>Search Product</h3>
                <div class="col-md-11 d-flex">
                       <asp:TextBox ID="TextBox7" runat="server" CssClass=" form-control col-md-6" OnTextChanged="TextBox7_TextChanged" placeholder="Enter the Product name,price,color,quntity,totalamount etc "></asp:TextBox> 
                    <asp:Button ID="Button3" runat="server" Text="Button" CausesValidation="false" CssClass="btn btn-primary" OnClick="Button3_Click"/>
                </div>
             
             
           
        </div>


        <div class="row mt-5">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="8" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" EmptyDataText="Invalid data" CssClass="table table-striped table-bordered" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="pid" HeaderText="pid" />
                    <asp:BoundField DataField="Pname" HeaderText="Pname" />
                    <asp:BoundField DataField="Pprice" HeaderText="Pprice" />
                    <asp:BoundField DataField="Pcolor" HeaderText="Pcolor" />
                    <asp:BoundField DataField="Pquntity" HeaderText="Pquntity" />
                    <asp:BoundField DataField="totalAmount" HeaderText="TotalAmount" />
                    <asp:TemplateField HeaderText="Image1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Image1") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Image1") %>' Visible="false"></asp:Label>
                            <img src='/Models/<%#Eval("Image1") %>' height="100" width="100" />
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Image2">
                      
                        <ItemTemplate>
                            <%--<asp:Label ID="Label2" runat="server" Text='<%# Bind("image2") %>'></asp:Label>--%>
                            <img src='/Models/<%#Eval("Image2") %>' height="100" width="100" />

                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Image3">
                     
                        <ItemTemplate>
                            <%--<asp:Label ID="Label3" runat="server" Text='<%# Bind("image3") %>'></asp:Label>--%>
                            <img src='/Models/<%#Eval("Image3") %>' height="100" width="100" />

                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:CommandField ShowSelectButton="True"  ControlStyle-CssClass="btn btn-primary" >
<ControlStyle CssClass="btn btn-primary"></ControlStyle>
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
