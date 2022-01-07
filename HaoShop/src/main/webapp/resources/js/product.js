function buyProduct() {
	var m_no = $("#m_no").val();
	var p_no = $("#p_no").val();
	var pay_quantity = $("#pay_quantity").val();
	var p_size = $("#p_size").val();
	var hiddenbtn = $("#hiddenbtn").val();
	if (m_no == "Administrator") {
		swal("", "관리자 권한으로는 이용하실 수 없습니다.", "warning");
	} else if (!m_no) {
		swal("", "비회원은 이용하실 수 없습니다.", "error");
	} else if (pay_quantity == 0) {
		swal("", "수량을 선택해주세요", "error");
	} else {
		$.ajax({
			type : "POST",
			url : "payment",
			data : {
				"m_no" : m_no,
				"p_no" : p_no,
				"pay_quantity" : pay_quantity,
				"p_size" : p_size,
				"hiddenbtn" : hiddenbtn
			},
			success : function(data) {
				console.log(data);
				window.location.href="payment";
			}, error : function(data) {
				console.log(data);
			}
		});
	}
}

function doInsertProduct() {
	if (!cate_no) {
		swal("", "카테고리를 선택해주세요.", "error");
	} else {
		var formData = new FormData($("#fileForm")[0]);
		formData.append('p_explain', CKEDITOR.instances.p_explain.getData());
		$.ajax({
			type : "POST",
			url : "insertProduct",
			data : formData,
			processData : false,
			contentType : false,
			success : function(data) {
				swal("", "상품이 등록되었습니다.", "success")
				.then(function(isConfirm){
					location.href="prdinsert";
				});
			}, error : function(error) {
				swal("왜", cate_no, "error");
			}
		});
	}
}

function prdidChk() {
	var p_no=$("#p_no").val();
	if (!p_no) {
		swal("", "물품 번호를 입력하세요" , "error");
	} else {
		$.ajax({
			type : "POST",
			url : "prdCheckID",
			data : { "p_no" : p_no },
			dataType : "JSON",
			success : function(data) {
				if (data == 0) {
					$("#p_no").attr("disable", true);
					swal("", "사용가능한 번호입니다.", "success");
				} else if (data != 0) {
					swal("", "이미 존재하는 번호입니다.", "error");
				} else {
					swal("a", "a", "error");
				}
			}, error : function(error) {
				swal("", p_no, "error");
			}
		});
	}
}