﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="order-list.aspx.cs" Inherits="order_list" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="5x5" href="assets/img/favicon.png">
    <title>KwickWash</title>
    <template id="ctrheadercss">
    </template>
    <style type="text/css">
        .classOrder {
            background-color: #6ab215;
        }

        .unitCss {
            background: #6ab215;
            color: white;
            padding: 2px;
            border-radius: 3px;
        }

        .priceCss {
            background: darkorange;
            padding: 2px;
            margin: 2px;
            color: white;
            border-radius: 3px;
        }

        .btnCart1 {
            background: darkred;
            padding: 2px;
            color: white;
            float: right;
            margin: 0px;
            border-radius: 3px;
            cursor: pointer;
            width: 25px;
            text-align: center;
            font-weight: bold;
        }

        .applyDis {
            background-color: indianred;
            color: white;
            font-size: 14px;
            padding: 5px;
            border-radius: 2px;
        }

        input#txtCoupon {
            width: 104px;
            margin: 10px;
        }

        .serviceCss {
            background-color: darksalmon;
            padding: 2px;
            margin: 2px;
            color: white;
            border-radius: 3px;
        }

        .productCss {
            background-color: darkseagreen;
            padding: 2px;
            margin: 2px;
            color: white;
            border-radius: 3px;
        }

        .dataTable thead .sorting:after {
            content: "\f0dc";
            float: right;
            font-family: 'Font Awesome 5 Free';
            font-weight: 900;
            color: #9FCB39 !important;
            font-size: 16px;
        }

        .dataTable thead .sorting:after {
            opacity: 0.9 !important;
            content: "\e150";
        }

        .modal {
            overflow: scroll !important;
        }
    </style>
</head>

