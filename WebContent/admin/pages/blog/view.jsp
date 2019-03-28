<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Admin - Bán hàng</title>
<meta name="description" content="Admin - Bán hàng">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="../include/css.jsp"></jsp:include>

<link rel="stylesheet" href="../../../assets/css/style.css">

<!-- <link -->

<link rel="stylesheet" href="../../lib/css/jquery.dataTables.css">
<link rel="stylesheet"
	href="../../lib/bower_components/alertifyjs/css/alertify.css">
<link rel="stylesheet"
	href="../../lib/bower_components/alertifyjs/css/themes/default.css">
<style type="text/css">
td.details-control {
	text-align: center;
	color: forestgreen;
	cursor: pointer;
}

tr.shown td.details-control {
	text-align: center;
	color: red;
}
</style>
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
									<li><a href="javascript:void(0)" class="active">Blog</a></li>
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
								<strong></strong>
								<div class="pull-right">
									<a class="btn btn-success" href="edit?id="><span><i
											class="fa fa-edit"></i></span> Sửa</a>
									<button class="btn btn-secondary"
										onclick="Delete()">
										<span><i class="fa fa-trash-o"></i></span> Xóa
									</button>
								</div>
							</div>
							<div class="card-body card-block">
								<div class="row">
									<div class="col-md-12">
										<div class="blog-wrapper">
											<!-- div class="single-blog"> -->
											<div>
												<a href="#"><img src="#" alt=""></a>
												<div class="blog-details-text mt-20">
													<div class="post-info">
														<ul>
															<li><i class="fa fa-user"></i></li>
															<li><i class="fa fa-calendar"></i> </li>
															<li><a href="#"><i class="fa fa-comments-o"></i>20</a></li>
														</ul>
													</div>

													<div style="margin-top: 1em;">
														
													</div>
												</div>
												<div class="news-details-bottom mtb-60">
													<div class="card">
														<div class="card-header">
															<strong class="card-title">BÌNH LUẬN</strong>
														</div>
														<div class="card-body" style="font-size: 16px;"
															id="loadajax">
															<p style="display: none;"><</p>
															<table id="bootstrap-data-table"
																class="table table-striped table-bordered">
																<thead>
																	<tr>
																		<th>ID</th>
																		<th>Tên</th>
																		<th>Nội dung</th>
																		<th>Ngày bình luận</th>
																		<th>Chỉnh sửa</th>
																		<th>Xóa</th>
																	</tr>
																</thead>
																<tfoot>
																	<tr>
																		<th>ID</th>
																		<th>Tên</th>
																		<th>Nội dung</th>
																		<th>Ngày bình luận</th>
																		<th>Chỉnh sửa</th>
																		<th>Xóa</th>
																	</tr>
																</tfoot>
																<tbody>
																	
																	<tr>
																		<td></td>
																		<td></td>
																		<td><td>
																		<td><td>
																		<td><button class="btn btn-success"
																				onclick="EditComment(, '')">
																				<span><i class="fa fa-edit"></i></span> Sửa
																			</button></td>
																		<td><button class="btn btn-secondary"
																				onclick="DeleteComment()">
																				<span><i class="fa fa-trash-o"></i></span> Xóa
																			</button></td>
																	</tr>
																	
																</tbody>
															</table>
														</div>
													</div>
												</div>
												<div class="leave-comment">
													<h3 class="leave-comment-text">Viết bình luận</h3>
													<form action="addComment" method="post"
														enctype="application/x-www-form-urlencoded">
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<textarea class="form-control" rows="2"
																		placeholder="Nhập bình luận" name="noidungbinhluan"
																		id="noidungbinhluan"></textarea>
																</div>
																<div class="form-group">
																	<input type="button" class="btn btn-primary"
																		value="Đăng bình luận"
																		onclick="DangBinhLuan()"
																		required="required">
																</div>
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
	<script src="../../lib/assets/js/lib/data-table/datatables.min.js"></script>
	<script
		src="../../lib/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
	<script
		src="../../lib/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
	<script
		src="../../lib/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
	<script src="../../lib/assets/js/lib/data-table/jszip.min.js"></script>
	<script src="../../lib/assets/js/lib/data-table/vfs_fonts.js"></script>
	<script src="../../lib/assets/js/lib/data-table/buttons.html5.min.js"></script>
	<script src="../../lib/assets/js/lib/data-table/buttons.print.min.js"></script>
	<script src="../../lib/assets/js/lib/data-table/buttons.colVis.min.js"></script>
	<script src="../../lib/assets/js/init/datatables-init.js"></script>

	<script src="../../lib/bower_components/alertifyjs/alertify.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#bootstrap-data-table-export').DataTable();
		});
	</script>
	<script>
function DeleteComment(idComment){
	alertify.defaults.glossary.title = 'Xóa bình luận';
	alertify.confirm("Bạn muốn xóa dữ liệu?",
	  function(){
		$.ajax({
	        url: '../comment/delete',
	        type: 'GET',
	        dataType:'html',
	        data: {
	        	idComment: idComment
	        }
	    }).done(function(ketqua) {
	    	var hang = $('#bootstrap-data-table tbody tr').each(function(){
	    		if($(this).find('td:first-child').text() == idComment){
	    			$(this).find('td').remove();
	    		}
	    	});
			alertify.success('Xóa bình luận thành công');
	    });
	  },
	  function(){
	    alertify.error('Dữ liệu không thay đổi');
	  });
}
</script>

	<script>
function DangBinhLuan(idBaiViet){
	var noidungbinhluan = document.getElementById("noidungbinhluan").value;
	if(noidungbinhluan == "") return;
	var loadajax = document.getElementById("loadajax");
	var idBaiViet = $("#loadajax").find('p').first().text();
	$.ajax({
        url: '../comment/add',
        type: 'GET',
        dataType:'html',
        data: {
            idBaiViet: idBaiViet, noidung: noidungbinhluan
        }
    }).done(function(ketqua) {
		//load dữ liệu bình luận
			$("#loadajax").html(ketqua);
			$('#bootstrap-data-table').DataTable();
    		alertify.success('Đăng bình luận thành công!');
         });
	document.getElementById("noidungbinhluan").value = "";
}
</script>

	<script>
function EditComment(idComment, content){
	alertify.defaults.glossary.title = 'Chỉnh sửa';
	alertify.prompt("Nhập nội dung bình luận", content,
	  function(evt, content){
		if(content == "") return;
		$.ajax({
	        url: '../comment/edit',
	        type: 'GET',
	        dataType:'html',
	        data: {
	        	idComment: idComment, content: content
	        }
	    }).done(function(ketqua) {
	    	var hang = $('#bootstrap-data-table tbody tr').each(function(index, element){
	    		if($(this).find('td:first-child').text() == idComment){
// 	    			var hang = $(this).find('td')[2];
 	    			$($(this).find('td')[2]).text(content);
 	    			$($(this).find('td')[4]).find('button').first().attr("onclick", "EditComment("+ idComment +", '" + content + "')");
 	    				
	    		}
	    	});

			alertify.success('Sửa bình luận thành công');
	    });

	  },
	  function(){
	    alertify.error('Dữ liệu không thay đổi');
	  });
}

</script>

<script>
function Delete(id) {
	swal({
		  title: "Bạn có chắc chắn muốn xóa dữ liệu?",
		  text: "Sau khi xóa, bạn sẽ không thể phục hồi dữ liệu này!",
		  type: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes'
		}).then((result) => {
		  if (result.value) {
			  window.location.href = "delete?id=" + id;
		  } else {
			  swal("Dữ liệu của bạn không thay đổi!");
		  }
		});
}
</script>
</body>
</html>