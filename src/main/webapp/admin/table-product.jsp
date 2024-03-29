<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="../admin/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        
        <style type="text/css">
        #datatablesSimple td:nth-child(6) a{
        		display: block;
        }
        	</style>
</head>
<body class="sb-nav-fixed">
		<jsp:include page="header.jsp"></jsp:include>
		 <div id="layoutSidenav">
		 <jsp:include page="sidebar-left.jsp"></jsp:include>
		    <div id="layoutSidenav_content">
		    <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Sản phẩm</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.jsp">Bảng điều khiển</a></li>
                            <li class="breadcrumb-item active">Sản phẩm /Bảng dữ liệu</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                <a href="add-product" class="btn btn-success"><i class="fa-solid fa-plus"></i> Thêm sản phẩm</a>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable Example
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Tên SP</th>
                                            <th>Mô tả</th>
                                            <th>Loại</th>
                                            <th>Giá (VNĐ)</th>
                                            <th>Ảnh đại diện</th>
                                              <th>Sửa</th>
                                            <th>Chọn</th>
                                          
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Tên SP</th>
                                            <th>Mô tả</th>
                                            <th>Loại</th>
                                            <th>Giá (VNĐ)</th>
                                            <th>Ảnh đại diện</th>  
                                             <th>Sửa</th>                                       
                                            <th>Chọn</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:if test="${ products.size() != 0}">
                                    <c:forEach begin="0" end="${products.size()-1}" var="i">
                                    	<tr>
                                            <td>${products.get(i).nameProduct}</td>
                                            <td>${products.get(i).description}</td>
                                            <td>${productsCate.get(products.get(i).idProduct)}</td>
                                            <td>${products.get(i).price}</td>
                                            <td><img
                                                src="${products.get(i).linkImage}"
                                                class="rounded" alt="xà lách" width="50" height="40"></td>
                                                                                  <c:url value="updateproduct" var="url">
                                                <c:param name="idProduct" value="${products.get(i).idProduct}"></c:param>  
                                                 <c:param name="nameProduct" value="${products.get(i).nameProduct}"></c:param>  
                                                 <c:param name="description" value="${products.get(i).description}"></c:param>      
                                                 <c:param name="price" value="${products.get(i).price}"></c:param>            
                                                  <c:param name="nameCategory" value="${productsCate.get(products.get(i).idProduct)}"></c:param>  
                                                   <c:param name="linkImage" value="${products.get(i).linkImage}"></c:param> 
                                                   <c:param name="linkList" value="${products.get(i).linkList}"></c:param>                                             
                                                	</c:url>
                                            <td >
                                            <a href="${url}"><i class="fa-solid fa-pen"></i></a></td>
                                            <td> <input type="checkbox" class="form-check-input" value=""></td>
                                        </tr>
                                    </c:forEach>
                                    </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
	 	    </div>
		 </div>
		 <script type="text/javascript">
		 var des = document.querySelectorAll('#datatablesSimple td:nth-child(2)');
		 for(var i of des){
			 var x = String(i.innerHTML);
			 if(x.length>80){
				 var newDes = x.substring(0,80);
				 i.innerHTML = newDes+"  ...";
			 }
		 }
		 </script>
		  <script type="text/javascript">  
		    function edit(name, id){
		    	  var idUpdate = document.querySelector('#idCate');
		    	  var items = document.querySelector('#datatablesSimple .tr-'+id);
		    	  var allTr = document.querySelectorAll('#datatablesSimple tr');
		    	  var btnSend = document.querySelector('#send');
		    	  var btnUpdate = document.querySelector('#update');
		    	  btnUpdate.classList.remove("hidden-btn");
		    	  btnSend.classList.add("hidden-btn");
		    	  console.log(nameUpdate);
	    	 		 for(var a of allTr){
		    		  a.classList.remove("change-background");
		    		
		    	  } 
		    	  items.classList.add("change-background");
		    	  nameUpdate.value=name;
		    	  idUpdate.value=id;
		    }
		   
		    </script>
		  <script src="https://kit.fontawesome.com/c31e7889db.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../admin/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="../admin/assets/demo/chart-area-demo.js"></script>
        <script src="../admin/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="../admin/js/datatables-simple-demo.js"></script>
</body>
</html>