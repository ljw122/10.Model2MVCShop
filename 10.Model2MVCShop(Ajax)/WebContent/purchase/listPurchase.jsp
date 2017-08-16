<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- root���� ���� --%>

<html>
<head>
	<title>���� �����ȸ</title>
	
	<link rel="stylesheet" href="../css/admin.css" type="text/css">
	
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		function fncGetList(currentPage){
			$("#currentPage").val(currentPage);
			$('form').attr('method','post').attr('action','listPurchase?searchCondition=${user.userId}&searchKeyword=purchaseList').submit();
		}
		
		$(function(){
			$('.ct_list_pop:nth-child(4n+4)').css('background-color','rgb(220, 245, 245)');
		});
		
		$(function(){
			$('.ct_list_pop td:nth-child(3) h4').bind('click',function(){
				self.location = 'getPurchase?tranNo='+$(this).find('input:hidden').val();
			});

			$('.ct_list_pop td:nth-child(11) h4').bind('click',function(){
				self.location = 'updateTranCode?tranNo='+$(this).find('input:hidden').val()+'&tranCode=3&menu=search&buyer.userId=${user.userId}';
			});

		});
		
	</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" >

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="../images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="../images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="../images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">
			��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������
		</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="70">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="180">���Ź�ǰ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">�����</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ȭ��ȣ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��������</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	
	
	<c:set var="i" value="${resultPage.totalCount- (resultPage.currentPage-1)*resultPage.pageSize + 1}"/>
	<c:forEach var="purchase" items="${list }">
		<c:set var="i" value="${i-1 }"/>
		<tr class="ct_list_pop">
			<td align="center">${i }</td>
			<td></td>
			<td align="left">
				<h4>
					<input type="hidden" name="tranNo" value="${purchase.tranNo}">
					${purchase.purchaseProd.prodName}&nbsp;&nbsp;(���� : ${purchase.purchaseCount})
				</h4>
			</td>
			<td></td>
			<td align="left">${purchase.dlvyAddr}</td>
			<td></td>
			<td align="left">${purchase.receiverPhone}</td>
			<td></td>
			<td align="left">
			<c:choose>
				<c:when test="${empty purchase.tranCode }">
					����..
				</c:when>
				<c:when test="${purchase.tranCode=='1' }">
					���� ���ſϷ� �����Դϴ�.
				</c:when>
				<c:when test="${purchase.tranCode=='2' }">
					���� ����� �����Դϴ�.
				</c:when>
				<c:when test="${purchase.tranCode=='3' }">
					���� ��ۿϷ� �����Դϴ�.
				</c:when>
			</c:choose>
			</td>
			<td></td>
			<td align="left">
			<c:if test="${purchase.tranCode=='2' }">
				<h4>
					<input type="hidden" name="tranNo" value="${purchase.tranNo}">
					���ǵ���
				</h4>
			</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
	

</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
			<jsp:include page="../common/pageNavigator.jsp"/>
		</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>