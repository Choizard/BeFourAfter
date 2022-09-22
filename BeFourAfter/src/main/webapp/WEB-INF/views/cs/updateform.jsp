<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>/views/cs/updateform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>
<div class="container">
	<div class="p-5">
	<h3 class="text-center">문의글 수정</h3><br />
		<form action="update.do" method="post" id="updateForm">
			<input type="hidden" name="num" value="${dto.num }" />
			<div class="mb-3">
				<label for="title">제목</label>
				<input class="form-control" type="text" name="title" id="title" value="${dto.title }"/>
			</div>
			<div class="mb-3">
		        <label for="reservetype">서비스 항목</label>
		      	<select name="reserveType" id="reserveType" class="form-select">
		      		<option value="ent" ${dto.reserveType eq "ent" ? "selected" : ""}>입국 서비스 예약</option>
		      		<option value="leave" ${dto.reserveType eq "leave" ? "selected" : ""}>출국 서비스 예약</option>
		      		<option value="delivery" ${dto.reserveType eq "delivery" ? "selected" : ""}>배송 서비스 문의</option>
		      		<option value="etc" ${dto.reserveType eq "etc" ? "selected" : "" }>기타 서비스 문의</option>
		      	</select>
		    </div>
			<div class="mb-3">
				<label for="content">내용</label>
				<textarea class="form-control" style="height:300px;" name="content" id="content">${dto.content }</textarea>
			</div>
		    <div class="mb-3 form-check">
		       <input type="hidden" name="isSecret" id="isSecret"/>
		       <input class="form-check-input" type="checkbox" id="isSecretchbox"/>
		       <label for="isSecret">비밀글로 문의하기</label>
		       <p class="fw-light"><i class="bi bi-info-lg"></i>비밀글 적용 시 작성자 본인 및 관리자에게만 공개됩니다.</p>
		    </div>
			<button class="btn btn-outline-secondary" type="submit" >수정확인</button>
			<a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/cs/detail.do?num=${dto.num }">수정 취소</a>
		</form>
	</div>
</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
		$("#isSecretchbox").change(function(){
			if($("#isSecretchbox").is(":checked")){
				$("#isSecret").val('Yes');
			}else{
				$("#isSecret").val('No');
			}
		})
		
		$("#updateForm").submit(function(){
			//공란이 있으면 제출을 막는다
			let title=$("#title").val();
			let content=$("#content").val();
			let reservetype=$("#reservetype> option:selected").val();
			
			//제목이나 내용이 비어있으면
			if(title=="" || content=="" || reservetype==false){
				alert("항목을 모두 입력해주세요")
				event.preventDefault();
				return false;
			}
			
			if($("#isSecretchbox").is(":checked")==false){
				let secretCheck=confirm("비밀글 설정 해제시 게시판의 모든 이용자에게 공개됩니다.");
				if(secretCheck==false){
					event.preventDefault();
				}else{
					confirm("확인을 누르시면 제출됩니다")
				}
			}
			
			if($("#isSecretchbox").is(":checked")==true){
				let secretCheck=confirm("확인을 누르시면 제출됩니다");
				if(secretCheck==false){
					event.preventDefault();
				}
			}
			
		})
    </script>
</body>
</html>