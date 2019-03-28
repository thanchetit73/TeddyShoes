<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Admin - Bán hàng</title>
<meta name="description" content="Admin - Bán hàng">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="../include/css.jsp"></jsp:include>
</head>
<body>
	
	<jsp:include page="../include/leftmenu.jsp"></jsp:include>

	<!-- Right Panel -->

	<div id="right-panel" class="right-panel">

		<jsp:include page="../include/header.jsp"></jsp:include>

		<div class="breadcrumbs">
			<div class="breadcrumbs-inner">
				<div class="row m-0">
					<div class="col-sm-4">
						<div class="page-header float-left">
							<div class="page-title">
								<h1>
									<b>CHI TIẾT HÓA ĐƠN</b>
								</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="javascript:void(0)">Trang chủ</a></li>
									<li><a href="javascript:void(0)">Chi tiết hóa đơn</a></li>
									<li class="active">Chỉnh sửa</li>
								</ol>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="content">
			<div class="animated fadeIn">
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<strong>Chỉnh sửa</strong>
							</div>
							<div class="card-body card-block">
								<form action="editdetail" method="post"
									enctype="application/x-www-form-urlencoded"
									class="form-horizontal">
									<input type="hidden" class="form-control"
										value="" name="id">
									<input type="hidden" class="form-control"
										value="" name="idHoaDon">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="form-control-label">Chọn sản phẩm</label> <select
													name="id_sanpham" id="" class="form-control"
													required="required" onchange="SanPham(this.value)">
													<option value="">Chọn</option>
													
													<option value="" selected="selected"></option>
													
													<option value=""><option>
													
													
												</select>
											</div>

											<div class="form-group">
												<label class="form-control-label">Giá bán</label> <input
													type="number" class="form-control" readonly="readonly"
													id="gia" value="">
											</div>
											<div class="form-actions form-group">
												<button type="submit" class="btn btn-success">Lưu
													lại</button>
												<a class="btn btn-danger" href="viewdetail?idHoaDon=">Hủy bỏ</a>
											</div>
										</div>

										<div class="col-md-6">
											<div class="form-group">
												<label class="form-control-label">Số lượng</label> <input
													type="number" placeholder="Nhập số lượng"
													class="form-control" name="soluong" required="required"
													value="">
											</div>
											<div class="form-group">
												<label class="form-control-label">Khuyến mãi</label> <input
													type="number" class="form-control" readonly="readonly"
													id="khuyenmai" value="">
											</div>

										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- .animated -->
		</div>
		<!-- .content -->
		<div class="clearfix"></div>
	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<!-- Scripts -->
	<jsp:include page="../include/js.jsp"></jsp:include>

	<script src="../../lib/bower_components/jquery/dist/jquery.min.js"></script>
	<script>
		function SanPham(idsp) {
			$.ajax({
				url : "getProduct",
				data : {
					idsp : idsp
				},
				type : "POST"
			}).done(function(ketqua) {
				var array = JSON.parse(ketqua);
				$('#gia').val(array[0]);
				$('#khuyenmai').val(array[1]);
			})
		}
	</script>
</body>
</html>