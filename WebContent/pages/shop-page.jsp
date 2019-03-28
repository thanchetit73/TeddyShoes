<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Cart"%>
<%@page import="model.bean.Products"%>
<%@page import="model.bean.Category"%>
<%@page import="model.dao.ProductsDAO"%>
<%@page import="model.bo.CategoryBO"%>
<%@ page pageEncoding="utf-8"%>
<%@ page import="java.text.DecimalFormat"%>

<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Sản phẩm</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- icon hiển thị -->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">

<!-- Toàn bộ css -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="lib/css/nivo-slider.css" type="text/css" />
<link rel="stylesheet" href="lib/css/preview.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet" href="assets/css/jquery-ui.css">
<link rel="stylesheet" href="assets/css/meanmenu.min.css">
<link rel="stylesheet" href="assets/css/bundle.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
	<%
	DecimalFormat format = new DecimalFormat("###,###");
		ProductsDAO productDAO = new ProductsDAO();
		String category_id = "";
		if (request.getParameter("category") != null) {
			category_id = request.getParameter("category");
		}
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
				<h2 class="breadcrumb-title">DANH MỤC SẢN PHẨM</h2>
				<ul>
					<li><a class="active" href="Index">Trang chủ</a></li>
					<li>Sản phẩm</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Xong tiêu đề trang con -->
	<!-- Bắt đầu nội dung trang danh sách sản phẩm -->
	<div class="shop-page-area ptb-100">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="blog-sidebar">
						<div class="single-sidebar">
							<h3 class="sidebar-title">Các sản phẩm chỉ với giá</h3>
							<div class="price-filter">
								<div id="slider-range"></div>
								<div class="price-slider-amount">
									<input type="text" id="amount" name="price" />
								</div>
							</div>
						</div>
						<div class="single-sidebar">
							<h3 class="sidebar-title">Loại sản phẩm</h3>
							<div class="sidebar-list">
								<ul>
									<%
										ArrayList<Category> lstC = (ArrayList<Category>)request.getAttribute("lstCategory");
										for (Category ca : lstC) {
									%>
									<li><a href="ProductSearchServlet?id_type=<%=ca.getType_ID()%>"><%=ca.getType_Name()%></a></li>
									<%
										}
									%>

									<li><a href="./pages/shop-page.jsp?id_product="> </a></li>
								</ul>
							</div>
						</div>
						<%ArrayList<Products> lstP =(ArrayList<Products>)request.getAttribute("lstProducts"); %>
						<div class="single-sidebar">
							<h3 class="sidebar-title">Các hãng sản xuất</h3>
							<div class="sidebar-list">
								<ul>
									<li><input type="checkbox"> <a href="#">Nike
											(8)</a></li>
									<li><input type="checkbox"> <a href="#">Converse
											(2)</a></li>
									<li><input type="checkbox"> <a href="#">Vans
											(5)</a></li>
									<li><input type="checkbox"> <a href="#">Adidas
											(8)</a></li>
									<li><input type="checkbox"> <a href="#">Sneaker
											(7)</a></li>
									<li><input type="checkbox"> <a href="#">Bitis Hunter
											(8)</a></li>
									<li><input type="checkbox"> <a href="#">Guci
											muội (7)</a></li>
								</ul>
							</div>
						</div>
						<!-- <div class="single-sidebar">
							<h3 class="sidebar-title">Hàng bán chạy</h3>
							<div class="tag">
								<ul>
									<li><a href="#">Tông lào</a></li>
									<li><a href="#">Tông lào</a></li>
									<li><a href="#">Tông lào</a></li>
									<li><a href="#">Tông lào</a></li>
									<li><a href="#">Tông lào</a></li>
									<li><a href="#">Tông lào</a></li>
									<li><a href="#">Tông lào</a></li>
									<li><a href="#">Tông lào</a></li>
								</ul>
							</div>
						</div> -->
					</div>
				</div>
				<div class="col-md-9">
					<div class="blog-wrapper shop-page-mrg">
						<div class="tab-menu-product">
							<div class="tab-menu-sort">
								<div class="tab-menu">
									<ul role="tablist">
										<li class="active"><a href="#grid" data-toggle="tab">
												<i class="fa fa-th-large"></i> Danh mục
										</a></li>
									</ul>
								</div>
								<div class="tab-sort">
									<label>Sắp xếp : </label> <select>
										<option value="">Mới nhất</option>
										<option value="">Củ hơn</option>
										<option value="">Giá rẻ</option>
										<option value="">Chất lượng</option>
									</select>
								</div>
							</div>						
							<div class="tab-product">
								<div class="tab-content">
									<div class="tab-pane active" id="grid">
										<div class="row">
											  <%     
							  
                            for (Products p : lstP) {
                        %>
											<div
						class="col-md-3 col-sm-6 col-xs-12 grid-item mix mb-50">
						<div class="single-shop">
							<div class="shop-img">
								<a href="javascript:void(0)"><img
									src="images/giaydep/<%=p.getImage() %> "height="280"  width="220"
									alt="" /></a>															
								<div class="price-up-down">
									<span class="sale-new">Giảm<%=p.getPromotionPrice() %> %
									</span>
								</div>							
								<div class="button-group">
									<a
										href="CartServlet?command=plus&productID=<%=p.getProductId() %>"
										title="Add to Cart"> <i class="pe-7s-cart"></i>
									</a> <a class="wishlist" href="#" title="Wishlist"> <i
										class="pe-7s-like"></i>
									</a> <a href="#" data-toggle="modal" data-target="#quick-view<%=p.getProductId() %>"
										title="Quick View"> <i class="pe-7s-look"></i>
									</a>
								</div>
							</div>
							<div class="shop-text-all">
								<div class="title-color fix">
									<div class="shop-title f-left">
										<h3>
											<a href="#" data-toggle="modal"
												data-target="#quick-view">
												<%=p.getNameProduct() %></a>
										</h3>
									</div>
									<div class="price f-right">
									<span class="new"><%=format.format(p.getUnitPrice()) %> đ
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
											  <%
                            }
							 
                             %>
										</div>
									</div>
									<div class="page-pagination text-center">
										<ul>
											<li><a class="active" href="#">1</a></li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#"><i class="fa fa-angle-double-right"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Xong nội dung trang danh sách sản phẩm -->

	<!-- Thêm chân trang -->
	<jsp:include page="../layout/footerpage.jsp"></jsp:include>
	<!-- Xong thêm chân trang -->

	 <%
	 	for(Products ls : lstP){
	 		
	 %>
	<!-- Bắt đầu xem nhanh chi tiết -->

	<div class="quick-view modal fade in" id="quick-view<%=ls.getProductId()%>">
		<div class="container">
			<div class="row">
				<div id="view-gallery">
					<div class="col-xs-12">
						<div class="d-table">
							<div class="d-tablecell">
								<div class="modal-dialog">
									<div class="main-view modal-content">
										<div class="modal-footer" data-dismiss="modal">
											<span>x</span>
										</div>
										<div class="row">
											<div class="col-xs-12 col-sm-5">
												<div class="quick-image">
													<div class="single-quick-image tab-content text-center">
														<div class="tab-pane  fade in active" id="sin-pro-">
															<img src="images/giaydep/<%=ls.getImage()%>" alt="" />
														</div>

														<div class="tab-pane fade in" id="sin-pro-">
															<img src="images/giaydep/<%=ls.getImage()%>" alt="" />
														</div>


													</div>
													<div class="quick-thumb">
														<div class="nav nav-tabs">
															<ul>

																<li><a data-toggle="tab" href="#sin-pro-"> <img
																		src="assets/img/shop/DetailProduct/"
																		alt="quick view" />
																</a></li>

															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xs-12 col-sm-7">
												<div class="quick-right">
													<div class="quick-right-text">
														<h3>
															<strong></strong>
														</h3>
														<div class="rating">
															<i class="fa fa-thumbs-o-up"> <b></b> lượt thích
															</i>
														</div>
														<div class="amount">

															<h4>Giá bán </h4>
														</div>
														<h2><%=ls.getUnitPrice() %></h2>
														<p></p>
														<div class="dse-btn">
															<div class="row">
																<div class="col-sm-12 col-md-6">
																	<div class="por-dse clearfix">
																		<ul>
																			<li class="share-btn clearfix"><span>Yêu
																					thích</span> <a href="#"><i class="fa fa-thumbs-up"></i></a>
																			</li>

																		</ul>
																	</div>
																</div>
																<div class="col-sm-12 col-md-6">
																	<div class="por-dse add-to">
																		<a href="CartServlet?command=plus&productID=<%=ls.getProductId()%>">Mua ngay
																			<i class="fa fa-cart-plus"></i>
																		</a>
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	 <%
	 	}
	 %>
	<!-- Xong xem nhanh chi tiết -->


	<!-- Toàn bộ js -->
	<script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.meanmenu.js"></script>
	<script src="assets/js/jquery.magnific-popup.min.js"></script>
	<script src="assets/js/isotope.pkgd.min.js"></script>
	<script src="assets/js/imagesloaded.pkgd.min.js"></script>
	<script src="assets/js/jquery.validate.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	<script src="lib/js/jquery.nivo.slider.js"></script>
	<script src="lib/home.js"></script>
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
</body>


</html>