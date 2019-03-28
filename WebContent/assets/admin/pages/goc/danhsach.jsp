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
                                <h1>Tên bảng</h1>
                                <a class="btn btn-primary float-right" href="javascript:void(0)"><span><i class="fa fa-plus-square"></i></span> Thêm</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="page-header float-right">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="javascript:void(0)">Trang chủ</a></li>
                                    <li><a href="javascript:void(0)">Menu 2 cấp</a></li>
                                    <li class="active">Tên bảng</li>
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
                                <strong class="card-title">Tiêu đề (Danh sách, thêm, xóa, sửa)</strong>
                            </div>
                            <div class="card-body">
                                <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Sửa</th>
                                            <th>Xóa</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Charde Marshall</td>
                                            <td>Regional Director</td>
                                            <td>
                                            	<a class="btn btn-success" href="javascript:void(0)"><span><i class="fa fa-edit"></i></span> Sửa</a>
                                            </td>
                                            <td>
                                            	<a class="btn btn-secondary" href="javascript:void(0)"><span><i class="fa fa-trash-o"></i></span> Xóa</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Haley Kennedy</td>
                                            <td>Senior Marketing Designer</td>
                                            <td>
                                            	<a class="btn btn-success" href="javascript:void(0)"><span><i class="fa fa-edit"></i></span> Sửa</a>
                                            </td>
                                            <td>
                                            	<a class="btn btn-secondary" href="javascript:void(0)"><span><i class="fa fa-trash-o"></i></span> Xóa</a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- .animated -->
        </div><!-- .content -->

    </div><!-- /#right-panel -->

    <!-- Right Panel -->

    <!-- Scripts -->
	
	<jsp:include page="../include/js.jsp"></jsp:include>
	
    <script src="../../lib/assets/js/lib/data-table/datatables.min.js"></script>
    <script src="../../lib/assets/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="../../lib/assets/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="../../lib/assets/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="../../lib/assets/js/lib/data-table/jszip.min.js"></script>
    <script src="../../lib/assets/js/lib/data-table/vfs_fonts.js"></script>
    <script src="../../lib/assets/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="../../lib/assets/js/lib/data-table/buttons.print.min.js"></script>
    <script src="../../lib/assets/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="../../lib/assets/js/init/datatables-init.js"></script>


    <script type="text/javascript">
        $(document).ready(function() {
          $('#bootstrap-data-table-export').DataTable();
      } );
  </script>


</body>
</html>
