<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>��ǰ ��� ��ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

	// �˻� / page �ΰ��� ��� ��� Form ������ ���� JavaScrpt �̿�  
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage)
		$("form").attr("method","POST").attr("action","/product/listProduct?menu=${param.menu}").submit();
		
	}
	//<!-- <a href="javascript:fncGetUserList('1');">�˻�</a> -->
	$(function(){
		
		$("td.ct_btn01:contains('�˻�')").on("click",function(){
			fncGetUserList(1);
		});
		
		//var prodNo = document.querySelector('#prodNumber');
		//var prodNo = document.getElementById('prodNumber');
		//let prodNo = document.getElementById('prodNumber');
		//const prodNo = document.querySelector("#prodNumber");
		//console.log(prodNo);
		
		//<a href="/product/updateProduct?prodNo=${product.prodNo }">${product.prodName }</a>
		//console.log(menu);
		
		$(".ct_list_pop td:nth-child(3)").on("click",function(){
			var prodNo = $(this).data("value");
			if(${param.menu == 'manage'}){
				$.ajax({
					url:"/product/json/updateProductView/"+prodNo,
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData, status) {
						var displayValue = "<h3>"
									+"��ǰ�� : "+JSONData.prodName+"<br/>"
									+"��ǰ������ : "+JSONData.prodDetail+"<br/>"
									+"�������� : "+JSONData.manuDate+"<br/>"
									+"���� : "+JSONData.price+"<br/>"
									+"��ǰ�̹��� : "+JSONData.fileName+"<br/>"
									+"</h3>";
							
						/* alert(displayValue); */
						$("h3").remove();
						$("#"+prodNo+"").html(displayValue);
					}
				});
				//self.location ="/product/updateProductView?prodNo="+prodNo;
			}  else {
				
				//self.location="/product/getProduct?prodNo="+prodNo;
				$.ajax({
					url:"/product/json/getProduct/"+prodNo,
					method : "GET",
					dataType :"json",
					headers : {
						"Accept" : "application/json",
						"Content-Type": "application/json"
					},
					success : function(JSONData, status){
						var displayValue = "<h3>"
									+"��ǰ�� : "+JSONData.prodName+"<br/>"
									+"��ǰ�̹��� : "+JSONData.fileName+"<br/>"
									+"��ǰ������ : "+JSONData.prodDetail+"<br/>"
									+"�������� :"+JSONData.manuDate+"<br/>"
									+"���� : "+JSONData.price+"<br/>"
									+"������� : "+JSONData.regDate+"<br/>"
									+"</h3>";
									
						$("h3").remove();
						$("#"+prodNo+"").html(displayValue);
					}
				}); 
				/*  ��ǰ��ȣ ,��ǰ��, ��ǰ�̹���, ��ǰ������, ��������,����, ������� */
			}
		});
		
		$(".ct_list_pop td:nth-child(3)").css("color","deepskyblue");
		
		$(".ct_list_pop:nth-child(4n+6)").css("background-color","whitesmoke");
		
		/*
		if(${param.menu == 'manage'}){ 
			$(".ct_list_pop td:nth-child(3)").on("click", function(){
				var prodNo = $(this).data("value");
				self.location="/product/updateProduct?prodNo="+prodNo;
			});
		}else {
			$(".ct_list_pop td:nth-child(3)").on("click", function(){
				var prodNo = $(this).data("value");
				//var prodNo = document.querySelector('#prodNumber');
				console.log(prodNo);
				self.location="/product/getProduct?prodNo="+prodNo;
			});
		}*/
	});
	
</script>

</head>

<body bgcolor="#ffffff" text="#000000">

	<div style="width: 98%; margin-left: 10px;">

		<!-- <form name="detailForm"	action="/product/listProduct?menu=${param.menu}" method="post"> -->
		<form name="detailForm">

			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">��ǰ �����ȸ</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"
						width="12" height="37"></td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="right"><select name="searchCondition"
						class="ct_input_g" style="width: 80px">
							<option value="0"
								${!empty search.searchCondition&&search.searchCondition==0 ? "selected":"" }>��ǰNo</option>
							<option value="1"
								${!empty search.searchCondition&&search.searchCondition==1 ? "selected":"" }>��ǰ��</option>
					</select> <input type="text" name="searchKeyword"
						value="${! empty search.searchKeyword ? search.searchKeyword :""}"
				 class="ct_input_g" style="width: 200px; height: 20px">
					</td>
					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23" /></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"
									style="padding-top: 3px;">
									<!-- <a href="javascript:fncGetUserList('1');">�˻�</a> -->
									�˻�
									</td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">��ü ${resultPage.totalCount }�Ǽ�, ����
						${resultPage.currentPage } ������</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">��ǰ��</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">�����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">�������</td>
				</tr>
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>

				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
					<c:set var="i" value="${i+1}" />
					<tr class="ct_list_pop">
						<td align="center">${i}</td>
						<td></td>
						<td align="left" id="prodNumber" data-value="${product.prodNo}">
						<c:choose>
								<c:when test="${param.menu eq 'manage'}">
								<!--<a href="/product/updateProduct?prodNo=${product.prodNo }">${product.prodName }</a>-->
									${product.prodName}									
								</c:when>
								
								<c:otherwise>
									<!-- <a href="/product/getProduct?prodNo=${product.prodNo}"></a> -->
									${product.prodName}
						</c:otherwise>
								
							</c:choose></td>
						<td></td>
						<td align="left">${product.price}</td>
						<td></td>
						<td align="left">${product.regDate}</td>
						<td></td>
						<td align="left">${product.proTranCode}</td>
					</tr>
					<tr>
						<td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
					</tr>
				</c:forEach>
			</table>

			<!-- PageNavigation Start... -->
			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td align="center"><input type="hidden" id="currentPage"
						name="currentPage" value="" />
		 <jsp:include page="../common/pageNavigator.jsp" /></td>
				</tr>
			</table>
			<!-- PageNavigation End... -->
		</form>
	</div>

</body>
</html>