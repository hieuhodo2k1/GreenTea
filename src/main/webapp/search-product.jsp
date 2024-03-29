<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html lang="en">
<!-- Basic -->

<head >

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>Freshshop</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
	 <meta name="google-signin-client_id" content="1036870259189-5q0j11me86k3v4ni4eng6v02v2pe7jql.apps.googleusercontent.com">
	<link rel="stylesheet" href="css/header.css">
    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
	<link rel="stylesheet" href="fonts/themify-icons-font/themify-icons/themify-icons.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
.paging {
	color: #fff;
	text-align: center;
}

.paging .hvr-hover {
	width: 35px
}

.paging .fa {
	color: #000;
	font-size: 20px;
}

.paging .fa:hover {
	cursor: pointer;
	color: #b0b435;
}
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="shop-box-inner">
		<div class="container">
			<div class="row">
				<div
					class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
					<div class="right-product-box">
						<div class="product-item-filter row">
							<div class="col-12 col-sm-8 text-center text-sm-left">
								<div class="toolbar-sorter-right">
									<span>Sắp xếp</span> 
									<div class="select-sort-box">
						<a href="#" class="select-sort"> ${sortTitle} </a>
						<i class="fa fa-caret-down" aria-hidden="true"></i>
						
					<ul class="subnav-sort">
						<li><a href="SearchProduct?${params}=${argument}&sort=random">Không sắp xếp</a></li>
						<li><a href="SearchProduct?${params}=${argument}&sort=high-to-low">Giá cao → Giá thấp</a></li>
						<li><a href="SearchProduct?${params}=${argument}&sort=low-to-high">Giá thấp → Giá cao</a></li>
						<li><a href="SearchProduct?${params}=${argument}&sort=popularty">Phổ biến</a></li>
						
					</ul>
                    </div>
								</div>
						
							</div>
							<div class="col-12 col-sm-4 text-center text-sm-right">
								<ul class="nav nav-tabs ml-auto">
									<li><a class="nav-link active" href="#grid-view"
										data-toggle="tab"> <i class="fa fa-th"></i>
									</a></li>
									<li><a class="nav-link" href="#list-view"
										data-toggle="tab"> <i class="fa fa-list-ul"></i>
									</a></li>
								</ul>
							</div>
						</div>
						<c:if test="${listSearch.isEmpty()}">
						<h2 style="text-align: center;margin-top:30px;margin-bottom:30px">Không tìm thấy sản phẩm nào</h2>
						</c:if>
						<c:if test="${!listSearch.isEmpty()}">
						<div class="product-categorie-box">
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane fade show active"
									id="grid-view">
									<div class="row">
										<c:forEach var="product" items="${listSearch}">
											<a href="shop"></a>
											<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
											<c:url var="url" value="/shopdetail">
												<c:param name="idProduct" value="${product.idProduct}"></c:param>
											</c:url>
											<input id="url-product" value="${url}" type="hidden">
												<div class="products-single fix" onclick="showDetail('${url}')">
													<div class="box-img-hover">
														<div class="type-lb">
															<p class="sale">Sale</p>
														</div>
												<img src="${product.linkImage}" class="img-fluid"
															alt="Image"> 

														<div class="mask-icon">
															<ul>
																<li><a href="#" data-toggle="tooltip"
																	data-placement="right" title="View"><i
																		class="fas fa-eye"></i></a></li>
																<li><a href="#" data-toggle="tooltip"
																	data-placement="right" title="Compare"><i
																		class="fas fa-sync-alt"></i></a></li>
																<li><a href="#" data-toggle="tooltip"
																	data-placement="right" title="Add to Wishlist"><i
																		class="far fa-heart"></i></a></li>
															</ul>
															<c:url var="url" value="/addcart">
																	<c:param name="${params}" value="${argument}"></c:param>
																	<c:param name="sort" value="${sortby}"></c:param>
																	<c:param name="add" value="${product.idProduct }"></c:param>
																	<c:param name="url" value="SearchProduct" ></c:param>
																
														</c:url>
															<a class="cart" href="${url}">Add to Cart</a>
														</div>
													</div>
													<div class="why-text">
														<h4>${product.nameProduct}</h4>
														
														<h5> 
														<fmt:formatNumber type = "number" 
         														maxFractionDigits = "3" value = "${product.price}" /> ₫
														</h5>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
								<div role="tabpanel" class="tab-pane fade" id="list-view">
									<c:forEach var="product" items="${listSearch}">
										<div class="list-view-box">
											<c:url var="url" value="/shopdetail">
													<c:param name="idProduct" value="${product.idProduct}"></c:param>
												</c:url>
												<input id="url-product" value="${url}" type="hidden">
											<div class="row" onclick="showDetail('${url}')">
												<div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
													<div class="products-single fix">
														<div class="box-img-hover">
															<div class="type-lb">
																<p class="new">New</p>
															</div>
															<img src="${product.linkImage }" class="img-fluid"
																alt="Image">
															<div class="mask-icon">
																<ul>
																	<li><a href="#" data-toggle="tooltip"
																		data-placement="right" title="View"><i
																			class="fas fa-eye"></i></a></li>
																	<li><a href="#" data-toggle="tooltip"
																		data-placement="right" title="Compare"><i
																			class="fas fa-sync-alt"></i></a></li>
																	<li><a href="#" data-toggle="tooltip"
																		data-placement="right" title="Add to Wishlist"><i
																			class="far fa-heart"></i></a></li>
																</ul>

															</div>
														</div>
													</div>
												</div>
												<div class="col-sm-6 col-md-6 col-lg-8 col-xl-8">
													<div class="why-text full-width">
														<h4>${product.nameProduct}</h4>
														<h5>
															<fmt:formatNumber type = "number" 
         														maxFractionDigits = "3" value = "${product.price}" /> ₫
															
														</h5>
														<p>${product.description}</p>
														<c:url var="url" value="/addcart">
																	<c:param name="${params}" value="${argument}"></c:param>
																	<c:param name="sort" value="${sortby}"></c:param>
																	<c:param name="add" value="${product.idProduct }"></c:param>
								
																	
														</c:url>
														<a  class="btn hvr-hover" href="${url}" >Add to Cart</a>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
						</c:if>
					</div>
					<!-- Phân trang -->
