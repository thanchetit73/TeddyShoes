<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Left Panel -->

    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="Home"><i class="menu-icon fa fa-laptop"></i>TRANG CHỦ</a>
                    </li>
                    <li class="menu-title">MENU</li><!-- /.menu-title -->
                    <li>
						<a href="CategoryGetListServlet"> <i class="menu-icon fa fa-building-o"></i>Loại sản phẩm</a>
                    </li>
                    <li>
						<a href="ProductsGetListServlet"> <i class="menu-icon ti-receipt"></i>Sản phẩm</a>
                    </li>
                    <li>
						<a href="BlogsGetListServlet"> <i class="menu-icon fa fa-book"></i>Blog</a>
                    </li>
                    <li>
						<a href="ViewServlet"> <i class="menu-icon fa fa-id-card-o"></i>Hóa đơn</a>
                    </li>
                    <li>
						<a href="CustomerGetListServlet"> <i class="menu-icon fa fa-user"></i>Tài khoản</a>
                    </li>
                    <li class="menu-item-has-children">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-bar-chart"></i>Thống kê</a>
                        <ul class="sub-menu children dropdown-menu">
                             <li><i class="fa fa-table"></i><a href="/TeddyShoes2/StatisticalServlet">Thống kê doanh thu</a></li>
                            <li><i class="fa fa-table"></i><a href="/TeddyShoes2/StatisticalQuantityServlet">Thống kê sản phẩm bán chạy</a></li>
                             <li><i class="fa fa-table"></i><a href="/TeddyShoes2/StatisticalPriceServlet">Thống kê sản phẩm theo giá</a></li>
                        </ul>
                    </li>
					<li class="menu-item-has-children">
                        <span class="" data-toggle="" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-home"></i><b> Teddy Shoes </b></span>         
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside><!-- /#left-panel -->

    <!-- Left Panel -->