<%@ Page Title="" Language="C#" MasterPageFile="~/ClientSide/ClientSide.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="Ecommerce.ClientSide.Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Page Header Start -->
    <div class="container-fluid page-header py-5">
        <div class="container text-center py-5">
            <h1 class="display-2 text-white mb-4 animated slideInDown">Services</h1>
            <nav aria-label="breadcrumb animated slideInDown">
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Pages</a></li>
                    <li class="breadcrumb-item" aria-current="page">Services</li>
                </ol>
            </nav>
        </div>
    </div>
    <!-- Page Header End -->
    <!-- Fact Start -->
    <div class="container-fluid bg-secondary py-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 wow fadeIn" data-wow-delay=".1s">
                    <div class="d-flex counter">
                        <h1 class="me-3 text-primary counter-value">99</h1>
                        <h5 class="text-white mt-1">Success in getting happy customer</h5>
                    </div>
                </div>
                <div class="col-lg-3 wow fadeIn" data-wow-delay=".3s">
                    <div class="d-flex counter">
                        <h1 class="me-3 text-primary counter-value">25</h1>
                        <h5 class="text-white mt-1">Thousands of successful business</h5>
                    </div>
                </div>
                <div class="col-lg-3 wow fadeIn" data-wow-delay=".5s">
                    <div class="d-flex counter">
                        <h1 class="me-3 text-primary counter-value">120</h1>
                        <h5 class="text-white mt-1">Total clients who love Online clothes</h5>
                    </div>
                </div>
                <div class="col-lg-3 wow fadeIn" data-wow-delay=".7s">
                    <div class="d-flex counter">
                        <h1 class="me-3 text-primary counter-value">5</h1>
                        <h5 class="text-white mt-1">Stars reviews given by satisfied clients</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Fact End -->


    <div class="container">
        <div class="row">
            <div class="col-md-3 mt-5">
                <div class="row mt-5">
                    <div class="col-12 mt-5">
                        <h5>Category</h5>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </div>
                    <div class="col-12 mt-5">
                        <h5>Subcategory</h5>
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </div>
                    <div class="col-12 mt-5 mb-5">
                        <h5>Product</h5>
                        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </div>


                </div>
            </div>




            <div class="col-md-9">
                <!-- Services Start -->
                <div class="container-fluid services py-5 mb-5">
                    <div class="container">
                        <div class="text-center mx-auto pb-5 wow fadeIn" data-wow-delay=".3s" style="max-width: 600px;">

                            <h1>Latesh Product</h1>
                        </div>
                        <div class="row g-5 services-inner">
                           
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-6 col-lg-4 wow fadeIn" data-wow-delay=".3s">
                                        <div class="services-item bg-light">
                                            <div class="p-4 text-center services-content">
                                                <div class="services-content-icon">
                                                    <img src='/models/<%#Eval("image2")%>' height="200" width="200" />
                                                    <i class='<%# Eval("pname") %> fa-7x mb-4 text-primary'></i>
                                                    <h4 class="mb-3"><%# Eval("Pname") %></h4>
                                                    <h4 class="mb-3">Price:  &#8377;<%#  Eval("Pprice") %></h4>

                                                    <a href="ProductDetail.aspx?Pid=<%#Eval("Pid") %>" class="btn btn-secondary text-white px-5 py-3 rounded-pill">Show</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>

                <!-- Services End -->

            </div>
        </div>
    </div>
</asp:Content>
