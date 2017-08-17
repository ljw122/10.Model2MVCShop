<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- root���� ���� --%>
<%-- ����ȭ�� / ������ȭ�� �ΰ��� �и� --%>

<c:set var="menu" value="${!empty param.menu ? param.menu : \"search\" }"/>

<html>
<head>
<!-- 	<title>��ǰ �����ȸ</title> -->	

	<link rel="stylesheet" href="../css/admin.css" type="text/css">
	
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		function fncGetList(currentPage){
			$('#currentPage').val(currentPage);
			$('form').attr('method','post').attr('action','listProduct?menu=${menu}').submit();
		}
		function fncOrderList(orderCondition, orderOption){
			$('#orderCondition').val(orderCondition);
			$('#orderOption').val(orderOption);
			fncGetList(1);
		}
		
		$(function(){
			
			var orderOption = $('input:hidden[name="orderOption"]').val();
			var orderCondition = $('input:hidden[name="orderCondition"]').val();
			
			$('.ct_list_pop:nth-child(4n+4)').css('background-color','rgb(220, 245, 245)');
			
			$('select[name="searchCondition"]').bind('change',function(){
				
				$('input:text').val('');

				if($(this).val()==2){

					$('span').replaceWith(
						'<span>'
							+'<input type="text" name="searchKeyword" value="${search.searchKeyword}"'
								+'class="ct_input_g" style="width:65px; height:19px" />&nbsp;�̻� &nbsp;'
							+'<input type="text" name="searchKeyword2" value="${search.searchKeyword2}"'
								+'class="ct_input_g" style="width:65px; height:19px" />&nbsp;����'
						+'</span>'
					);
				}else{
					$('span').replaceWith(
						'<span>'
							+'<input type="text" name="searchKeyword" value="${search.searchKeyword}"'
								+'class="ct_input_g" style="width:200px; height:19px" />'
						+'</span>'
					);

				}
					
			});
			
			$('.ct_list_b:contains("��ǰ��")').bind('click',function(){
				if(orderCondition == 1 && orderOption == 'ASC'){
					fncOrderList(1, 'DESC');
				}else{
					fncOrderList(1, 'ASC');
				}
			});
			
			$('.ct_list_b:contains("����")').bind('click',function(){
				if(orderCondition == 2 && orderOption == 'ASC'){
					fncOrderList(2, 'DESC');
				}else{
					fncOrderList(2, 'ASC');
				}
			});
			
			$('input:checkbox[name="stockView"]').bind('change',function(){
				fncGetList(1);
			});
		});
		
		$(function(){
			$('input:text').bind('keydown',function(event){
				if(event.keyCode == '13'){
					event.preventDefault();
					if($('select[name="searchCondition"]').val()==2){
						if( ($('input:text[name="searchKeyword"]') != null && !$.isNumeric($('input:text[name="searchKeyword"]').val()) )
								|| ( $('input:text[name="searchKeyword2"]') != null && !$.isNumeric($('input:text[name="searchKeyword2"]').val()) ) ){
							alert('���� �˻��� ���ڷθ� �����մϴ�!');
							$('input:text').val('');
							return;
						}
					}
					fncGetList(1);
				}
			});
			
			$('.ct_btn01:contains("�˻�")').bind('click',function(){
				if($('select[name="searchCondition"]').val()==2){
					if( ($('input:text[name="searchKeyword"]') != null && !$.isNumeric($('input:text[name="searchKeyword"]').val()) )
							|| ( $('input:text[name="searchKeyword2"]') != null && !$.isNumeric($('input:text[name="searchKeyword2"]').val()) ) ){
						alert('���� �˻��� ���ڷθ� �����մϴ�!');
						$('input:text').val('');
						return;
					}
				}
				fncGetList(1);
			});
		});
		
		$(function(){
			$('h4').bind('click',function(){
				self.location = 'getProduct?menu=${menu}&prodNo='+$('input:hidden[name="'+$(this).text().trim()+'"]').val();
			});
		});
		
		
	</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width:98%; margin-left:10px;">

