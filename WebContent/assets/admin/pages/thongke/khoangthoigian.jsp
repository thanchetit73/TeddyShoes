<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>>
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
									<b>THỐNG KÊ DOANH THU</b>
								</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="javascript:void(0)">Trang chủ</a></li>
									<li><a href="javascript:void(0)">Thống kê</a></li>
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
								<strong>KHOẢNG THỜI GIAN</strong>
							</div>
							<div class="card-body card-block">
								<form action="khoangthoigian" method="post"
									enctype="application/x-www-form-urlencoded"
									class="form-horizontal">
									<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-3">
											<div class="form-group">
												<label class="form-control-label">Từ ngày</label> <input
													type="date" placeholder="Chọn ngày" class="form-control"
													name="tungay" required="required" id="tungay" value="">
											</div>
										</div>

										<div class="col-md-3">
											<div class="form-group">
												<label class="form-control-label">Đến ngày</label> <input
													type="date" placeholder="Chọn ngày" class="form-control"
													name="denngay" required="required" id="denngay" value="">
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-actions form-group">
												<button type="button"
													class="btn btn-success form-control mt-4" onclick="ThongKe()">Thống kê</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>

					<div class="col-md-12" id="danhsach" style="display: none">
						<div class="card">
							<div class="card-header">
								<strong>DANH SÁCH</strong>
							</div>
							<div class="card-body card-block" id="showajax">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Id</th>
											<th>Họ tên</th>
											<th>Số nhà</th>
											<th>Địa chỉ</th>
											<th>Điện thoại</th>
											<th>Email</th>
											<th>Ngày đặt</th>
											<th>Tổng tiền</th>
										</tr>
									</thead>
									<tbody>
										
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td>></td>
											<td></td>
											<td></td>
										</tr>
										
									</tbody>
								</table>
							</div>
							<div class="card-footer">
								<div class="float-right" id="tongtien">Tổng tiền:</div>
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


	<script type="text/javascript">
		$(document).ready(function() {
// 			$('#bootstrap-data-table-export').DataTable();
		});
		
		function ThongKe(){
			var tungay = $('#tungay').val();
			var denngay = $('#denngay').val();
			console.log(denngay)
			 $.ajax({
				   url: "",
				   type: "POST",
				   data: {
					   tungay: tungay, denngay: denngay
				   }
			   }).done(function(ketqua){
				   $('#danhsach').css('display', '');
				   $('#showajax').html(ketqua);
				   $('#tongtien').text("Tổng tiền: " + $("#tong").val() + "đ");
				   $('#bootstrap-data-table-export').DataTable();
			   }).error(function(){
				   console.log("Lỗi");
			   });
		}
	</script>
</body>
</html>