<%@page import="model.bean.Blogs"%>
<%@page import="model.bo.BlogsBO"%>
<%@ page pageEncoding="utf-8"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Bài viết - công thức</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- icon cho trang -->
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
<link rel="stylesheet" href="assets/css/meanmenu.min.css">
<link rel="stylesheet" href="assets/css/bundle.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>

	<!-- Thêm phần tiêu đề trang -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- Xong phần tiêu đề trang -->

	<!-- Bắt đầu tiêu đề trang con -->
	<div class="breadcrumbs-area breadcrumb-bg ptb-100">
		<div class="container">
			<div class="breadcrumbs text-center">
				<h2 class="breadcrumb-title">BLOGS TEDDYSHOES</h2>
				<ul>
					<li><a class="active" href="index.jsp">Trang chủ</a></li>
					<li>Blogs</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Xong tiêu đề trang con -->
	<!-- Bắt đầu nội dung bài viết -->
	<div class="blog-fullwidth-area pt-100 pb-70">
		<%
			BlogsBO blogs = new BlogsBO();
		%>
		<div class="container">
			<div class="row">
				<%
					int count = 0;
					if ((request.getParameter("min") == null) && (request.getParameter("max") == null)) {
						for (Blogs ls : blogs.getListBlogs()) {
							if (count >= 9) {
								break;
							}
				%>
				<div class="col-md-4 col-sm-6">
					<div class="blog-details mb-30">
						<div class="blog-img">
							<a href="BlogReviewServlet?id_blog=<%=ls.getBlogId()%>"><img
								src="assets/img/blog/<%=ls.getImage() %>" alt="" height="280"  width="220"></a>
							<div class="blog-quick-view">
								<a href="BlogReviewServlet?id_blog=<%=ls.getBlogId()%>"> <i
									class="pe-7s-link"></i>
								</a>
							</div>
						</div>
						<div class="blog-meta">
							<%
								//xử lý độ dài tiêu đề
										String tieude;
										if (ls.getTitle().length() > 20) {
											tieude = ls.getTitle().substring(0, 20) + "...";
										} else {
											tieude = ls.getTitle();
										}
							%>
							<h4>
								<a href="BlogReviewServlet?id_blog=<%=ls.getTitle()%>"><%=tieude%></a>
							</h4>
							<ul class="meta">
								<%
									String[] date = ls.getDatePost().split(" ");
								%>
								<li><%=date[0]%></li>
							</ul>
							<a href="BlogReviewServlet?id_blog=<%=ls.getBlogId()%>">Chi tiết <i
								class="fa fa-long-arrow-right"></i></a>
						</div>
					</div>
				</div>
				<%
					count++;
						}
					} else {
				%>
				<div class="row">
					<%
						int min = Integer.parseInt(request.getParameter("min"));
							int max = Integer.parseInt(request.getParameter("max"));
							for (int i = min; i < max; i++) {
								Blogs ls = blogs.getListBlogs().get(i);
					%>
					<div class="col-md-4 col-sm-6">
						<div class="blog-details mb-30">
							<div class="blog-img">
								<a href="BlogReviewServlet?id_blog=<%=ls.getBlogId()%>"><img
									src="assets/img/blog/giay1.jpg" alt=""></a>
								<div class="blog-quick-view">
									<a href="BlogReviewServlet?id_blog=<%=ls.getBlogId()%>"> <i
										class="pe-7s-link"></i>
									</a>
								</div>
							</div>
							<div class="blog-meta">
								<%
									//xử lý độ dài tiêu đề
											String tieude;
											if (ls.getTitle().length() > 20) {
												tieude = ls.getTitle().substring(0, 20) + "...";
											} else {
												tieude = ls.getTitle();
											}
								%>
								<h4>
									<a href="BlogReviewServlet?id_blog=<%=ls.getBlogId()%>"><%=tieude%></a>
								</h4>
								<ul class="meta">
									<%
										String[] date = ls.getDatePost().split(" ");
									%>
									<li><%=date[0]%></li>
								</ul>
								<a href="BlogReviewServlet?id_blog=<%=ls.getBlogId()%>">Chi tiết
									<i class="fa fa-long-arrow-right"></i>
								</a>
							</div>
						</div>
					</div>

					<%
						}
						}
					%>
				</div>


				<div class="row">
					<div class="col-md-12">
						<div class="page-pagination text-center">
							<ul style="margin-bottom: 50px;">
								<%
									int min, max, limit;
									limit = blogs.getListBlogs().size() / 9;
									if ((limit * 9) < blogs.getListBlogs().size()) {
										limit += 1;
									}
									for (int i = 1; i <= limit; i++) {
										min = (i - 1) * 9;
										max = i * 9;
										if (max > blogs.getListBlogs().size()) {
											max = blogs.getListBlogs().size();
										}
								%>
								<li><a href="blog-page.jsp?min=<%=min%>&max=<%=max%>">
										<%=i%>
								</a></li>
								<%
									}
								%>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Xong nội dung bài viết-->

		<!-- Thêm chân trang -->
		<jsp:include page="../layout/footerpage.jsp"></jsp:include>
		<!-- Xong thêm chân trang -->

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