<form name="detailForm">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="../images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="../images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
						��ǰ ${menu=='manage' ? "����" : "�����ȸ" }
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="../images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>		
		<td align="left">
			<c:if test="${menu=='search' }">
				<input type="checkbox" name="stockView" ${search.stockView ? "checked=\"checked\"" : "" }
						class="ct_input_g" height="19"/>���� ��ǰ ����
			</c:if>
		</td>
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px">
				<option value="1" ${!empty search.searchCondition && search.searchCondition==1 ? "selected" : ""} >��ǰ��</option>
				<option value="2" ${!empty search.searchCondition && search.searchCondition==2 ? "selected" : ""} >��ǰ����</option>
			</select>
			<span>
				<c:if test="${search.searchCondition == '1'}">
					<input type="text" name="searchKeyword" value="${search.searchKeyword}"
						class="ct_input_g" style="width:200px; height:19px" />
				</c:if>
				<c:if test="${search.searchCondition == '2'}">
					<input type="text" name="searchKeyword" value="${search.searchKeyword}"
						class="ct_input_g" style="width:65px; height:19px" />&nbsp;�̻�&nbsp;
					<input type="text" name="searchKeyword2" value="${search.searchKeyword2}"
						class="ct_input_g" style="width:65px; height:19px" />&nbsp;����
				</c:if>					
			</span>
		</td>
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="../images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="../images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						�˻�
					</td>
					<td width="14" height="23">
						<img src="../images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td colspan="11" >��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="70">No</td>
		<td class="ct_line02">
			<input type="hidden" id="orderCondition" name="orderCondition" value="${!empty search.orderCondition? search.orderCondition : '' }"/>
			<input type="hidden" id="orderOption" name="orderOption" value="${!empty search.orderOption? search.orderOption : '' }"/>
		</td>
		<td class="ct_list_b" width="150">��ǰ��&nbsp;
			${!empty search.orderCondition && search.orderCondition=='1' ? (search.orderOption=='ASC'? "��":"��") : "-" }
 		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="100">����&nbsp;
			${!empty search.orderCondition && search.orderCondition=='2' ? (search.orderOption=='ASC'? "��":"��") : "-" }
 		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">${menu=='manage' ? "�����":"��ǰ �� ����"}</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">${menu=='manage' ? "��������":"�������"}</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
		

	<!-- ���⼭ for�� ���� pageSize ���� -->
	<c:set var="i" value="${resultPage.totalCount- (resultPage.currentPage-1)*resultPage.pageSize + 1 }"/>
	<c:forEach var="product" items="${list}">
		<c:set var="i" value="${i-1}"/>
		<tr class="ct_list_pop">
			<td align="center">
				${i }
			</td>
			<td></td>
					
			<td align="left">
				<c:choose>
					<c:when test="${empty product.proTranCode || menu=='manage' }">
						<h4>
							<input type="hidden" name="${product.prodName}" value="${product.prodNo}">
							${product.prodName}
						</h4>
					</c:when>
					<c:otherwise>
						${product.prodName }
					</c:otherwise>
				</c:choose>
				
			</td>
			
			<td></td>
			<td align="left">${product.price}</td>
			<td></td>
			<td align="left">${menu=='manage'? product.regDate : product.prodDetail }</td>
			<td></td>
			<td align="left">
			<c:choose>
				<c:when test="${menu=='manage' }">
					${product.stock }
				</c:when>
				<c:otherwise>
					${product.stock==0 ? "������" : "�Ǹ���" }
				</c:otherwise>
			</c:choose>
			</td>	
		</tr>
		<tr>
			<td colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>	
	</c:forEach>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value="1"/>
			<jsp:include page="../common/pageNavigator.jsp"/>
    	</td>
	</tr>
</table>
<!-- ������ Navigator �� -->

</form>

</div>
</body>
</html>