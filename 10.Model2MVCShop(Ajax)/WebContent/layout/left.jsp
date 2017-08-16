<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
	<title>Model2 MVC Shop</title>
	
	<link href="../css/left.css" rel="stylesheet" type="text/css">
	
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		function history(){
			popWin = window.open("../history.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=yes, scrolling=yes, menubar=no, resizable=no");
		}
		
		$(function(){
			
			$("td.Depth03:contains('개인정보조회')").bind("click",function(){
				$(window.parent.frames['rightFrame'].document.location).attr("href","../user/getUser?userId=${user.userId}");
			});
	
			$("td.Depth03:contains('회원정보조회')").bind("click", function(){
				$(window.parent.frames['rightFrame'].document.location).attr("href","../user/listUser");
			});
			
			$("td.Depth03:contains('판매상품등록')").bind("click", function(){
				$(window.parent.frames['rightFrame'].document.location).attr("href","../product/addProduct");
			});

			$("td.Depth03:contains('판매상품관리')").bind("click", function(){
				$(window.parent.frames['rightFrame'].document.location).attr("href","../product/listProduct?menu=manage");
			});

			$("td.Depth03:contains('판매이력조회')").bind("click", function(){
				$(window.parent.frames['rightFrame'].document.location).attr("href","../purchase/listSale?searchKeyword=saleList");
			});

			$("td.Depth03:contains('상 품 검 색')").bind("click", function(){
				$(window.parent.frames['rightFrame'].document.location).attr("href","../product/listProduct?menu=search");
			});

			$("td.Depth03:contains('구매이력조회')").bind("click", function(){
				$(window.parent.frames['rightFrame'].document.location).attr("href","../purchase/listPurchase?searchKeyword=purchaseList&searchCondition=${user.userId}");
			});

			$("td.Depth03:contains('최근 본 상품')").bind("click", function(){
				history();
			});

		});
		
	</script>
</head>

<body background="../images/left/imgLeftBg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  >

<table width="159" border="0" cellspacing="0" cellpadding="0">

<!--menu 01 line-->
	<tr>
		<td valign="top"> 
			<table  border="0" cellspacing="0" cellpadding="0" width="159" >	
				<c:if test="${!empty user }">
				<tr>
					<td class="Depth03">
						개인정보조회
					</td>
				</tr>
				</c:if>
		
				<c:if test="${user.role=='admin' }">
				<tr>
					<td class="Depth03" >
						회원정보조회
					</td>
				</tr>
				</c:if>
				<tr>
					<td class="DepthEnd">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>


	<c:if test="${user.role=='admin' }">
<!--menu 02 line-->
	<tr>
		<td valign="top"> 
			<table  border="0" cellspacing="0" cellpadding="0" width="159">
				<tr>
					<td class="Depth03">
						판매상품등록
					</td>
				</tr>
				<tr>
					<td class="Depth03">
						판매상품관리
					</td>
				</tr>
				<tr>
					<td class="Depth03">
						판매이력조회
					</td>
				</tr>
				<tr>
					<td class="DepthEnd">&nbsp;</td>
				</tr>
			</table>
		</td>
	</tr>
	</c:if>
<!--menu 03 line-->
	<tr>
		<td valign="top">
			<table  border="0" cellspacing="0" cellpadding="0" width="159">
				<tr>
					<td class="Depth03">
						상 품 검 색
					</td>
				</tr>
				<c:if test="${!empty user }">
				<tr>
					<td class="Depth03">
						구매이력조회
					</td>
				</tr>
				</c:if>
				<tr>
					<td class="DepthEnd">&nbsp;</td>
				</tr>
				<tr>
					<td class="Depth03">
						최근 본 상품
					</td>
				</tr>
			</table>
		</td>
	</tr>

</table>
</body>
</html>