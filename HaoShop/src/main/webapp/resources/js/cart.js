/**
 * 장바구니
 */
function insertCart() {
	var m_no = $("#m_no").val();
	var p_no = $("#p_no").val();
	var pay_quantity = $("#pay_quantity").val();
	var p_size = $("#p_size").val();
	if (m_no == 1) {
		swal("", "관리자 권한으로는 이용하실 수 없습니다.", "warning");
	} else if (!m_no) {
		swal("", "비회원은 장바구니를 이용하실 수 없습니다.", "error");
	} else if (pay_quantity == 0) {
		swal("", "수량을 선택해주세요", "error");
	} else {
		swal("", p_size, "error");
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

function delCart(p_no, m_no, p_size) {
	if (!m_no) {
		swal("", "비회원은 장바구니를 이용하실 수 없습니다.", "error");
	} else {
		$.ajax({
			type : "POST",
			url : "delCart",
			data : {
				"m_no" : m_no,
				"p_no" : p_no,
				"p_size" : p_size
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
	var p_sum = 0;
	for (i = 0; i < $("input[name=chk]").length; i++) {
		if ($("input[name=chk]")[i].checked == true) {
			p_sum += parseInt($("input[name=p_sum]")[i].value);
		}
	}
	document.getElementById("p_sum").innerHTML = numberWithCommas(p_sum);
	document.getElementById("total").innerHTML = numberWithCommas(p_sum);
}

function payCart() {
	var m_no = $("#m_no").val();
	var c_no0 = [];
	for(i = 0; i < $("input[name=chk]").length; i++){
		if ($("input[name=chk]")[i].checked == true) {
			c_no0.push($("input[name=c_no]")[i].value);
		}
	}
	var hiddenbtn = $("#hiddenbtn").val();
	if ($("input[name=chk]:checkbox:checked").length == 0) {
		swal("", "결제할 상품을 선택해주세요.", "warning");
	} else {
		$.ajax({
			type : "POST",
			url : "payment",
			data : {
				"m_no" : m_no,
				"c_no0" : c_no0,
				"hiddenbtn" : hiddenbtn
			}, success : function(data) {
				console.log(data);
				window.location.href="payment";
			}
		});
	}
}

function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}