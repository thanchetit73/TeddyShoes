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
									<b>SẢN PHẨM</b>
								</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="javascript:void(0)">Trang chủ</a></li>
									<li><a href="javascript:void(0)">Sản phẩm</a></li>
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
								<form action="edit" method="POST" enctype="multipart/form-data" class="form-horizontal">
									<input type="hidden" class="form-control"
										value="" name="id">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="form-control-label">Tên sản phẩm</label> <input
													type="text" placeholder="Nhập tên sản phẩm"
													class="form-control" name="tensanpham"
													value="">
											</div>
											<div class="form-group">
												<label class="form-control-label">Giá bán</label> <input
													type="number" placeholder="Nhập giá" class="form-control"
													name="giagoc" value="">
											</div>
											<div class="form-group">
												<label class="form-control-label">Nổi bật</label> <select
													name="noibat" id="" class="form-control">
													
													<option value="0" selected="selected">Không</option>
													<option value="1">Có</option>
													
													<option value="0">Không</option>
													<option value="1" selected="selected">Có</option>
													
												</select>
											</div>
											<div class="form-group">
												<label class="form-control-label">Mô tả</label>
												<textarea rows="10" cols=""
													placeholder="Nội dung mô tả sản phẩm" class="form-control"
													name="mota"></textarea>
											</div>
											<div class="form-actions form-group">
												<button type="submit" class="btn btn-success">Lưu
													lại</button>
												<a class="btn btn-danger" href="list">Hủy bỏ</a>
											</div>
										</div>

										<div class="col-md-6">
											<div class="form-group">
												<label class="form-control-label">Chọn loại sản phẩm</label>
												<select name="id_loaisanpham" id="" class="form-control"
													required="required">
													<option value="">Chọn</option>
													
													<option value="" selected="selected"><</option>
													
													<option value=""></option>
													

												</select>
											</div>
											<div class="form-group">
												<label class="form-control-label">Khuyến mãi</label> <input
													type="number" placeholder="Nhập khuyến mãi"
													class="form-control" name="khuyenmai"
													value="">
											</div>
											<div class="form-group">
												<label class="form-control-label">Lượt thích</label> <input
													type="number" placeholder="Nhập số lượt thích"
													class="form-control" name="luotthich" readonly="readonly"
													value="">
											</div>
											<div class="form-group">
												<label class="form-control-label">Chọn ảnh</label>
												<div>
													<input type="file" name="file" id="profile-img">
													
													<img
														src="../../../assets/img/shop/product/"
														id="profile-img-tag" width="500px"
														style="display: block; margin-left: auto; margin-right: auto;" />
													
													<img src="" id="profile-img-tag" width="500px"
														style="display: block; margin-left: auto; margin-right: auto;" />
													

												</div>
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
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#profile-img-tag').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$("#profile-img").change(function() {
			readURL(this);
		});
	</script>
</body>
</html>