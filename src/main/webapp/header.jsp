<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<!-- Start Main Top -->
<div>
	<div id="toast"></div>
	<div class="main-top">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<div class="custom-select-box">
						<!--     <select id="basic" class="selectpicker show-tick form-control" data-placeholder="$ USD">
							<option >D VND</a></option>
							<option >$ USD</option>
						</select>  -->
						<%-- 					<div class="select-language">
						<c:if test="${lang=='vn' || lang==null}">
							<a href="#"><img class="width-flag"
								src="images/image-flag/vietnam.png"> VN <i
								class="fa fa-caret-down" aria-hidden="true"></i></a>
						</c:if>
						<c:if test="${lang=='en'}">
							<a href="#"><img class="width-flag"
								src="images/image-flag/united-kingdom.png"> EN <i
								class="fa fa-caret-down" aria-hidden="true"></i></a>
						</c:if>

					</div>

					<ul class="subnav-language">
						<li><a href="language?lang=vn"><img class="width-flag"
								src="images/image-flag/vietnam.png"> VN</a></li>
						<li><a href="language?lang=en"><img class="width-flag"
								src="images/image-flag/united-kingdom.png"> EN</a></li>
					</ul> --%>
					</div>
					<div class="right-phone-box">
						
					</div>
					<c:if test="${user.email != null}">
						<div class="our-link">
							<ul>
								<li><a href="#"><i class="fa fa-user s_color"></i>Tài
										khoản &nbsp; ( ${user.getName()})</a></li>
								<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i>
										Giỏ hàng</a></li>

							</ul>
						</div>
					</c:if>

				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">

					<div class="login-box">
						<c:if test="${user.email == null}">
							<div class="login__btn">
								<a href="register.jsp" class="">Đăng ký</a>
							</div>
							<div class="login__btn">
								<a href="login.jsp" class="">Đăng nhập</a>
							</div>
						</c:if>
						<c:if test="${user.email!= null}">
							<%-- <div class="login__btn"> <a href="logout" class=""><fmt:message key="logout"  /></a></div> --%>
							<div class="login__btn">
								<a href="logout" onclick="signOut()" class="">Đăng xuất</a>
							</div>
						</c:if>



					</div>
					<div class="text-slid-box">
						<div id="offer-box" class="carouselTicker">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Main Top -->
	<!-- Start Main Top -->
	<header class="main-header">
		<!-- Start Navigation -->
		<nav
			class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
			<div class="container">
				<!-- Start Header Navigation -->
				<div class="navbar-header">
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbar-menu" aria-controls="navbars-rs-food"
						aria-expanded="false" aria-label="Toggle navigation">
						<i class="fa fa-bars"></i>
					</button>
					<a class="navbar-brand" href="./"><img style="width: 50px;"
						src="images/logo.png" class="logo" alt=""></a>
				</div>
				<!-- End Header Navigation -->

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<ul class="nav navbar-nav ml-auto" data-in="fadeInDown"
						data-out="fadeOutUp">
						<li class="nav-item active"><a class="nav-link"
							href="./">Trang chủ</a></li>

						<li class="nav-item"><a href="shop"
							class="nav-link dropdown-toggle">Cửa hàng</a> <!-- <ul class="dropdown-menu">
								<li><a href="shop">Sidebar Shop</a></li>
								<li><a href="shop-detail.jsp">Shop Detail</a></li>
                                <li><a href="cart.jsp">Cart</a></li>
                                <li><a href="checkout.jsp">Checkout</a></li>
                                <li><a href="my-account.jsp">My Account</a></li>
                                <li><a href="wishlist.jsp">Wishlist</a></li>
                            </ul> --></li>
						
						<li class="nav-item"><a class="nav-link" href="contact.jsp">Liên
								lạc</a></li>
					</ul>
				</div>
				<!-- /.navbar-collapse -->

				<!-- Start Atribute Navigation -->
				<div class="attr-nav">
					<ul>
						<li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
						<li class="side-menu"><a href="cart.jsp"> <i
								class="fa fa-shopping-bag"></i> <span class="badge">${cart.getNumberOfItems()}</span>
								<p>Giỏ hàng</p>
						</a></li>
					</ul>
				</div>
				<!-- End Atribute Navigation -->
			</div>
			<!-- Start Side Menu -->
			<div class="side">
				<a href="#" class="close-side"><i class="fa fa-times"></i></a>
				<li class="cart-box">
					<ul class="cart-list">
						<c:if test="${cart!=null}">
							<c:forEach var="cartItem" items="${cart.getCartItems()}">
								<li><c:url var="url" value="/shopdetail">
										<c:param name="idProduct"
											value="${cartItem.getItem().idProduct}"></c:param>
									</c:url> <a href="${url}" class="photo"><img
										src="${cartItem.getItem().linkImage}"
										class="cart-thumb" alt="" /></a>
									<h6>
										<a href="${url}">${cartItem.getItem().nameProduct}</a>
									</h6>
									<p>${cartItem.getQuantity()}x
										- <span class="price"><fmt:formatNumber type="number"
												maxFractionDigits="3" value="${cartItem.getItem().price}" />
											₫</span>
									</p></li>
							</c:forEach>
							<li class="total"><a href="cart"
								class="btn btn-default hvr-hover btn-cart">Giỏ hàng</a> <span class="float-right"><strong>Tổng :</strong> <fmt:formatNumber type="number"
										maxFractionDigits="3" value="${cart.getTotal()}" /> ₫</span></li>
						</c:if>
						<c:if test="${cart==null}">
							<li class="total"><a href="cart.jsp"
								class="btn btn-default hvr-hover btn-cart">Giỏ hàng</a> <span class="float-right"><strong>Tổng :</strong> <fmt:formatNumber type="number"
										maxFractionDigits="3" value="0" /> ₫</span></li>
						</c:if>

					</ul>
				</li>
			</div>
			<!-- End Side Menu -->
		</nav>
		<!-- End Navigation -->
	</header>
	<!-- End Main Top -->
	<!-- Start Top Search -->
	<div class="top-search"
		style="position: fixed; z-index: 10; width: 100%">
		<div class="container">
			<div class="input-group">
				<span class="input-group-addon"><i class="fa fa-search"></i></span>
				<input type="text" class="form-control"
					placeholder="Tìm kiếm"> <span
					class="input-group-addon close-search"><i
					class="fa fa-times"></i></span>
			</div>
		</div>
	</div>
</div>
