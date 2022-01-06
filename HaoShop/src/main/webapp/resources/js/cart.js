/**
 * 장바구니
 */
function insertCart() {
	var m_no = $("#m_no").val();
	var p_no = $("#p_no").val();
	var pay_quantity = $("#pay_quantity").val();
	var p_size = $("#p_size").val();
	if (m_no == "Administrator") {
		swal("", "관리자 권한으로는 이용하실 수 없습니다.", "warning");
	} else if (!m_no) {
		swal("", "비회원은 장바구니를 이용하실 수 없습니다.", "error");
	} else if (pay_quantity == 0) {
		swal("", "수량을 선택해주세요", "error");
	} else {
		$.ajax({
			type : "GET",
			url : "insertCart",
			data : {
				"m_no" : m_no,
				"p_no" : p_no,
				"pay_quantity" : pay_quantity,
				"p_size" : p_size
			},
			success : function(data) {
				swal("", "장바구니에 저장되었습니다.", "success");
			}
		});
	}
}

function buyCart(p_no, m_no) {
	if (!m_no) {
		console.log('a');
	} else {
		console.log(p_no + " + " + m_no);
		window.location.href="payment";
		$.ajax({
			type : "POST",
			url : "payment",
			data : {
				"m_no" : m_no,
				"p_no" : p_no
			},
			success : function() {
				window.location.href = "payment";
			}
		});
	}
}

function delCart(p_no, m_no) {
	if (!m_no) {
		swal("", "비회원은 장바구니를 이용하실 수 없습니다.", "error")
	} else {
		$.ajax({
			type : "POST",
			url : "delCart",
			data : {
				"m_no" : m_no,
				"p_no" : p_no
			},
			success : function(data) {
				window.location.reload();
			}
		});
	}
}

function cartClear() {
	var m_no = $("#m_no").val();
	if (!m_no) {
		swal("", "비회원은 장바구니를 이용하실 수 없습니다.", "error")
	} else {
		$.ajax({
			type : "POST",
			url : "clearCart",
			data : {
				"m_no" : m_no
			},
			success : function() {
				window.location.reload();
			}
		});
	}
}

function calCart() {
	var prd_delivery = 0;
	var prd_sum = 0;
	for (i = 0; i < $("input[name=chk]").length; i++) {
		if ($("input[name=chk]")[i].checked == true) {
			prd_delivery += parseInt($("input[name=prd_delivery]")[i].value);
			prd_sum += parseInt($("input[name=prd_sum]")[i].value);
		}
	}
	document.getElementById("prd_delivery").innerHTML = numberWithCommas(prd_delivery);
	document.getElementById("prd_sum").innerHTML = numberWithCommas(prd_sum);
	document.getElementById("total").innerHTML = numberWithCommas(prd_delivery + prd_sum);
}

function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}