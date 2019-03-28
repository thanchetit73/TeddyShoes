<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Header-->
<!-- get session attribute đăng nhập -->
        <header id="header" class="header">
            <div class="top-left">
                <div class="navbar-header">
                    <a class="navbar-brand" href="./"><img src="admin/lib/images/logo.png" alt="Logo"></a>
                    <a class="navbar-brand hidden" href="./"><img src="images/logo2.png" alt="Logo"></a>
                    <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                </div>
            </div>
            <div class="top-right">
                <div class="header-menu">
                    <div class="header-left">

                        <div class="dropdown for-notification">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-bell"></i>
                                <span class="count bg-danger">3</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="notification">
                                <p class="red">Bạn có 1 thông báo</p>
                                <a class="dropdown-item media" href="#">
                                    <i class="fa fa-check"></i>
                                    <p>Thông báo 1</p>
                                </a>
                            </div>
                        </div>
						
                        <div class="dropdown for-message">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="message" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-envelope"></i>
                                <span class="count bg-primary">4</span>
                            </button>
                            <div class="dropdown-menu" aria-labelledby="message">
                                <p class="red">Bạn có 4 thư mới</p>
                                <a class="dropdown-item media" href="#">
                                    <span class="photo media-left"><img alt="avatar" src="admin/lib/images/avatar/avata.png"></span>
                                    <div class="message media-body">
                                        <span class="name float-left">Tên</span>
                                        <span class="time float-right">Thời gian</span>
                                        <p>Nội dung rút gọn</p>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="user-area dropdown float-right">
                        <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        
						<img class="user-avatar rounded-circle" src="admin/lib/images/avatar/avata.png" alt="Admin">
						 
						
<%--                             <img class="user-avatar rounded-circle" src="../../../assets/img/testimonial/<%=l.getHinhanh()%>" alt="User Avatar"> --%>
                        </a>

                        <div class="user-menu dropdown-menu">
                            <a class="nav-link" href="/TeddyShoes2/CustomerGetListServlet?tenKhachHang=<%=(String)session.getAttribute("tenDangNhap")%>"><i class="fa fa-user"></i>Cập Nhật Thông Tin</a>
                            <a class="nav-link" href="/TeddyShoes2/CustomerLogOutServlet"><i class="fa fa-power-off"></i>Đăng xuất</a>
                        </div>
                    </div>
                </div>
        </header><!-- /header -->
        <!-- Header-->