<%@page import="java.util.Formatter"%>
<%@page import="model.bean.Blogs"%>
<%@page import="model.dao.ProductsDAO"%>
<%@page import="model.bean.Cart"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.bo.CategoryBO"%>
<%@page import="model.bean.Category"%>
<%@page import="model.bo.ProductsBO"%>
<%@page import="model.bean.Products"%>
<%@page import="java.util.ArrayList"%>
<%@ page pageEncoding="utf-8"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Trang chủ</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- icon cho trang -->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/icon1.png">
<!-- Toàn bộ link css -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="lib/css/nivo-slider.css" type="text/css" />
<link rel="stylesheet" href="lib/css/preview.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet" href="assets/css/meanmenu.min.css">
<link rel="stylesheet" href="assets/css/bundle.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
	<!-- Thêm phần tiêu đề trang -->
	<jsp:include page="layout/header.jsp"></jsp:include>
	<!-- Xong phần tiêu đề trang -->
	<%
	DecimalFormat format = new DecimalFormat("###,###");
		ArrayList<Products> lstPro = (ArrayList<Products>) request.getAttribute("lstProducts");
		//ArrayList<Category> lstCat =(ArrayList<Category>)request.getAttribute("lstCategory");
		ProductsBO p = new ProductsBO();
		CategoryBO c = new CategoryBO();
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
	%>
	<!-- Bắt đầu slide -->
	<div class="slider-area">
		<div class="bend niceties preview-2">

			<div id="ensign-nivoslider" class="slides">
				<img src="assets/img/slider/slide2.jpg" alt=""
					title="#slider-direction-1" /> <img src="assets/img/slider/
					slide1.jpg"
					alt="" title="#slider-direction-2" />
			</div>
			<!-- Hình ảnh 1 -->
			<div id="slider-direction-1" class="t-cn slider-direction">
				<div class="container">
					<div class="slider-content t-lfl s-tb slider-1">
						<div class="title-container s-tb-c title-compress">
							<h1 class="title1">THẾ GIỚI GIÀY DÉP</h1>
							<h2 class="title2">Thiên Đường Mua Sắm !</h2>
							<h3 class="title3">
								Đến với chúng tôi, thỏa sức chọn lựa những mẫu giày dép <br>hot
								nhất với giá rẻ hơn và khuyến mãi cực tốt
							</h3>
							<a class="btn-hover" href="pages/shop-page.jsp?id_product=0">Mua
								ngay <i class="fa fa-angle-double-right"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- Hình ảnh 2 -->
			<div id="slider-direction-2" class="slider-direction">
				<div class="container">
					<div class="slider-content t-lfl s-tb slider-1">
						<div class="title-container s-tb-c title-compress">
							<h1 class="title1">ĐẸP VÔ ĐỐI</h1>
							<h2 class="title2">Gía Siêu Rẻ!</h2>
							<h3 class="title3">
								Độ đẹp vô đối, phù hợp cho mọi lứa tuổi <br> thỏa sức lực
								chọn.
							</h3>
							<a class="btn-hover" href="shop-page.html">Mua ngay <i
								class="fa fa-angle-double-right"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Xong slider -->
	<!-- Bắt đầu dịch vụ - giao hàng  -->
	<!-- <div class="service-area pt-100"> -->
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-sm-3">
				<div class="single-service addm">
					<div class="service-icon">
						<i class="fa fa-bus"></i>
					</div>
					<div class="service-text">
						<h3>Miển phí vận chuyển</h3>
						<p>Giao hàng đảm bảo</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-3">
				<div class="single-service addm">
					<div class="service-icon">
						<i class="fa fa-credit-card"></i>
					</div>
					<div class="service-text">
						<h3>Hoàn trả tiền</h3>
						<p>Hoàn tiền nếu quá 30 ngày</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-3">
				<div class="single-service addm">
					<div class="service-icon">
						<i class="pe-7s-headphones"></i>
					</div>
					<div class="service-text">
						<h3>Hổ trợ trượt tuyến</h3>
						<p>Liên hệ (+84) 900 000 0có</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-sm-3">
				<div class="single-service">
					<div class="service-icon">
						<i class="fa fa-briefcase"></i>
					</div>
					<div class="service-text">
						<h3>khuyến mãi</h3>
						<p>Tạo niềm vui mua sắm</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- Xong dịch vụ - giao hàng -->
	<!-- Bắt đầu sản phẩm nỗi bật -->
	<%--  <div class="portfolio-area ptb-100">
		<div class="container">
			<div class="section-title text-center mb-50">
				<h2>
					Sản phẩm mới<i class="fa fa-shopping-cart"></i>
				</h2>
			</div>
			<div class="shop-menu portfolio-left-menu text-center mb-50">
				<button class="active" data-filter="*">Mọi thứ</button>
				<%
					for (Category ca : c.getListM() ) {
				%>
				<button data-filter=".mix<%=ca.getType_ID()%>"><a href ="Index?typeId=<%=ca.getType_ID()%>">
					<p><%=ca.getType_Name()%></p></a></button>
				<%
					}
				%>
			</div>
			<div class="row portfolio-style-2">
				<!-- Hiển thị sản phẩm -->
				<div class="grid">
					<!--(Shoes )1  -->
							<%
					int index1 = -1;
					for (Products ls : p.getAllProDucts()) {
						index1++;
						if (index1 == 0) {
				%>
					<div class="special-slider-active owl-carousel">
					<div class="single-special-slider">
					<div
						class="col-md-3 col-sm-6 col-xs-12 grid-item mix<%=ls.getProductId()%> mb-50">
						<div class="single-shop">
							<div class="shop-img">
								<a href="javascript:void(0)"><img
									src="<%=ls.getImage() %>" alt="" /></a>																			
								<div class="price-up-down">
									<span class="sale-new">Mới
									</span>
								</div>								
=								<div class="button-group">
									<a href="CartServlet?command=plus&productID=<%=ls.getProductId()%>"
										title="Add to Cart"> <i class="pe-7s-cart"></i>
									</a> <a class="wishlist" href="#" title="Wishlist"> <i
										class="pe-7s-like"></i>
									</a> <a href="#" data-toggle="modal"
										data-target="#quick-view<%=ls.getProductId()%>" title="Quick View">
										<i class="pe-7s-look"></i>
									</a>
								</div>
							</div>
							<div class="shop-text-all">
								<div class="title-color fix">
									<div class="shop-title f-left">
										<h3>
											<a href="#" data-toggle="modal"
												data-target="#quick-view<%=ls.getProductId() %>"> <%=ls.getNameProduct() %></a>
										</h3>
									</div>
									<div class="price f-right">								
										<span class="new"> <%=ls.getUnitPrice()%>đ
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					</div>		
						<%
						} else {
					%>
				<div class="single-special-slider">
					<div class="col-md-3 col-sm-6 col-xs-12 grid-item mix<%=ls.getProductId() %> mb-50">
						<div class="single-shop">
							<div class="shop-img">
								<a href="javascript:void(0)"><img
									src="images/giaydep/<%=ls.getImage() %>"
									alt="" /></a>															
								<div class="price-up-down">
									<span class="sale-new">Giảm<%=ls.getPromotionPrice() %> %
									</span>
								</div>							
								<div class="button-group">
									<a
										href="CartServlet?command=plus&productID=<%=ls.getProductId() %>"
										title="Add to Cart"> <i class="pe-7s-cart"></i>
									</a> <a class="wishlist" href="#" title="Wishlist"> <i
										class="pe-7s-like"></i>
									</a> <a href="#" data-toggle="modal" data-target="#quick-view"
										title="Quick View"> <i class="pe-7s-look"></i>
									</a>
								</div>
							</div>
							<div class="shop-text-all">
								<div class="title-color fix">
									<div class="shop-title f-left">
										<h3>
											<a href="#" data-toggle="modal"
												data-target="#quick-view<%=ls.getProductId() %>"> <%=ls.getNameProduct() %></a>
										</h3>
									</div>
									<div class="price f-right">
									<span class="new"> <%=ls.getUnitPrice()%> đ
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
						<%
						}
						}
					%>
				</div>
				<!-- Xong hiển thị sản phẩm -->
			</div>
			<div class="text-center">
				<a class="hvr-shutter-out-horizontal"
					href="pages/shop-page.jsp?id_product=0">Xem thêm <i
					class="fa fa-angle-double-right"></i>
				</a>
			</div>
		</div>
	</div> 
	</div>
	</div>  --%>
	<!-- Xong sản phẩm nỗi bật -->
	<!-- Bắt đầu khu vực khuyến mãi -->

	<!-- Xong khu vực khuyến mãi -->
	<!-- Bắt đầu sản phẩm mới -->
	<!-- <div class="special-offer ptb-100">
 		 <div class="container">
 		 </div>-->

	<div class="section-title text-center mb-50">
		<h2>
			Sản phẩm mới <i class="fa fa-shopping-cart"></i>
		</h2>
	</div>
	<div class="row">
		<div class="special-slider-active owl-carousel">
	<%-- 		<%
				int index1 = -1;
				for (Products ls : p.getAllProDucts()) {
					index1++;
			%> --%>
			<%
				for(int i=0; i<lstPro.size();i++){
					
			%>
			<div class="single-special-slider">
				<div class="col-lg-12 col-md-12 col-xs-12">
					<div class="single-shop">
						<div class="shop-img">
							<a href="javascript:void(0)"><img
								src="images/giaydep/<%=lstPro.get(i).getImage()%>" alt="" height="280"  width="220"/></a>
							<div class="price-up-down">
								<span class="sale-new">Mới</span>
							</div>
							<div class="button-group">
								<a
									href="CartServlet?command=plus&productID=<%=lstPro.get(i).getProductId()%>"
									title="Add to Cart"> <i class="pe-7s-cart"></i>
								</a> <a class="wishlist" href="#" title="Wishlist"> <i
									class="pe-7s-like"></i>
								</a> <a href="#" data-toggle="modal" data-target="#quick-view<%=lstPro.get(i).getProductId()%>"
									title="Quick View"> <i class="pe-7s-look"></i>
								</a>
							</div>
						</div>
						<div class="shop-text-all">
							<div class="title-color fix">
								<div class="shop-title f-left">
									<h3>
										<a href="#" data-toggle="modal"
											data-target="#quick-view<%=lstPro.get(i).getProductId()%>"> <%=lstPro.get(i).getNameProduct()%></a>
									</h3>
								</div>
								<div class="price f-right">
									<span class="new"> <%=format.format(lstPro.get(i).getUnitPrice())%>đ
									</span>
								</div>
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

	<!-- Xong sản phẩm mới -->
	<!-- Bắt đầu phần bài viết -->
	<!-- 	<div class="offer-area shop-text bg-opacity-black-90">
		<div class="container">
			<div class="subscribe-bg ptb-80">
				<div class="row">
					<div class="col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 ">
						<div class="offer-text text-center">
							<h3>chương trình khuyến mãi</h3>
							<div class="text-center">
								<a class="hvr-shutter-out-horizontal"
									href="pages/shop-page.jsp?id_product=0">mua ngay <i
									class="fa fa-angle-double-right"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<div class="blog-area pb-70"> -->
	<!--  bat dau phan blog -->
	<% ArrayList<Blogs> blogs = (ArrayList<Blogs>)request.getAttribute("blog"); %>
		<div class="blog-area pb-70">
			<div class="container">
				<div class="section-title text-center mb-50">
					<h2>
						Chia sẽ các bài viết hay về đôi giày của bạn<i class="fa fa-pencil"></i>
					</h2>
				</div>
				<div class="row">
					<%
						int dem = 0;
						for (Blogs ls : blogs) {
							if (dem >= 6) {
								break;
							}
					%>
					<div class="col-md-4 col-sm-6">
						<div class="blog-details mb-30">
							<div class="blog-img">
								<a href="BlogReviewServlet?id_blog=<%=ls.getBlogId()%>"><img
									src="assets/img/blog/<%=ls.getImage() %>" alt="" height="280"  width="220"
									title="<%=ls.getDescribe()%>"></a>
								<div class="blog-quick-view">
									<a href="BlogReviewServlet?id_blog=<%=ls.getBlogId()%>"> <i
										class="pe-7s-link"></i>
									</a>
								</div>
							</div>
							<div class="blog-meta">
								<h4>
									<%
										//xử lý độ dài tiêu đề
											String tieude;
											if (ls.getTitle().length() > 20) {
												tieude = ls.getTitle().substring(0, 20) + "...";
											} else {
												tieude = ls.getTitle();
											}
									%>
									<a href="BlogReviewServlet?id_blog=<%=ls.getBlogId()%>"> <%=tieude%></a>
								</h4>
								<ul class="meta">
									<%
										String[] date = ls.getDatePost().split(" ");
									%>
									<li><%=date[0]%></li>
								</ul>
								<a href="BlogReviewServlet?id_blog=<%=ls.getBlogId()%>">
									Đọc thêm <i class="pe-7s-next"></i>
								</a>
							</div>
						</div>
					</div>
					<%
						dem++;
						}
					%>
				</div>
			</div>
		</div>
		<!--  xong phan blog -->
	 <%
	 	for(Products ls : lstPro){
	 		
	 %>
	
		
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
												<div class="shop-img">
													<img src="images/giaydep/<%=ls.getImage()%>" alt="" /> 													
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
																<h4>Giá bán:</h4>
															</div>
																<h2><%=ls.getUnitPrice() %>đ</h2>
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
																			<a href="CartServlet?command=plus&productID=<%=ls.getProductId()%>">Mua ngay <i
																				class="fa fa-cart-plus"></i></a>
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
	</div>
	 <%
	 	}
	 %>
		<%-- <%
			}
		%> --%>
	<!-- model quit view  -->
	
		<%-- 	<%
			}
		%> --%>
		<!-- xong model quit view -->
		<!-- Xong phần bài viết -->

		<!-- Thêm chân trang -->
		<jsp:include page="layout/footerpage.jsp"></jsp:include>
		<!-- Xong thêm chân trang -->

		<!-- Thêm xem chi tiết sản phẩm -->
		<jsp:include page="layout/detail_product.jsp"></jsp:include>
		<!-- Xong xem chi tiết sản phẩm  -->


		<!-- Toàn bộ js -->
		<script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/jquery.meanmenu.js"></script>
		<script src="assets/js/jquery.magnific-popup.min.js"></script>
		<script src="assets/js/isotope.pkgd.min.js"></script>
		<script src="assets/js/imagesloaded.pkgd.min.js"></script>
		<script src="assets/js/owl.carousel.min.js"></script>
		<script src="assets/js/jquery.validate.min.js"></script>
		<script src="lib/js/jquery.nivo.slider.js"></script>
		<script src="lib/home.js"></script>
		<script src="assets/js/plugins.js"></script>
		<script src="assets/js/main.js"></script>
</body>

</html>