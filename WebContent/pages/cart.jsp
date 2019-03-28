<%@page import="model.bean.Cart"%>
<%@page import="model.bean.Item"%>
<%@page import="java.util.Map"%>
<%@ page pageEncoding="utf-8"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Danh sách đặt hàng</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- icon hiển thị -->
<link rel="shortcut icon" type="image/x-icon"
	href="../assets/img/favicon.ico">

<!-- Toàn bộ css -->
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/magnific-popup.css">
<link rel="stylesheet" href="../assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="../assets/css/font-awesome.min.css">
<link rel="stylesheet" href="../assets/css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="../lib/css/nivo-slider.css" type="text/css" />
<link rel="stylesheet" href="../lib/css/preview.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="../assets/css/animate.css">
<link rel="stylesheet" href="../assets/css/jquery-ui.css">
<link rel="stylesheet" href="../assets/css/meanmenu.min.css">
<link rel="stylesheet" href="../assets/css/bundle.css">
<link rel="stylesheet" href="../assets/css/style.css">
<link rel="stylesheet" href="../assets/css/responsive.css">
<script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
<%
Cart cart = (Cart) session.getAttribute("cart");
if (cart == null) {
    cart = new Cart();
    session.setAttribute("cart", cart);
}
%>
	<!-- Thêm phần tiêu đề trang -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- Xong phần tiêu đề trang -->

	<!-- Bắt đầu tiêu đề trang con -->
	<div class="breadcrumbs-area breadcrumb-bg ptb-100">
		<div class="container">
			<div class="breadcrumbs text-center">
				<h2 class="breadcrumb-title">DANH sách đặt hàng</h2>
				<ul>
					<li><a class="active" href="../index.jsp">Trang chủ</a></li>
					<li>Đặt hàng</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Xong tiêu đề trang con -->

	<!-- shopping-cart-area start -->
	<div class="cart-area ptb-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<form action="#">
						<div class="table-content table-responsive">
							<table>
								<thead>
									<tr>
										<th class="product-price">Hình ảnh</th>
										<th class="product-name">Tên sản phẩm</th>
										<th class="product-price">Giá</th>
										<th class="product-quantity">Số lượng</th>
										
										<th class="product-name">Xóa bỏ</th>
									</tr>
								</thead>
								<%for (Map.Entry<String, Item> list : cart.getCartItems().entrySet()) {%>
								<tbody>								
									<tr>
										<td class="product-thumbnail"><a href="#"><img
												src="../images/giaydep/<%=list.getValue().getProduct().getImage() %>"
												alt=""></a></td>
										<td class="product-name"><a href="#"><%=list.getValue().getProduct().getNameProduct()%></a></td>
										
										<td class="product-price"><span class="amount"><%=list.getValue().getProduct().getUnitPrice()%>
												đ</span></td>
										<td class="product-quantity"><%=list.getValue().getQuantity()%> <!-- <input
											value="" type="number"
											min="1" maxlength="4" id="quantity" onkeypress="return keyPhone(event);"> --></td>

										
										<td class="product-remove"><a onclick="calleditcart();"
											title="Sửa đổi chọn hàng"><i class="fa fa-pencil"></i></a><a
											href="../cart?status=remove&id_product=" title="xóa bỏ chọn hàng"><i class="fa fa-times"></i></a>
										</td>
									</tr>
									
									<!-- <tr>
										<div class="alert alert-info">
											<center>
												<strong>Giỏ hàng trống!</strong>
											</center>
										</div>
									</tr> -->
									
								</tbody>
									<%} %>
							</table>
						</div>
					</form>
				</div>
			</div>
			<div class="row mt-50">
				<div class="col-md-7 col-sm-12 col-xs-12"></div>
				<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="cart-total">
						<ul>
							
							<li class="cart-black">Tổng tiền<span>
									<%=cart.totalCart()%>đ</span></li>
						</ul>
						<div class="cart-total-btn">
							
							<div class="cart-total-btn2 f-right">
								<a href="checkout.jsp">Tiến hàng thanh toán</a>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- shopping-cart-area end -->

	<!-- Thêm chân trang -->
	<jsp:include page="../layout/footerpage.jsp"></jsp:include>
	<!-- Xong thêm chân trang -->

	<!-- Toàn bộ js -->
	<script>
		function calleditcart(id) {
			var quantity = document.getElementById("quantity"+id).value;
			window.location.href = "../cart?status=edit&id_product="+id+"&quantity="+quantity+" ";
		}
		
		function keyPhone(e) {
			var keyword = null;
			if (window.event) {
				keyword = window.event.keyCode;
			} else {
				keyword = e.which;  
			}

			if (keyword<48 || keyword>57) {
				if (keyword == 8 || keyword == 48 || keyword == 127) { 
					return true;
				}
				return false;
			}
		}
	</script>

	<script src="../assets/js/vendor/jquery-1.12.0.min.js"></script>
	<script src="../assets/js/bootstrap.min.js"></script>
	<script src="../assets/js/jquery.meanmenu.js"></script>
	<script src="../assets/js/jquery.magnific-popup.min.js"></script>
	<script src="../assets/js/isotope.pkgd.min.js"></script>
	<script src="../assets/js/imagesloaded.pkgd.min.js"></script>
	<script src="../assets/js/jquery.validate.min.js"></script>
	<script src="../assets/js/owl.carousel.min.js"></script>
	<script src="../lib/js/jquery.nivo.slider.js"></script>
	<script src="../lib/home.js"></script>
	<script src="../assets/js/plugins.js"></script>
	<script src="../assets/js/main.js"></script>
</body>

</html>
