<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

	<title>열어본 상품 보기</title>
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('a').bind('click',function(){
				window.close();
			});
		});
	</script>

</head>
<body>
	당신이 열어본 상품을 알고 있다
<br>
<br>

<c:forTokens var="i" items="${cookie.history.value }" delims=",">
	<a href="product/getProduct?prodNo=${i}&menu=search" target="rightFrame">${i}</a><br/>
</c:forTokens>

</body>
</html>