<!-- 					<div class="paging">

						<a><i class="fa fa-arrow-left" aria-hidden="true"></i></a> <a
							class="btn hvr-hover">1</a> <a class="btn hvr-hover">2</a> <a
							class="btn hvr-hover">3</a> <a><i class="fa fa-arrow-right"
							aria-hidden="true"></i></a>
					</div> -->
					<!--  -->
				</div>
				<div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
					<div class="product-categori">
						<div class="search-product">
							<form action="SearchProduct">
								<input class="form-control" placeholder="Search here..." name="seach-product"
									type="text">
								<button type="submit">
									<i class="fa fa-search"></i>
								</button>
							</form>
						</div>
						<div class="filter-sidebar-left">
							<div class="title-left">
								<h3>Danh mục</h3>
							</div>
							<div
								class="list-group list-group-collapse list-group-sm list-group-tree"
								id="list-group-men" data-children=".sub-men">
								<c:forEach var="category" items="${listCategory}"> 
								<div class="list-group-collapse sub-men">
								<c:url var="urlSearch" value="/SearchProduct">
									<c:param name="seach-category" value="${category.getIdCate()}"></c:param>
								</c:url>
									<a class="list-group-item list-group-item-action"
										href="${urlSearch}" 
										>${category.getNameCate()}  <small
										class="text-muted">(${category.getNumOfProduct()})</small>
									</a>
								</div>
								</c:forEach>
