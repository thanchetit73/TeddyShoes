<%@page import="model.bean.Bill"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.ViewBEAN"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
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
<link rel="stylesheet"
	href="admin/lib/bower_components/alertifyjs/css/alertify.css">
<link rel="stylesheet"
	href="admin/lib/bower_components/alertifyjs/css/themes/default.css">
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
									<b>HÓA ĐƠN</b>
								</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="javascript:void(0)">Trang chủ</a></li>
									<li><a href="javascript:void(0)">Hóa đơn</a></li>
									<li class="active">Danh sách</li>
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
								<strong class="card-title">Danh sách</strong> <a
									class="btn btn-primary float-right btn-sm" href="listdestroy">ĐÃ
									HỦY</a><a class="btn btn-primary float-right btn-sm mr-2"
									href="listpayment">ĐÃ THANH TOÁN</a>
							</div>
							<div class="card-body">
								<%
									if (request.getAttribute("lstView") != null) {
										ArrayList<Bill> lstView = (ArrayList<Bill>) request.getAttribute("lstView");
								%>
								<table id="bootstrap-data-table-export"
									class="table table-striped table-bordered "
									style="font-size: 14px">
									<thead>
										<tr>
											<th>ID</th>
											<th>Họ tên</th>
											<th>Địa chỉ</th>

											<th>Tong tien</th>
											<th>Phuong thuc</th>
											<th>Ngày đặt</th>
											<th>Xem chi tiết</th>
											<!-- <th>Thanh toán</th> -->
											<th>Trạng Thái</th>
											<th></th>



										</tr>
									</thead>
									<tbody>
										<%
											for (Bill lst : lstView) {
										%>
										<tr>
											<td><%=lst.getBillID()%></td>
											<td><%=lst.getUserID()%></td>
											<td><%=lst.getAddress()%></td>

											<td><%=lst.getTotal()%></td>
											<td><%=lst.getPayment()%></td>
											<td><%=lst.getDate()%></td>

											<td><a class="btn btn-info btn-block btn-sm"
												href="ViewDBillServlet?bill_Id=<%=lst.getBillID()%>"><span><i
														class="fa fa-edit"></i></span> Chi tiết</a></td>

											<!--<td> <button class="btn btn-danger btn-sm"
							onclick="ThanhToan()">Thanh toán</button></td> -->
											<td><button class="btn btn-warning btn-sm"
													onclick="ThayDoiTrangThai('')" id="trangthai">Đang
													ship</button></td>
											<td>
												<div>
													<button class="btn btn-secondary mt-1 btn-block btn-sm"
														onclick="window.location='DeleteServlet?Xoa&Bill_Id=<%=lst.getBillID()%>';">
														<span><i class="fa fa-trash-o"></i></span> Hủy
													</button>
												</div>
											</td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
								<%
									}
								%>
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

	<script src="admin/lib/assets/js/lib/data-table/datatables.min.js"></script>
	<script
		src="admin/lib/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
	<script
		src="admin/lib/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
	<script
		src="admin/lib/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
	<script src="admin/lib/assets/js/lib/data-table/jszip.min.js"></script>
	<script src="admin/lib/assets/js/lib/data-table/vfs_fonts.js"></script>
	<script src="admin/lib/assets/js/lib/data-table/buttons.html5.min.js"></script>
	<script src="admin/lib/assets/js/lib/data-table/buttons.print.min.js"></script>
	<script src="admin/lib/assets/js/lib/data-table/buttons.colVis.min.js"></script>
	<script src="admin/lib/assets/js/init/datatables-init.js"></script>

	<script src="admin/lib/bower_components/alertifyjs/alertify.js"></script>


	<script type="text/javascript">
$(document).ready(function() {
	$('#bootstrap-data-table-export').DataTable();
});
</script>

	<script>
$('body').addClass("open");
</script>
	<script>
	function ThayDoiTrangThai(id, trangthai){
// 		swal({
// 			  title: 'Bạn chắc chắn muốn đổi trạng thái?',
// 			  type: 'warning',
// 			  showCancelButton: true,
// 			  confirmButtonColor: '#3085d6',
// 			  cancelButtonColor: '#d33',
// 			  confirmButtonText: 'Yes'
// 			}).then((result) => {
// 			  if (result.value) {
				   $.ajax({
					   url: "status",
					   type: "POST",
					   data: {
						   id: id, trangthai: Math.abs(trangthai - 1)
					   }
				   }).done(function(ketqua){
					   if(ketqua){
						   if(trangthai == 0){
								$("#trangthai" + id).removeClass("btn-warning").addClass("btn-primary");
								$("#trangthai" + id).text("Đang ship");
								trangthai = 1;
								$("#trangthai" + id).attr("onclick","ThayDoiTrangThai("+ id + "," + trangthai+ ")");
							} else{
								$("#trangthai" + id).removeClass("btn-primary").addClass("btn-warning");
								$("#trangthai" + id).text("Đặt hàng");
								trangthai = 0;
								$("#trangthai" + id).attr("onclick","ThayDoiTrangThai("+ id + "," + trangthai+ ")");
							}
						  alertify.success('Đổi trạng thái thành công!');
					   }
				   }).error(function(){
					   console.log("Lỗi");
				   })
// 			  }
// 			})
	}
	</script>

	<script>
	function ThanhToan(id){
// 		swal({
// 			  title: 'Bạn chắc chắn muốn đổi thanh toán?',
// 			  type: 'warning',
// 			  showCancelButton: true,
// 			  confirmButtonColor: '#3085d6',
// 			  cancelButtonColor: '#d33',
// 			  confirmButtonText: 'Yes'
// 			}).then((result) => {
// 			  if (result.value) {
				   $.ajax({
					   url: "status",
					   type: "POST",
					   data: {
						   id: id, trangthai: 2
					   }
				   }).done(function(ketqua){
					   if(ketqua){
						   $('#bootstrap-data-table tr').each(function(index){
								if($(this).find('td').first().text() == id) {
									$('#bootstrap-data-table').DataTable().rows(index-1).remove().draw();
								}
							});
						  alertify.success('Thanh toán thành công!');
					   }
				   }).error(function(){
					   console.log("Lỗi");
				   });
// 			  } 
// 			  else {
// 				  alertify.error('Dữ liệu không thay đổi');
// // 			  }
// 			})
	}
	</script>

	<script>
function Destroy(id) {
	swal({
  title: "Bạn có chắc chắn muốn hủy hóa đơn?",
  type: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Yes'
}).then((result) => {
  if (result.value) {
	 $.ajax({
   url: "status",
   type: "POST",
   data: {
	   id: id, trangthai: 3
   }
  }).done(function(ketqua){
   if(ketqua){
	   $('#bootstrap-data-table tr').each(function(index){
			if($(this).find('td').first().text() == id) {
				$('#bootstrap-data-table').DataTable().rows(index-1).remove().draw();
			}
		});
	  alertify.success('Hủy hóa đơn thành công!');
   }
  }).error(function(){
   alertify.error('Lỗi');
  });
  } else {
	 alertify.error('Dữ liệu không thay đổi');
  }
});
}
</script>


	<%
		if ((String) session.getAttribute("Edit") == "Success") {
	%>
	<script>
swal('Sửa dữ liệu thành công');
</script>
	<%
		session.removeAttribute("Edit");
		}
	%>

	<%
		if ((String) session.getAttribute("Empty") == "Success") {
	%>
	<script>
alertify.error('Đã hủy một đơn hàng');
</script>
	<%
		session.removeAttribute("Empty");
		}
	%>

	<%
		if ((String) session.getAttribute("Delete") == "Success") {
	%>
	<script>
swal('Xóa dữ liệu thành công');
</script>
	<%
		session.removeAttribute("Delete");
		}
	%>

</body>
</html>