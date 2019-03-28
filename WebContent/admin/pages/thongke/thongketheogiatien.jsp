<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="model.bean.Statistical"%>
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
	href="../../lib/bower_components/alertifyjs/css/alertify.css">
<link rel="stylesheet"
	href="../../lib/bower_components/alertifyjs/css/themes/default.css">
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
									<b>TÀI KHOẢN</b>
								</h1>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="page-header float-right">
							<div class="page-title">
								<ol class="breadcrumb text-right">
									<li><a href="javascript:void(0)">Trang chủ</a></li>
									<li><a href="javascript:void(0)">Tài khoản</a></li>
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
					<form action="StatisticalPriceServlet" method="get">
					
            <div class="col-lg-4">
                <select class="form-control" name="tugia">
                    
                    <option value="100000">100,000</option>
                    <option value="200000">200,000</option>
                    <option value="300000">300,000</option>
                    <option value="400000">400,000</option>
                    
                </select>
            </div>
            <div class="col-lg-4">
                <select class="form-control" name="dengia">
                    
                    <option value="100000">100,000</option>
                    <option value="200000">200,000</option>
                    <option value="300000">300,000</option>
                    <option value="400000">400,000</option>
                    
                </select>
            </div>
            <div class="col-lg-4">
               <div class="form-actions form-group">
												<button type="submit" value="thongketheogia" name="thongketheogia"
													class="btn btn-success form-control mt-4" >Thống kê</button>
											</div>
            </div>
            
        </form>
					
							<%	ArrayList<Statistical> listThongKeTheoGia = (ArrayList<Statistical>) request.getAttribute("listThongKeTheoGia");
							
							 if( listThongKeTheoGia != null){
							 %>
							<div class="card">
							<div class="card-header">
								<strong class="card-title">Danh sách</strong>
								<!-- 								<a class="btn btn-primary float-right" href="add"><span><i class="fa fa-plus-square"></i></span> Thêm</a> -->
							</div>
							<div class="card-body">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>Tên sản phẩm</th>
											<th>loại sản phẩm</th>
											<th>số lượng bán được</th>
											
										
										</tr>
									</thead>
									<tbody>
										 <%
						
						for (Statistical tk : listThongKeTheoGia) {
					%>
										<tr>
										
											<td><%=tk.getNameProduct() %></td>
											<td><%=tk.getType()%></td>
											<td><%=tk.getQuantity()%></td>
											
											
											
										
										
										</tr>
										<%} %>  
									
									</tbody>
								</table>
							</div>
						</div>
					<% 	}%>
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
	<script>
	$('body').addClass("open");
	</script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#bootstrap-data-table-export').DataTable();
		});
	</script>
	<script>
	function ThayDoiPhanQuyen(e){
		swal({
	  		  title: "Bạn có chắc chắn phân quyền?",
	  		  type: 'warning',
	  		  showCancelButton: true,
	  		  confirmButtonColor: '#3085d6',
	  		  cancelButtonColor: '#d33',
	  		  confirmButtonText: 'Yes'
	  		}).then((result) => {
	  		  if (result.value) {
	  			  var userName = e.getAttribute("data-id");
	  			  window.location.href = "KhachHangServlet?phanQuyen=admin&&userName=" + userName;
	  		  } else {
	  			  swal("Dữ liệu của bạn không thay đổi!");
	  		  }
	  		});
		
	}
	</script>

	<script>
	function ResetPass(id){
		swal({
			  title: 'Bạn chắc chắn muốn Reset Password?',
			  type: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((result) => {
			  if (result.value) {
				   $.ajax({
					   url: "resetpass",
					   type: "POST",
					   data: {
						   id: id
					   }
				   }).done(function(ketqua){
					   if(ketqua){
						  alertify.success('reset password successfully!');
					   }
				   }).error(function(){
					   console.log("Lỗi");
				   });
			  } else alertify.error('Dữ liệu không thay đổi!');
			})
	}
	</script>


	
</body>
</html>