<!-- 								<div class="list-group-collapse sub-men">
									<a class="list-group-item list-group-item-action"
										href="#sub-men2" data-toggle="collapse" aria-expanded="false"
										aria-controls="sub-men2">Vegetables <small
										class="text-muted">(50)</small>
									</a>
									<div class="collapse" id="sub-men2"
										data-parent="#list-group-men">
										<div class="list-group">
											<a href="#" class="list-group-item list-group-item-action">Vegetables
												1 <small class="text-muted">(10)</small>
											</a> <a href="#" class="list-group-item list-group-item-action">Vegetables
												2 <small class="text-muted">(20)</small>
											</a> <a href="#" class="list-group-item list-group-item-action">Vegetables
												3 <small class="text-muted">(20)</small>
											</a>
										</div>
									</div>
								</div>
								<a href="#" class="list-group-item list-group-item-action">
									Grocery <small class="text-muted">(150) </small>
								</a> <a href="#" class="list-group-item list-group-item-action">
									Grocery <small class="text-muted">(11)</small>
								</a> <a href="#" class="list-group-item list-group-item-action">
									Grocery <small class="text-muted">(22)</small>
								</a> -->
							</div>
						</div>
						<div class="filter-price-left">
							<div class="title-left">
								<h3>Giá</h3>
							</div>
							<div class="price-box-slider">
								<div id="slider-range"></div>
								<form action="SearchProduct">
									<p>
									<input type="text" id="amount" readonly
										style="border: 0; color: #fbb714; font-weight: bold;" name="price-filter">
									<button class="btn hvr-hover" type="submit">Lọc</button>
									</p>
									</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Shop Page -->


	<jsp:include page="footer.jsp"></jsp:include>

	<script>
	
/* 	var productDetails = document.querySelectorAll('.products-single ');
	
	var urlProducts = document.querySelectorAll('#url-product');

	console.log(urlProducts);
	
	for(var y =0;y<urlProducts.length;y++){
		console.log(urlProducts[y].value);
	}
	
	for(var y =0;y<productDetails.length;y++ ){
		productDetails[y].onclick= function() {
			location.href = urlProducts[y].value.toString();
		}
	
	
	*/
	var addCartBtn = document.querySelectorAll('.mask-icon .cart, .mask-icon ul');
	for(var acb of addCartBtn ){
		acb.addEventListener('click', function (event) {
	        event.stopPropagation();
			})
	}
	
	function showDetail(url){
		location.href=url;
	}		
	
		
	</script>
	<script>
	var $filters = $("input:radio[name='brand'],input:radio[name=team]").prop('checked', false); // start all checked
	var $categoryContent = $('#CategoryContent li');
	$filters.click(function() {
	    // if any of the checkboxes for brand or team are checked, you want to show LIs containing their value, and you want to hide all the rest.
	    $categoryContent.hide();
	    $filters.filter(':checked').each(function(i, el) {
	        $categoryContent.filter(':contains(' + el.value + ')').show();
	    });
	});

	function showProducts(minPrice, maxPrice) {
	    $("#products li").hide().filter(function() {
	        var price = parseInt($(this).data("price"), 10);
	        return price >= minPrice && price <= maxPrice;
	    }).show();
	}

	$(function() {
	    var options = {
	        range: true,
	        min: 1000,
	        max: 500000,
	        values: [1000, 250000],
	        slide: function(event, ui) {
	            var min = ui.values[0],
	                max = ui.values[1];

	            $("#amount").val( min +"₫"+ " - " + max+"₫");
	            showProducts(min, max);
	        }
	    }, min, max;

	    $("#slider-range").slider(options);

	    min = $("#slider-range").slider("values", 0);
	    max = $("#slider-range").slider("values", 1);

	    $("#amount").val( min +"₫"+ " - " + max+"₫");

	    showProducts(min, max);
	});
	//Rút gọn tiêu đề
	 var title = document.querySelectorAll('.why-text h4');
		for(t of title){
		var x = t.innerHTML.toString();
		
		if(x.length >34){
			t.innerHTML=x.substring(0,30)+" ...";
		}
	}
	</script>
	 <!-- ALL JS FILES -->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- ALL PLUGINS -->
    <script src="./js/bootsnav.js"></script>
    <script src="js/jquery.superslides.min.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <script src="js/inewsticker.js"></script>
    <script src="js/images-loded.min.js"></script>
    <script src="js/isotope.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/baguetteBox.min.js"></script>
    <script src="js/form-validator.min.js"></script>
    <script src="js/contact-form-script.js"></script>
    <script src="js/custom.js"></script>
    <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
</body>

</html>