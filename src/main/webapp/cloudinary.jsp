<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="css/style.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/custom.css">
</head>
<body>
	<form action="upload-file" method="post" enctype="multipart/form-data">
	<h1>${status}</h1>
		<div class="col-4">
			<div class="mb-3">
				<label for="formFile" class="form-label">Ảnh đại diện</label> <input
					class="form-control" required="required" name="file" type="file"
					id="formFile" accept="image/*" onchange="loadFile(0,event)">
				<img alt="" src="" class="preview-image" style="width: 100%">

			</div>
			<div class="row">
				<div class="col">
					<div class="mb-3">
						<label for="formFile1" class="form-label">Ảnh bổ sung 1</label> <input
							class="form-control" required="required" name="file" type="file"
							id="formFile1" accept="image/*" onchange="loadFile(1,event)">
						<img alt="" src="" class="preview-image" style="width: 100%">
					</div>
				</div>
				<div class="col">
					<div class="mb-3">
						<label for="formFile2" class="form-label">Ảnh bỏ sung 2</label> <input
							class="form-control" required="required" name="file" type="file"
							id="formFile2" accept="image/*" onchange="loadFile(2,event)">
						<img alt="" src="" class="preview-image" style="width: 100%">
					</div>
				</div>
			</div>
		</div>
		<input type="submit" value="Upload" />
	</form>
	<script>
		// Hien thi hinh anh
		var previews = document.querySelectorAll('.preview-image');
		var btns = document.querySelectorAll("input[type='file']");
		console.log(previews);
		console.log(btns);
		var loadFile = function(index, event) {

			previews[index].src = URL.createObjectURL(event.target.files[0]);
			btn[index].onload = function() {
				URL.revokeObjectURL(previews[index].src) // free memory
			}
		};
	</script>
</body>
</html>