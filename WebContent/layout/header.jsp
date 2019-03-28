<%@page import="model.bean.Item"%>
<%@page import="java.util.Map"%>
<%@page import="model.bean.Cart"%>
<%@page import="model.bo.CategoryBO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Category"%>
<%@ page pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tiêu đề</title>
</head>
<body>
<%
Cart cart = (Cart) session.getAttribute("cart");
if (cart == null) {
    cart = new Cart();
    session.setAttribute("cart", cart);
}
%>
	<!-- Bắt đầu tiêu đề -->
	<header class="header-area home-style-2">
		<div class="header-bottom">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-sm-3 col-xs-6">
						<div class="logo">
							<a href="Home"> <img src="assets/img/logo/logo.png"
								alt="">
							</a>
						</div>
					</div>
					<div class="col-md-8 col-sm-9 col-xs-6">
						<div class="cart-menu">
							<div class="search-style-2 f-right">
								<a class="icon-search-2" href="javascript:void(0)"> <i
									class="pe-7s-search"></i></a>
								<div class="search2-content">
									<form action="ProductSearchServlet" method="get">
										<div class="search-input-button2">
											<input name="name" class="" placeholder="Tìm kiếm" type="text">
											<button class="search-button2" type="submit" name="tk">
												<i class="pe-7s-search"></i>
											</button>
										</div>
									</form>
								</div>
							</div>
							<div class="user user-style-3 f-right">
								<% String str = (String)session.getAttribute("tenDangNhap");
							
							if(str != null){ %>			
								<a href="#"> <i class="pe-7s-user"></i>
								</a>
								 <div class="currence-user-page">
									<div class="user-page">
										<ul>
											<li><a href="CustomerProfileServlet"><i
													class="pe-7s-id"></i><%=(String)session.getAttribute("userName") %> </a></li>
											<li><a href="/TeddyShoes2/CustomerLogOutServlet"><i class="pe-7s-back"></i> Đăng
													xuất</a></li>
										</ul>
									</div> 
								</div> 
							<%
									} else {
								%>
								<a href="#"> <i class="pe-7s-add-user"></i>
								</a>
								<div class="currence-user-page">
									<div class="user-page">
										<ul>  
											<li><a href="/TeddyShoes2/CustomerLoginServlet"><i
													class="pe-7s-next-2"></i>Đăng nhập</a></li>
											<li><a href="/TeddyShoes2/pages/register.jsp"><i
													class="pe-7s-add-user"></i>Tạo tài khoản mới</a></li>
										</ul>
									</div>
								</div>
							<%
									}
								%>	

							</div>
							<div class="user user-style-3 f-right hidden-xs">
								<a href="#"> <i class="pe-7s-global"></i>
								</a>
								<div class="currence-user-page">
									<div class="user-page">
										<ul>
											<li><a href="#"><i class="pe-7s-flag"></i> Ngôn ngữ</a></li>
										</ul>
									</div>
								</div>
							</div>
							  
							<div class="shopping-cart f-right">
							
								<a class="top-cart" href="#"><i
									class="pe-7s-cart"></i></a> <span><%=cart.countItem()%></span>
								
								 
								<ul>
								<%for (Map.Entry<String, Item> list : cart.getCartItems().entrySet()) {%>
									<li>
										<div class="cart-img-price">
											<div class="cart-img">
												 <img
													src="images/giaydep/<%=list.getValue().getProduct().getImage() %>"
													alt="" />
											</div>                     
											<div class="cart-content">
												<h3>
													<%-- <%=list.getValue().getProduct().getNameProduct()%> --%>
												</h3>
												
												
												 <%=list.getValue().getQuantity()%> x<span class="cart-price">$<%=list.getValue().getProduct().getUnitPrice()%></span>
											</div>
											<div class="cart-del">
												<a href="CartServlet?command=remove&productID=<%=list.getValue().getProduct().getProductId()%>"><%=list.getValue().getProduct().getNameProduct()%><i
													class="pe-7s-close-circle"></i></a>
											</div>
										</div>
									</li>
										<%} %>
									<li>
										<p class="total">
											Tổng: <span class="total-price">$<%=cart.totalCart()%>
												đ</span>
										</p>
									</li>
									<li>
										
										<p class="buttons">
											<a class="my-cart" href="./pages/cart.jsp">Xem giỏ hàng</a> <a
												class="checkout" href="./pages/checkout.jsp">Thanh toán</a>
										</p> 
									</li>
								
								</ul>
								
							</div>
							
							<div class="main-menu f-right">
								<nav>
									<ul>
										<li><a href="/TeddyShoes2/Index">Trang chủ</a>
										<li><a href="ProductSearchServlet">Sản
												phẩm</a>
											<ul class="dropdown">
												<!-- ** Đổ thể loại từ dữ liệu ra ** -->
												
											<%--   <%
											  ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("listm");
                                       for(Category c : list){
                                        	
                                    %> --%>
                                    <%
                                    CategoryBO c = new CategoryBO();
					for (Category ca : c.getListM() ) {
				%>
                                    
                                    <li><a href="ProductSearchServlet?id_type=<%=ca.getType_ID()%>"><%=ca.getType_Name()%></a></li>
                                        <%
                                            }
                                        %>
												
												<li><a
													href="./pages/shop-page.jsp?id_product=">
												</a></li>												
											</ul></li>
										<li><a href="BlogHomeServlet">Bài viết</a>
										<li><a href="ContactServlet">Liên hệ</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- Xong tiêu đề -->
	<!-- Cài đặt xem trên thiết bị di động -->
	<div class="mobile-menu-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="mobile-menu">
						<nav id="dropdown">
							<ul>
								<li><a class="active1" href="./index.jsp">Trang chủ</a></li>
								<li class="active1"><a class="active1"
									href="ProductListServlet">Sản phẩm</a>
									<ul>
										<!-- ** Đổ thể loại từ dữ liệu ra ** -->
									
										<li><a
											href="./pages/shop-page.jsp?id_product=">
										</a></li>
										
									</ul></li>
								<li class="active1"><a class="active1"
									href="./pages/blog-page.jsp">Bài viết</a>
								<li><a href="./pages/contact.jsp">Liên hệ</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Xong cài đặt xem trên thiết bị di động -->

</body>
</html>