<body class="fix-header">
    <form id="f1" runat="server">   
    <div class="preloader">
        <svg class="circular" viewBox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" />
        </svg>
    </div>
    <div id="wrapper">
        <!-- Start Topbar header-->
        <div id="ctrheader"></div>
        <!-- End Topbar header-->
        <!-- Start Left Sidebar -->
        <div class="navbar-default sidebar" role="navigation" id="ctrLeftMenu">
        </div>
        <!-- End Left Sidebar -->
        <!-- Page Content -->
        <!-- ============================================================== -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Order List</h4>
                    </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                        <a href="#orderBox" onclick="inputClearOrder();" class="btn btn-primary" data-toggle="modal" type="button" aria-haspopup="true" aria-expanded="false" style="float: right;">
                            <i class="fab fa-servicestack"> </i> New Order
                        </a>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>

                <div class="col-md-12">
                    <!-- .row -->
                    <div class="row">

                        <!-- </div> -->
                        <!-- /.row -->
                        <!-- ============================================================== -->
                        <!-- /row -->
                        <!-- <div class="row"> -->

                        <asp:HiddenField ID="hddUserId" runat="server" />
                        <div class="col-sm-12">
                            <div class="white-box">
                                <h3 class="box-title m-b-0">Order List</h3>
                                <div class="table-responsive" style="overflow: auto;" id="divMyShopOrder" runat="server">
                                   
                                     
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
            </div>
            <!-- /.container-fluid -->
            <div id="ctrFooter"></div>
        </div>
        <!-- ============================================================== -->
        <!-- End Page Content -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <script src="assets/plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="assets/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="assets/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <!--slimscroll JavaScript -->
    <script src="assets/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="assets/js/waves.js"></script>
    <!--Counter js -->
    <!--Morris JavaScript -->
    <script src="assets/plugins/bower_components/raphael/raphael-min.js"></script>
    <script src="assets/plugins/bower_components/morrisjs/morris.js"></script>
    <!-- chartist chart -->
    <script src="assets/plugins/bower_components/chartist-js/dist/chartist.min.js"></script>
    <script src="assets/plugins/bower_components/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.min.js"></script>
    <!-- Calendar JavaScript -->
    <script src="assets/plugins/bower_components/moment/moment.js"></script>
    <script src='assets/plugins/bower_components/calendar/dist/fullcalendar.min.js'></script>
    <script src="assets/plugins/bower_components/calendar/dist/cal-init.js"></script>
    <script src="assets/plugins/bower_components/Minimal-Gauge-chart/js/cmGauge.js"></script>
    <!-- Date Picker Plugin JavaScript -->
    <script src="assets/plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <!-- Date range Plugin JavaScript -->
    <script src="assets/plugins/bower_components/timepicker/bootstrap-timepicker.min.js"></script>
    <script src="assets/plugins/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script src="assets/plugins/bower_components/sweetalert/sweetalert.min.js"></script>
    <!-- Magnific popup JavaScript -->
    <script src="assets/plugins/bower_components/Magnific-Popup-master/dist/jquery.magnific-popup.min.js"></script>
    <script src="assets/plugins/bower_components/Magnific-Popup-master/dist/jquery.magnific-popup-init.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="assets/js/validator.js"></script>
    <script src="assets/js/custom.min.js"></script>
    <!--<script src="assets/js/dashboard1.js"></script>-->
    <script src="assets/js/dashboard2.js"></script>
    <script src="assets/js/jquery.PrintArea.js" type="text/JavaScript"></script>
    <!--Counter js -->

    <style type="text/css">
        .btnAdd {
            border-radius: 5px;
            margin-right: 10px;
            padding: 5px 7px 4px 6px;
            font-weight: bold;
            margin-left: 12px;
            border: 1px solid;
        }

        .delete {
            font-size: 20px;
        }
    </style>
    <script>
        $(document).ready(function () {
            /// Upload Image ///
            var button = $('#btn_Image'), interval;
            new AjaxUpload(button, {
                action: 'services/serviceImg.ashx',
                name: 'myImage',
                onSubmit: function (file, ext) {
                    if (ext && /^(jpg|png|jpeg|gif)$/.test(ext)) {
                        button.text('Uploading');
                        this.disable();
                        interval = window.setInterval(function () {
                            var text = button.text();
                            if (text.length < 13) {
                                button.text(text + '.');
                            } else {
                                button.text('Uploading');
                            }
                        }, 200);

                    } else {
                        alert("Error: jpg|png|jpeg|gif types file are allowed");
                        return false;
                    }
                },
                onComplete: function (file, response) {
                    button.val('Upload Image');
                    window.clearInterval(interval);
                    this.enable();
                    try { if ($('#hd_Image').val() !== "") { $.fn.DeleteFile($('#hd_Image').val()); } } catch (e) { }
                    $('#hd_Image').val("upload/serviceImg/" + response);
                    $("#imgPath").attr('src', "upload/serviceImg/" + response);
                }
            });
        });



        function bgLoad() {
            //BindMyProduct();
            BindOrder(1);
            getDriver();
            CompanyProfile();
            $("#hddUserId").val($('#hd_Userid').val());
        }

        function BindOrder(pageno) {
            if (pageno == 0)
                pageno = 1;
            $('#listMyOrder').html('<td colspan="6" style="text-align: center;"><span><i class="fa fa-spinner fa-spin" style="color:#9FCB39; font-size:40px; text-align:center;"></i></span></td>');
            var id = $('#hd_Userid').val();
            var url = "apiService.asmx/GetOrderList";
            var data = "{id:'" + id + "',pageno:'" + pageno + "'}";
            var ctr = 0;
            $.ajax({
                url: url,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                type: 'POST',
                data:data,
                success: function (data) {
                    _details = data;
                    var _htmlTable = "";
                    if (typeof (_details) !== 'undefined') {
                        $.each(_details, function (i, object) {
                            ctr++;
                            _htmlTable += '<tr>';
                            _htmlTable += '<td style="display:none;">' + ctr + '</td>';
                            _htmlTable += '<td>' + object.orderId + '</td>';
                            _htmlTable += '<td>' + object.name + '</td>';
                            _htmlTable += '<td>' + object.mobile + '</td>';
                            _htmlTable += '<td>' + Number(object.ttlPayableAmount).toFixed(2) + '</td>';
                            _htmlTable += '<td>' + object.status + '</td>';
                            _htmlTable += '<td>' + object.orderDate + '</td>';
                            _htmlTable += '<td>' + object.deliveryDate + '</td>';
                            _htmlTable += '<td class="text-center">';
                            _htmlTable += '<a class="btn btn-info" title="Barcode" target="_blank" href="barcode.html?oid=' + object.orderId + '">View</a>';
                            _htmlTable += '</td>';
                            _htmlTable += '<td class="text-center">';
                            _htmlTable += '<a class="btn btn-success" title="Cart" target="_blank" href="order-inv.html?oid=' + object.orderId + '">Order Details</a>';                           
                            _htmlTable += '</td>';
                            //_htmlTable += '<td class="text-center">';
                            //_htmlTable += '<a class="btn btn-danger"  onclick="orderDlt(' + object.orderId + ');" title="Cart" href="#">Order Delete</a>';
                            //_htmlTable += '</td>';
                            _htmlTable += '</tr>';
                        });
                    }
                    $('#listMyOrder').html(_htmlTable);
                    $('#myShopOrder').DataTable();

                },
                error: function (errorThrown) {
                    console.log(errorThrown);
                }
            });
        }

        function orderDlt(oid) {
            var x = confirm("Are you sure you want to delete?");
            if (x) {
                var data = "{oid:'" + oid + "'}";
                var url = "apiService.asmx/OrderDlt";
                $.ajax({
                    url: url,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    type: 'POST',
                    data: data,
                    success: function (data, XMLHttpRequest) {
                        $.alert({
                            title: 'Success!',
                            content: 'Order deleted successfully',
                        });
                        BindOrder();
                    },
                    error: function (XMLHttpRequest, errorThrown) {

                    }
                });
               
            } else
                return false;
        }

        function getCustomer() {
            $('.loader').show();
            var mobile = $('#txtCustomerMobile').val();
            var url = "https://api.kwickwash.com/api/Profile/GetCustomer?mobile=" + mobile + "&shopUserid=0";
            var status = 0;
            $.ajax({
                url: url,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                type: 'GET',
                success: function (data) {
                    _details = data;
                    if (typeof (_details) !== 'undefined') {
                        $.each(_details, function (i, object) {
                            status = 1;
                            $('#hd_CUserId').val(object.userId);
                            $('#txtCustomerName').val(object.name);
                            $('#txtaddress').val(object.address);
                            $('#txtstate').val(object.state);
                            $('#txtcity').val(object.city);
                            $('#txtpincode').val(object.pincode);
                            $('.loader').hide();
                            BindMyCart();
                        });
                    }
                    if (status == 0) {
                        alert("Customer not fount...");
                        inputClear();
                        $('#orderBox').each(function () {
                            $(this).modal('hide');
                        });
                        $('#txtmobile').val(mobile);
                        $('#customerBox').each(function () {
                            $(this).modal('show');
                        });
                    }
                },
                error: function (errorThrown) {
                    console.log(errorThrown);
                }
            });
        }

        //Bind My Product list code
        function BindMyProduct() {
            var priceType = $('#ddDropRequest').val();
            //alert(id);
            $('#listMyProdcut').html('<td colspan="6" style="text-align: center;"><span><i class="fa fa-spinner fa-spin" style="color:#9FCB39; font-size:40px; text-align:center;"></i></span></td>');
            var id = $('#hd_Userid').val();
            var url = "https://api.kwickwash.com/api/myproduct/" + id;
            //alert(url);
            $.ajax({
                url: url,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                type: 'GET',
                success: function (data) {
                    _details = data;
                    var _htmlTable = "";
                    if (typeof (_details) !== 'undefined') {
                        $.each(_details, function (i, object) {
                            _htmlTable += '<tr>';
                            var ctr = 1 + i;
                            _htmlTable += '<td>' + ctr + '</td>';
                            _htmlTable += '<td>' + object.serviceName + '</td>';
                            _htmlTable += ' <td>' + object.productName + '</td>';
                            _htmlTable += ' <td>' + object.unit + '</td>';
                            if (priceType == 'Self') {
                                if (object.proId == '243') {
                                    alert(priceType);
                                    alert(object.myPrice);
                                }
                                _htmlTable += ' <td>' + object.myPrice + '</td>';
                            }
                            else {
                                if (object.proId == '243') {
                                    alert(priceType);
                                    alert(object.myPrice);
                                }
                                _htmlTable += ' <td>' + object.myPrice1 + '</td>';
                            }

                            if (object.serviceImg == 'undefined') {
                                _htmlTable += '<td><i class="fa fa-picture-o" style="font-size: 29px"></i></td>';
                            }
                            else {
                                _htmlTable += '<td><img style="border-radius: 50%;width: 40px;height: 40px;" src="http://admin.kwickwash.in/' + object.proImg + '" /></td>';
                            }
                            _htmlTable += '<td class="text-center">';
                            _htmlTable += '<a class="btnCart" title="Cart" id="btnCart_' + object.proId + '" onclick="addTocart(' + object.proId + ');">ADD TO CART</a>';
                            _htmlTable += '</td></tr>';
                        });
                    }
                    $('#listMyProdcut').html(_htmlTable);
                    $('#myProductList').DataTable();

                },
                error: function (errorThrown) {
                    console.log(errorThrown);
                }
            });
        }

        function myProduct() {
            var priceType = $('#ddDropRequest').val();
            if (priceType == "Drop Off") {
                $('#divDriver').hide();
            }
            else {
                $('#divDriver').show();
            }
            $('#listMyProdcut').html('<td colspan="6" style="text-align: center;"><span><i class="fa fa-spinner fa-spin" style="color:#9FCB39; font-size:40px; text-align:center;"></i></span></td>');
            var id = $('#hd_Userid').val();
            var url = "https://api.kwickwash.com/api/myproduct/" + id;
            //alert(url);
            $.ajax({
                url: url,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                type: 'GET',
                success: function (data) {
                    _details = data;
                    var _htmlTable = "";
                    if (typeof (_details) !== 'undefined') {
                        $.each(_details, function (i, object) {
                            _htmlTable += '<tr>';
                            _htmlTable += ' <td style="padding: 3px;"><span class="serviceCss">' + object.serviceName + '</span>&nbsp;<span class="productCss">' + object.productName + '</span>&nbsp;<br/><span class="unitCss"> ' + object.unit + '</span>';
                            if (priceType == "Self") {
                                if (object.proId == '58') {

                                }
                                // _htmlTable += '<span class="priceCss">' + Number(object.myPrice).toFixed(2) + '</span>';
                            }
                            else if (priceType == "Delivery") {
                                if (object.proId == '58') {

                                }
                                // _htmlTable += ' <span class="priceCss">' + Number(object.myPrice1).toFixed(2);
                            }
                            _htmlTable += '<span class="priceCss">' + Number(object.myPrice).toFixed(2) + '</span>';
                            _htmlTable += ' <span class="priceCss">' + Number(object.myPrice1).toFixed(2) + '</span>';
                            _htmlTable += '&nbsp;<a class="btnCart1" title="Cart" id="btnCart_' + object.proId + '" onclick="addTocart(' + object.proId + ');">+</a></td>';
                        });
                    }
                    $('#listMyProdcut').html(_htmlTable);
                    $('#myProductList').DataTable();

                },
                error: function (errorThrown) {
                    console.log(errorThrown);
                }
            });
        }

        //input clear
        function inputClear() {
            $('#txtCustomerName').val('');
            $('#txtaddress').val('');
            $('#txtstate').val('');
            $('#txtcity').val('');
            $('#txtpincode').val('');
            $('#hd_CUserId').val(0);
        }

        function inputClearOrder() {           
            $("#ddOrderType").prop("selectedIndex", 0).val(); 
            $("#ddDropRequest").prop("selectedIndex", 0).val(); 
            $('#txtCustomerMobile').val('');
            $("#txtCustomerName").val(''); 
            $("#txtDeliveryDate").val(''); 
            $("#txtpickUpSlip").val(''); 
            $("#ddDriver").prop("selectedIndex", 0).val(); 
        }

        //Cart Button
        function addTocart(id) {
            $('#btnCart_' + id).hide();
            var CUserid = $('#hd_CUserId').val();
            var SUserid = $('#hd_Userid').val();
            var proId = id;
            var orderQty = $('#txtQtys' + id).val();
            var totalQty = $('#txtCount' + id).val();
            var pricetype = $('#ddDropRequest').val();
            var url = "https://api.kwickwash.com/api/cart";
            var data = "{CUserid:'" + CUserid + "',SUserid:'" + SUserid + "',proId:'" + proId + "',orderQty:'" + orderQty
                + "',totalQty:'" + totalQty + "',pricetype:'" + pricetype + "'}";
            $.ajax({
                url: url,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                type: 'POST',
                data: data,
                success: function (data) {
                    $('#alertCart').fadeIn(2000);
                    $('#alertCart').fadeOut(2000);
                    $('#btnCart_' + id).show();
                    BindMyCart();
                    AddonCalc();
                },
                error: function (errorThrown) {
                    console.log(errorThrown);
                }
            });
        }

        //Bind Cart List
        function BindMyCart() {
            //alert(id);
            $('#listMyCart').html('<td colspan="6" style="text-align: center;"><span><i class="fa fa-spinner fa-spin" style="color:#9FCB39; font-size:40px; text-align:center;"></i></span></td>');
            var CUserid = $('#hd_CUserId').val();
            var SUserid = $('#hd_Userid').val();
            var totalAmt = 0;
            var url = "https://api.kwickwash.com/api/cart/GetCustomerCart?SUserid=" + SUserid + "&CUserid=" + CUserid;
            $.ajax({
                url: url,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                type: 'GET',
                success: function (data) {
                    _details = data;
                    var _htmlTable = "";
                    if (typeof (_details) !== 'undefined') {
                        $.each(_details, function (i, object) {
                            _htmlTable += '<tr>';
                            _htmlTable += '<td class="text-center">';
                            _htmlTable += '<a class="delete" title="Cart" onclick="deleteTocart(' + object.cartId + ');"><i class="fa fa-trash"></i></a>';
                            _htmlTable += '&nbsp; ' + object.serviceName + ' <br/> ' + object.productName + ' <span class="unitCss">' + object.unit + '</span> &nbsp; <span class="priceCss">' + Number(object.price).toFixed(2) + '</span></td>';


                            _htmlTable += '<td>';
                            _htmlTable += 'Quantity : <input style="width: 40px; margin: 3px;" onchange="addTocart(' + object.proId + ');" value="' + object.orderQty + '" type="text" id="txtQtys' + object.proId + '"/><br/>';
                            _htmlTable += 'Total Count : <input style="width: 40px; margin: 3px;" onchange="addTocart(' + object.proId + ');" value="' + object.totalQty + '" type="text" id="txtCount' + object.proId + '"/>';
                            _htmlTable += '</td>';

                            var totalPrice = (object.orderQty) * (object.price);
                            _htmlTable += ' <td>' + Number(totalPrice).toFixed(2) + '</td>';
                            _htmlTable += '</tr>';
                            totalAmt += totalPrice;
                        });
                    }
                    _htmlTable += '<tr>';
                    _htmlTable += '<td colspan="2" style="text-align:right;"><b>Total Amount</b></td>';
                    _htmlTable += '<td><span id="txtTotalAmt">' + Number(totalAmt).toFixed(2) + '</span></td>';
                    _htmlTable += '</tr>';
                    _htmlTable += '<tr>';

                    _htmlTable += '<tr>';
                    _htmlTable += '<td style="text-align:left;"><b>Coupon</b>';
                    _htmlTable += '<input type="text" id="txtCoupon" />';
                    _htmlTable += '<a class="applyDis" href="#" onclick="applyDiscount();"><i class="icon-arrow-right"></i></a>';
                    _htmlTable += '</td>';
                    _htmlTable += '<td style="text-align:right;"><b>Discount</b></td>';
                    _htmlTable += '<td><b><span id="txtDiscountAmt">0.0</span></td>';
                    _htmlTable += '</tr>';
                    _htmlTable += '<tr>';

                    _htmlTable += '<tr>';
                    _htmlTable += '<td colspan="2" style="text-align:right;"><b>Total Payable Amount</b></td>';
                    _htmlTable += '<td><span id="txtPayableAmt">' + Number(totalAmt).toFixed(2) + '</span></td>';
                    _htmlTable += '</tr>';
                    $('#listMyCart').html(_htmlTable);
                    $('#myTable2').DataTable();
                },
                error: function (errorThrown) {
                    console.log(errorThrown);
                }
            });
        }

        function applyDiscount() {
            var totalAmt = $('#txtTotalAmt').text();
            var counpanCode = $('#txtCoupon').val();
            var discountAmt = 0;
            var payableAmt = 0;
            var SUserid = $('#hd_Userid').val();
            var couponValue = 0;
            var url = "https://api.kwickwash.com/api/coupon/GetCoupon?couponcode=" + counpanCode + "&val=0";
            $.ajax({
                url: url,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                type: 'GET',
                success: function (data) {
                    _details = data;
                    if (typeof (_details) !== 'undefined') {
                        $.each(_details, function (i, object) {
                            couponValue = object.couponValue;
                            discountAmt = (totalAmt * couponValue) / 100;
                            payableAmt = totalAmt - discountAmt;
                            $('#txtDiscountAmt').html(Number(discountAmt).toFixed(2));
                            $('#txtPayableAmt').html(Number(payableAmt).toFixed(2));
                        });
                    }
                },
                error: function (errorThrown) {
                    console.log(errorThrown);
                }
            });
        }

        //Delete Cart
        function deleteTocart(id) {
            var url = "https://api.kwickwash.com/api/cart/DataDL?id=" + id + "&val=0";
            $.ajax({
                url: url,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                type: 'POST',
                success: function (data) {
                    alert('delete success!');
                    BindMyCart();
                },
                error: function (errorThrown) {
                    console.log(errorThrown);
                }
            });
        }

        function saveOrder() {
            //alert('w');
            var CUserid = $('#hd_CUserId').val();
            var SUserid = $('#hd_Userid').val();
            var deliveryDate = $('#txtDeliveryDate').val();
            var OrderType = $('#ddOrderType').val();
            var pickupRequest = $('#ddPickupRequest').val();
            var dropRequest = $('#ddDropRequest').val();
            var pickupSlip = $('#txtpickUpSlip').val();
            var useCoupon = $('#txtCoupon').val();

            var AddonProduct = $('#txtAddon').val();
            var AddonQty = $('#txtAddonQty').val();
            var AddonPrice = $('#txtAddonPrice').val();
            var AddonTotalPrice = $('#txtAddonTotalPrice').val();

            var mobile = $('#txtCustomerMobile').val();
            var driver = $('#ddDriver').val();

            if (OrderType == "0") {
                alert('Please select order type !');
            }
            else if (dropRequest == "0"){
                alert('Please select drop request !');
            }
            else if (mobile.length == 0){
                alert('Please enter mobile !');
            }
            else if (deliveryDate.length == 0) {
                alert('Please enter delivery date !');
            }
            else if (dropRequest == "Pick & Drop") {
                if (driver == "0") {
                    alert('Please select driver name !');
                }
                else {
                    //alert('222');
                    $('#btnPlaceOrder').hide();
                    var url = "https://api.kwickwash.com/api/placeorder";
                    var data = "{CUserid:'" + CUserid + "',SUserid:'" + SUserid + "',deliveryDate:'" + deliveryDate + "',OrderType:'" + OrderType
                        + "',pickupRequest:'" + pickupRequest + "',dropRequest:'" + dropRequest + "',pickupSlip:'" + pickupSlip + "',useCoupon:'" + useCoupon
                        + "',AddonProduct:'" + AddonProduct + "',AddonQty:'" + AddonQty + "',AddonPrice:'" + AddonPrice + "',AddonTotalPrice:'" + AddonTotalPrice + "'}";
                    $.ajax({
                        url: url,
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        type: 'POST',
                        data: data,
                        success: function (data) {
                            alert('order place success!');
                            inputClear();
                            BindMyCart();
                            BindOrder();
                            $('#txtAddon').val('')
                            $('#txtAddonQty').val('');
                            $('#txtAddonPrice').val('');
                            $('#txtAddonTotalPrice').val('');
                            $('#txtSubTotal').val('');
                            $('#orderBox').each(function () {
                                $(this).modal('hide');
                            });
                            $('#btnPlaceOrder').show();
                        },
                        error: function (errorThrown) {
                            console.log(errorThrown);
                        }
                    });
                }
            }
            else {
                ///alert('222');
                $('#btnPlaceOrder').hide();
                var url = "https://api.kwickwash.com/api/placeorder";
                var data = "{CUserid:'" + CUserid + "',SUserid:'" + SUserid + "',deliveryDate:'" + deliveryDate + "',OrderType:'" + OrderType
                    + "',pickupRequest:'" + pickupRequest + "',dropRequest:'" + dropRequest + "',pickupSlip:'" + pickupSlip + "',useCoupon:'" + useCoupon
                    + "',AddonProduct:'" + AddonProduct + "',AddonQty:'" + AddonQty + "',AddonPrice:'" + AddonPrice + "',AddonTotalPrice:'" + AddonTotalPrice + "'}";
                $.ajax({
                    url: url,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    type: 'POST',
                    data: data,
                    success: function (data) {
                        alert('order place success!');
                        inputClear();
                        BindMyCart();
                        BindOrder();
                        $('#txtAddon').val('')
                        $('#txtAddonQty').val('');
                        $('#txtAddonPrice').val('');
                        $('#txtAddonTotalPrice').val('');
                        $('#txtSubTotal').val('');
                        $('#orderBox').each(function () {
                            $(this).modal('hide');
                        });
                        $('#btnPlaceOrder').show();
                    },
                    error: function (errorThrown) {
                        console.log(errorThrown);
                    }
                });
            }
        }

        function getDriver() {
            var id = $('#hd_Userid').val();
            $('#ddDriver').html('<h3><i class="fa fa-spiner fa-spin"></i></h3>');
            var option = "<option value='0'>---Select Driver---</option>";
            var url = "https://api.kwickwash.com/api/driver/" + id;
            $.ajax({
                url: url,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                type: 'GET',
                success: function (data) {
                    _details = data;
                    if (typeof (_details) !== 'undefined') {
                        $.each(_details, function (i, object) {
                            option += "<option value='" + object.profileId + "'>" + object.name + "</option>";
                        });
                    }
                    $('#ddDriver').html(option);
                },
                error: function (errorThrown) {
                    console.log(errorThrown);
                }
            });
        }

        function inputClear() {
            $('#hd_Customer_id').val('0')
            $('#txtname').val('');
            $('#txtemailId').val('');
            $('#txtmobile').val();
            $('#hd_Image').val('');
            $("#imgPath").attr('src', '');
            $('#ddLocation')
                .find('option')
                .remove()
                .end()
                .append('<option value="whatever">Select Location</option>')
                .val('whatever')
                ;
        }
        //Add News Service
        function AddCustomer() {
            var profileId = $('#hd_Customer_id').val();
            var name = $('#txtname').val();
            var emailId = $('#txtemailId').val();
            var mobile = $('#txtmobile').val();
            var address = $('#txtaddress').val();
            var state = $('#txtstate').val();
            var city = $('#txtcity').val();
            var pincode = $('#txtpincode').val();
            var companyLogo = $('#hd_Image').val();
            var shopUserId = $('#hd_Userid').val();
            var Location = $("#ddLocation").val();
            $(".error").remove();
            if (name.length == "") {
                $('#txtname').after('<span class="error">This field is required</span>');
                $('#txtname').addClass('txterror');
            }
            else {
                $('.loader').show();
                var data = "{profileId:'" + profileId + "',name:'" + name + "',emailId:'" + emailId + "',mobile:'" + mobile + "',address:'" + address
                    + "',state:'" + state + "',city:'" + city + "',pincode:'" + pincode + "',companyLogo:'" + companyLogo + "',shopUserId:'" + shopUserId
                    + "',Location:'" + Location + "'}";

                var url = "https://api.kwickwash.com/api/profile";

                $.ajax({
                    url: url,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    type: 'POST',
                    data: data,
                    success: function (data) {
                        if (data == "1") {
                            //BindCustomer();
                           
                            document.getElementById("FrCustomer").reset();
                            $('#alertt').fadeIn(2000);
                            $('#alertt').fadeOut(3000);
                            $('.loader').hide();

                            $('#customerBox').each(function () {
                                $(this).modal('hide');
                            });

                            $('#orderBox').each(function () {
                                $(this).modal('show');
                            });
                            $('#txtCustomerMobile').val(mobile);
                            getCustomer();
                        }
                    },
                    error: function (errorThrown) {
                        console.log(errorThrown);
                    }
                });
            }
        }

        function ReadData(id) {
            $('.loader').show();
            $('#customerBox').each(function () {
                $(this).modal('show');
            });
            var url = "https://api.kwickwash.com/api/profile/" + id;
            $.ajax({
                url: url,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                type: 'GET',
                success: function (data) {
                    _details = data;
                    if (typeof (_details) !== 'undefined') {
                        $.each(_details, function (i, object) {
                            $('#hd_Customer_id').val(object.profileId);
                            $('#txtname').val(object.name);
                            $('#txtemailId').val(object.emailId);
                            $('#txtmobile').val(object.mobile);
                            $('#txtaddress').val(object.address);
                            $('#txtstate').val(object.state);
                            $('#txtcity').val(object.city);
                            $('#txtpincode').val(object.pincode);
                            $('#hd_Image').val(object.companyLogo);
                            $("#imgPath").attr('src', object.companyLogo);
                            $('.loader').hide();
                        });
                    }
                },
                error: function (errorThrown) {
                    console.log(errorThrown);
                }
            });
        }

        function callArea() {
            var pincode = $('#txtpincode').val();
            var url = "https://cors-anywhere.herokuapp.com/https://api.postalpincode.in/pincode/" + pincode;
            var option = '<option value="0">Select Location</option>';
            $.ajax({
                url: url,
                contentType: "application/json; charset=utf-8",
                cache: false,
                dataType: "json",
                type: "GET",
                success: function (data) {
                    _details = data;
                    if (typeof (_details) !== 'undefined') {
                        $.each(_details, function (i, object) {
                            var area = object.PostOffice;
                            for (i = 0; i < area.length; i++) {
                                if (i == 1) {
                                    $('#txtcity').val(area[i].District);
                                    $('#txtstate').val(area[i].State);
                                }
                                option += '<option value="' + area[i].Name + '">' + area[i].Name + '</option>';
                            }
                            $('#ddLocation').html(option);
                        });
                    }
                }
            });
        }

        function AddonCalc() {
            var totalPrice = Number($('#txtAddonQty').val()) * Number($('#txtAddonPrice').val());
            $('#txtAddonTotalPrice').val(Number(totalPrice).toFixed(2));
            var subTotal = Number($('#txtAddonTotalPrice').val()) + Number($('#txtPayableAmt').html());
            $('#txtSubTotal').val(Number(subTotal).toFixed(2));
        }

        
        
        

    </script>
    <!-- Custom tab JavaScript -->
    <script src="assets/js/cbpFWTabs.js"></script>


    <script src="assets/plugins/bower_components/toast-master/js/jquery.toast.js"></script>
    <script src="assets/plugins/bower_components/datatables/datatables.min.js"></script>
    <!-- start - This is for export functionality only -->
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
    <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
    <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
    <!-- end - This is for export functionality only -->
    <script type="text/javascript" src="assets/js/ajaxupload.js"></script>

    <style type="text/css">
        .btnCart {
            background: lightslategrey;
            padding: 5px;
            color: white;
            float: right;
            margin: 6px;
            border-radius: 3px;
            cursor: pointer;
        }
    </style>

    <div id="orderBox" class="modal fade" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header w3-theme">
                    <h3 class="w3-text-white" style="color:white;" id="reqdt"><i class="fa fa-first-order" style="color:white;"></i>New Order</h3>

                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="loader"></div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="col-lg-12 float-lg-right">
                                <div class="card shadow mb-4">
                                    <div class="card-body">
                                        <div class="col-sm-12">
                                            <div class="white-box">
                                                <div id="loader">

                                                </div>
                                                <form data-toggle="validator" enctype="multipart/form-data" id="FrCustomer">

                                                    <div class="row" style="margin-top: 16px;">
                                                        <div class="col-sm-4">
                                                            <div class="form-group">
                                                                <label class="control-label">Order Type</label>
                                                                <select id="ddOrderType" class="form-control">
                                                                    <option value="0">---Select Order Type---</option>
                                                                    <option value="Walk-In">Walk-In</option>
                                                                    <option value="Call">Call</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4" style="display:none;">
                                                            <div class="form-group">
                                                                <label class="control-label">Pickup Request</label>
                                                                <select id="ddPickupRequest" class="form-control">
                                                                    <option value="0">---Select Pick Request ---</option>
                                                                    <option value="Self">Self</option>
                                                                    <option value="Delivery">Delivery</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="form-group">
                                                                <label class="control-label">Drop Request</label>
                                                                <select id="ddDropRequest" class="form-control" onchange="myProduct();">
                                                                    <option value="0">---Select Pick & Drop Request ---</option>
                                                                    <option value="Pick & Drop">Pick & Drop</option>
                                                                    <option value="Drop Off">Drop Off</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <input type="hidden" id="hd_CUserId" value="0" />
                                                                <label class="control-label" id="contactName">Customer Mobile</label>
                                                                <input type="text" class="form-control" name="txtCustomerMobile" id="txtCustomerMobile" placeholder="Enter Customer Mobile" onchange="getCustomer();" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label class="control-label">Customer Name</label>
                                                                <input type="email" class="form-control" name="txtCustomerName" id="txtCustomerName" readonly>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label class="control-label">Delivery Date</label>
                                                                <input type="date" class="form-control" name="txtDeliveryDate" id="txtDeliveryDate" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label class="control-label">Pickup Slip No.</label>
                                                                <input type="text" class="form-control" name="txtpickUpSlip" id="txtpickUpSlip" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3" style="display:none;" id="divDriver">
                                                            <div class="form-group">
                                                                <label class="control-label">Driver</label>
                                                                <select id="ddDriver" class="form-control">
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <hr />

                                                    <div class="row">
                                                        <div id="alertCart" class="alert alert-success" style="display:none;">
                                                            <strong>Success!</strong> Add Successfully On Cart.
                                                        </div>

                                                        <div class="col-lg-6">
                                                            <h2>Product List</h2>
                                                            <div class="table-responsive" style="overflow: auto;">
                                                                <table id="myProductList" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                                                    <thead>
                                                                        <tr>

                                                                            <th>Service & Product List</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody id="listMyProdcut">
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div class="col-lg-6">
                                                            <h2>My Cart List</h2>
                                                            <div class="table-responsive" style="overflow: auto;">
                                                                <table id="myCartList" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>Product</th>
                                                                            <th>Quantity</th>
                                                                            <th>Total-Price</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody id="listMyCart">
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                      
                                                        <div class="col-lg-12">
                                                            <hr />
                                                            <h2>Addon </h2>
                                                            <table class="display nowrap table table-hover table-striped table-bordered">
                                                                <tr>
                                                                    <th>
                                                                        Addon Product
                                                                    </th>
                                                                    <th>
                                                                        Quantity
                                                                    </th>
                                                                    <th>
                                                                        Price
                                                                    </th>
                                                                    <th>
                                                                        Total Price
                                                                    </th>
                                                                    <th>
                                                                        Sub Total
                                                                    </th>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <input type="text" id="txtAddon" class="form-control" />
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" id="txtAddonQty" onchange="AddonCalc();" class="form-control" />
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" id="txtAddonPrice" onchange="AddonCalc();" class="form-control" />
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" readonly id="txtAddonTotalPrice" class="form-control" />
                                                                    </td>
                                                                    <td>
                                                                        <input type="text" readonly id="txtSubTotal" class="form-control" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>

                                                        <div class="form-group">
                                                            <div id="alertt" class="alert alert-success" style="display:none;">
                                                                <strong>Success!</strong> save record.
                                                            </div>
                                                            <a href="#" id="btnPlaceOrder" style="float: right;" class="btn btn-primary" onclick="saveOrder();">Place Order</a>
                                                        </div>
                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="customerBox" class="modal fade" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header w3-theme">
                    <h3 class="w3-text-white" style="color:white;" id="reqdt"><i class="fa fa-user" style="color:white;"></i> Customer </h3>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="col-lg-12 float-lg-right">
                                <div class="card shadow mb-4">
                                    <div class="card-body">
                                        <div class="col-sm-12">
                                            <div class="white-box">
                                                <div id="loader">

                                                </div>
                                                <form data-toggle="validator" enctype="multipart/form-data" id="FrCustomer">

                                                    <div class="row" style="margin-top: 16px;">
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label class="control-label" id="contactName">Customer Name</label>
                                                                <input type="hidden" name="hd_Customer_id" id="hd_Customer_id" value="0">
                                                                <input type="hidden" name="hd_Customer_id" id="hd_UserId" value="0">
                                                                <input type="text" class="form-control" name="name" id="txtname" placeholder="Enter Customer Name" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label class="control-label">Email</label>
                                                                <input type="email" class="form-control" name="email" id="txtemailId" placeholder="Enter Email" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label class="control-label">Mobile</label>
                                                                <input type="text" class="form-control groupOfTexbox" name="mobile" value="" id="txtmobile" placeholder="Enter mobile" required maxlength="10">
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label class="control-label">Gender</label>
                                                                <select id="ddGender" class="form-control">
                                                                    <option value="0">---Select---</option>
                                                                    <option value="Male">Male</option>
                                                                    <option value="Female">Female</option>
                                                                    <option value="Other">Other</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row" style="margin-top: 16px;">
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label class="control-label" id="contactName">Date of Birth</label>
                                                                <input type="date" class="form-control" name="name" id="txtDob" placeholder="Enter Date of Birth" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label class="control-label" id="contactName">Date of Anniversary</label>
                                                                <input type="date" class="form-control" name="name" id="txtDoa" placeholder="Enter Date of Anniversary" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label class="control-label">Occupation</label>
                                                                <select id="ddoccupation" class="form-control">
                                                                    <option value="0">---Select---</option>
                                                                    <option value="Business">Business</option>
                                                                    <option value="Doctor">Doctor</option>
                                                                    <option value="Homemaker">Homemaker</option>
                                                                    <option value="Service">Service</option>
                                                                    <option value="Student">Student</option>
                                                                    <option value="Teacher">Teacher</option>
                                                                    <option value="Other">Other</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label class="control-label">Marital Status</label>
                                                                <select id="ddmaritalstatus" class="form-control">
                                                                    <option value="0">---Select---</option>
                                                                    <option value="Married">Married</option>
                                                                    <option value="Single">Single</option>
                                                                    <option value="Divorced">Divorced</option>
                                                                    <option value="Widowed ">Widowed</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>



                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <div class="form-group">
                                                                <label class="control-label">Address</label>
                                                                <textarea id="txtaddress" class="form-control" placeholder="Enter address"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label class="control-label">Pincode</label>
                                                                <input type="text" class="form-control" name="txtpincode" id="txtpincode" onchange="callArea();" placeholder="Enter pincode" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label class="control-label">Area (Location)</label>
                                                                <select id="ddLocation" class="form-control">
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label class="control-label">City</label>
                                                                <input type="text" class="form-control" readonly name="txtcity" id="txtcity" placeholder="Enter city" required>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label class="control-label">State</label>
                                                                <input type="text" class="form-control" readonly name="txtstate" id="txtstate" placeholder="Enter state" required>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-3">
                                                            <div class="form-group">
                                                                <label class="control-label" id="photoLogo">Photo</label>

                                                                <input type="hidden" id="hd_Image" />

                                                                <div class="help-block with-errors"></div>
                                                                <input type="button" name="myImage" class="button button-green upload"
                                                                       id="btn_Image" value="Upload Image" />
                                                                <a class="btn btn-success btn-icon-split" id="img_Image" style="display: none; color: white; padding: 1px !important;">
                                                                    <span class="icon text-white-50">
                                                                        <i class="fas fa-check"></i>
                                                                    </span>
                                                                    <span class="text">Successfully News Image uploaded..</span>
                                                                </a>
                                                                <img id="imgPath" class="imgPath" accept="image/*" style=" width: 100px; height: 100px; border-radius: 50%;" required />
                                                            </div>
                                                        </div>

                                                        <div class="col-sm-4">
                                                            <div class="form-group">

                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div id="alertt" class="alert alert-success" style="display:none;">
                                                            <strong>Success!</strong> save record.
                                                        </div>
                                                        <a href="#" class="btn btn-primary" onclick="AddCustomer();">Submit</a>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>