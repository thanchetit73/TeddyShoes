<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<!DOCTYPE html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Admin - Bán hàng</title>
<meta name="description" content="Admin - Bán hàng">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="../include/css.jsp"></jsp:include>
<script src='../../lib/bower_components/tinymce/tinymce.min.js'></script>
</head>
<body>
	<%
		Map<String, String> blog = (Map<String, String>) request.getAttribute("blog");
	%>
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
									<b>BLOG</b>
								</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="javascript:void(0)">Trang chủ</a></li>
									<li><a href="javascript:void(0)">Blog</a></li>
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
								<strong>Thêm</strong>
							</div>
							<div class="card-body card-block">
								<form action="edit" method="post" enctype="multipart/form-data"
									class="form-horizontal">
									<input type="hidden" class="form-control"
										value="<%=blog.get("id")%>" name="id">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label class="form-control-label">Tiêu đề</label> <input
													type="text" placeholder="Nhập tiêu đề" class="form-control"
													name="tieude" value="<%=blog.get("tieude")%>">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="form-control-label">Mô tả</label>
												<textarea class="form-control" rows="15"
													placeholder="Nhập mô tả" name="mota"><%=blog.get("mota")%></textarea>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label class="form-control-label">Chọn ảnh</label>
												<div>
													<input type="file" name="file" id="profile-img">
													<%
														if (blog.get("hinhanh") != "") {
													%>
													<img
														src="../../../assets/img/blog/<%=blog.get("hinhanh")%>"
														id="profile-img-tag" width="500px"
														style="display: block; margin-left: auto; margin-right: auto;" />
													<%
														} else {
													%>
													<img src="" id="profile-img-tag" width="500px"
														style="display: block; margin-left: auto; margin-right: auto;" />
													<%
														}
													%>
												</div>
											</div>
										</div>
										<div class="col-md-12">
											<hr>
											<label class="form-control-label">Nội dung</label>
											<div class="form-actions form-group">
												<textarea id="mytextarea" name="noidung"
													class="form-control" rows="20" placeholder="Nhập nội dung"><%=blog.get("noidung")%></textarea>
											</div>
											<div class="form-actions form-group">
												<button type="submit" class="btn btn-success">Lưu
													lại</button>
												<a class="btn btn-danger" href="list">Hủy bỏ</a>
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
	<script>
		tinymce
				.init({
					selector : '#mytextarea',
					plugins : [
							'advlist autolink lists link image charmap print preview anchor textcolor',
							'searchreplace visualblocks code fullscreen',
							'insertdatetime media table contextmenu paste code help wordcount',
							'image code' ],
					toolbar : 'insert | undo redo |  formatselect | bold italic backcolor  | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | removeformat | help | image',
					content_css : [
							'//fonts.googleapis.com/css?family=Lato:300,300i,400,400i',
							'//www.tinymce.com/css/codepen.min.css' ],
					image_title : true,
					automatic_uploads : true,
					file_picker_types : 'image',
					file_picker_callback : function(cb, value, meta) {
						var input = document.createElement('input');
						input.setAttribute('type', 'file');
						input.setAttribute('accept', 'image/*');
						input.onchange = function() {
							var file = this.files[0];
							var reader = new FileReader();

							reader.onload = function() {
								var id = 'blobid' + (new Date()).getTime();
								var blobCache = tinymce.activeEditor.editorUpload.blobCache;
								var base64 = reader.result.split(',')[1];
								var blobInfo = blobCache.create(id, file,
										base64);
								blobCache.add(blobInfo);
								cb(blobInfo.blobUri(), {
									title : file.name
								});
							};
							reader.readAsDataURL(file);
						};
						input.click();
					}
				});
	</script>
</body>
</html>