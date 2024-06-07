<%@ Page Title="" Language="C#" MasterPageFile="~/Backend/Ecommerce.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Ecommerce.Backend.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Sale & Revenue Start -->
    <div class="container-fluid pt-4 px-4">
        <div class="row g-4">
            <div class="col-sm-6 col-xl-4">
                <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">

                    <div class="ms-3">
                        <p class="mb-2">Category</p>
                        <div class="row">
                            <h6 class="mb-0">Active 
                                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                            </h6>
                            <h6 class="mb-0">Inactive
                                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                            </h6>
                           <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Go to Category Page</asp:LinkButton>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-sm-6 col-xl-4">
                <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">

                    <div class="ms-3">
                        <p class="mb-2">Subcategory</p>
                        <div class="row">
                            <h6 class="mb-0">Active
                                      <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                            </h6>
                            <h6 class="mb-0">InActive
                                      <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                            </h6>
                           <asp:LinkButton ID="LinkButton2" runat="server"  OnClick="LinkButton2_Click">Go to Subcategory Page</asp:LinkButton>

                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-xl-4">
                <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">

                    <div class="ms-3">
                        <p class="mb-2">Order Product</p>
                        <div class="row">
                            <h6 class="mb-0">Order
                     <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
                            </h6>
                            <h6 class="mb-0">Panding
                     <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                            </h6>
                            <h6 class="mb-0">Deliverd
                                <asp:Label ID="Label7" runat="server" Text=""></asp:Label>
                            </h6>
                           <asp:LinkButton ID="LinkButton3" runat="server"  OnClick="LinkButton3_Click">Go to OrderProduct Page</asp:LinkButton>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Sale & Revenue End -->
</asp:Content>
