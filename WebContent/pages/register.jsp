<%@ page pageEncoding="utf-8"%>
<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Đăng ký</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- icon hiển thị -->
<link rel="shortcut icon" type="image/x-icon"
	href="../assets/img/icon1.png">

<!-- Tất cả css -->
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/css/magnific-popup.css">
<link rel="stylesheet" href="../assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="../assets/css/font-awesome.min.css">
<link rel="stylesheet" href="../assets/css/pe-icon-7-stroke.css">
<link rel="stylesheet" href="../lib/css/nivo-slider.css" type="text/css" />
<link rel="stylesheet" href="../lib/css/preview.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="../assets/css/animate.css">
<link rel="stylesheet" href="../assets/css/meanmenu.min.css">
<link rel="stylesheet" href="../assets/css/bundle.css">
<link rel="stylesheet" href="../assets/css/style.css">
<link rel="stylesheet" href="../assets/css/responsive.css">
<script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
	<!-- Thêm phần tiêu đề trang -->
	<jsp:include page="../layout/header.jsp"></jsp:include>
	<!-- Xong phần tiêu đề trang -->


	<!-- Bắt đầu tiêu đề trang con -->
	<div class="breadcrumbs-area breadcrumb-bg ptb-100">
		<div class="container">
			<div class="breadcrumbs text-center">
				<h2 class="breadcrumb-title">Đăng ký tài khoản</h2>
				<ul>
					<li><a class="active" href="../index.jsp">Trang chủ</a></li>
					<li>Đăng ký</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Xong tiêu đề trang con-->
	<!-- Bắt đầu phần đăng ký -->
	<div class="login-area ptb-100">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-3">
					<div class="login-content">
						<div class="login-title">
							<h4>Đăng ký</h4>
							<p>Nhập thông tin đăng ký tài khoản bên dưới.</p>
						</div>
						<div class="login-form">
							<form action="/TeddyShoes2/CustomerRegServlet" method="post">

							
								<%
									if (session.getAttribute("SingupError") != null) {
								%>
								<div class="alert alert-danger"><%=session.getAttribute("SingupError")%></div>
								<%
									session.removeAttribute("SingupError");
									}
								%>

								<%
									if (session.getAttribute("move") != null) {
										String[] value = (String[]) session.getAttribute("move");
								%>
								<input name="userName" placeholder="Tên tài khoản *"
									type="text" required value="<%=value[0]%>">

								<%
									if (session.getAttribute("acc0") != null) {
								%>
								<p class="alert-danger"><%=session.getAttribute("acc0")%></p>
								<%
									session.removeAttribute("acc0");
										}
								%>

								<input name="password" placeholder="Mật khẩu *"
									type="password" required value="<%=value[1]%>">
								<%
									if (session.getAttribute("acc1") != null) {
								%>
								<p class="alert-danger"><%=session.getAttribute("acc1")%></p>
								<%
									session.removeAttribute("acc1");
										}
								%>

								<input name="repassword" placeholder="Nhập lại mật khẩu *"
									type="password" required value="<%=value[2]%>">
								<%
									if (session.getAttribute("acc2") != null) {
								%>

								<p class="alert-danger"><%=session.getAttribute("acc2")%></p>
								<%
									session.removeAttribute("acc2");
										}
								%>
								<input name="email" placeholder="Email *" type="email"
									required value="<%=value[3]%>">
									 <input name="showName"
									placeholder="Tên hiển thị *" type="text" required
									value="<%=value[4]%>">
								<%
									if (session.getAttribute("acc4") != null) {
								%>
								<p class="alert-danger"><%=session.getAttribute("acc4")%></p>
								<%
									session.removeAttribute("acc4");
										}
								%>
								<input name="avatar" type="text" >

								<%
									session.removeAttribute("move");
									}

									else {
								%>
								<input name="userName" placeholder="Tên tài khoản *"
									type="text" required value=""> <input
									name="password" placeholder="Mật khẩu *" type="password"
									required> <input name="repassword"
									placeholder="Nhập lại mật khẩu *" type="password" required>

								<input name="email" placeholder="Email *" type="email"
									required> <input name="showName"
									placeholder="Tên hiển thị *" type="text" required>
									<input name="avatar" type="text" >
								<%
									}
								%>

								<%
									if (session.getAttribute("AcccExists") != null) {
								%>
								<div class="alert alert-danger"><%=session.getAttribute("AcccExists")%></div>
								<%
									session.removeAttribute("AcccExists");
									}
								%>
								<div class="button-remember">								
									<button class="login-btn" type="submit" value="submit" name="submit">Xác nhận</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Xong phần đăng ký -->



	<!-- Thêm chân trang -->
	<jsp:include page="../layout/footerpage.jsp"></jsp:include>
	<!-- Xong thêm chân trang -->



	<!-- Toàn bộ js -->
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