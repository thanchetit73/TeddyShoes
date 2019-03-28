<%@page import="model.bean.Products"%>
<%@page import="java.util.ArrayList"%>
<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Chi tiết sản phẩm</title>
</head>
<body>

	<!-- Bắt đầu xem nhanh chi tiết -->
	<div class="quick-view modal fade in" id="quick-view">
		<div class="container">
			<div class="row">
				<div id="view-gallery">
					<div class="col-xs-12">
						<div class="d-table">
							<div class="d-tablecell">
								<div class="modal-dialog">
									<div class="main-view modal-content">
										<div class="modal-footer" data-dismiss="modal">
											<span>x</span>
										</div>
										<div class="row">
											<div class="col-xs-12 col-sm-5">
												<div class="quick-image">
													<div class="single-quick-image tab-content text-center">
														
														<div class="tab-pane  fade in active"
															id="sin-pro-">
															<img
																src="assets/img/shop/DetailProduct/"
																alt="" />
														</div>
													
														<div class="tab-pane fade in"
															id="sin-pro-">
															<img
																src="assets/img/shop/DetailProduct/"
																alt="" />
														</div>													
													</div>
													<div class="quick-thumb">
														<div class="nav nav-tabs">
															<ul>
																
																<li><a data-toggle="tab"
																	href="#sin-pro-"> <img
																		src="assets/img/shop/DetailProduct/"
																		alt="quick view" />
																</a></li>
																
															</ul>
														</div>
													</div>
												</div>
											</div>
											<div class="col-xs-12 col-sm-7">
												<div class="quick-right">
													<div class="quick-right-text">
														<h3>
															<strong></strong>
														</h3>
														<div class="rating">
															<i class="fa fa-thumbs-o-up"> <b></b>
																lượt thích
															</i>
														</div>
														<div class="amount">
														
															<h4>
																Giá bán
																
																đ
															</h4>
														</div>
														<p></p>
														<div class="dse-btn">
															<div class="row">
																<div class="col-sm-12 col-md-6">
																	<div class="por-dse clearfix">
																		<ul>
																			<li class="share-btn clearfix"><span>Yêu
																					thích</span> <a href="#"><i class="fa fa-thumbs-up"></i></a>
																			</li>

																		</ul>
																	</div>
																</div>
																<div class="col-sm-12 col-md-6">
																	<div class="por-dse add-to">
																		<a href="cart?status=add&id_product=">Mua ngay <i class="fa fa-cart-plus"></i></a>
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
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<!-- Xong xem nhanh chi tiết -->



</body>
</html>