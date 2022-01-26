var checkPWD = false;
$(document).ready(function() {
	$("#m_pwd").keyup(function() {
		$("#checkPasswd").text("");
	});
	
	$("#chk_m_pwd").keyup(function() {
		var checkText = $("#checkPasswd");
		if ($("#m_pwd").val() == "" || $("#chk_m_pwd").val() == "") {
			checkText.css("color", "red");
			checkText.text("필수정보입니다.");
			checkPWD = false;
		} else if ($("#m_pwd").val() != $("#chk_m_pwd").val()) {
			checkPWD = false;
			checkText.text("패스워드가 동일하지 않습니다.");
			checkText.css("color", "red");
		} else {
			checkPWD = true;
			checkText.text("패스워드가 동일합니다.");
			checkText.css("color", "green");
		}
	});

	$("#email_select").change(function() {
		if ($("#email_select").val() == "1") {
			$("#email_addr").val("");
			$("#email_addr").prop("disabled", false);
		} else if ($("#email_select").val() == "") {
			$("#email_addr").val("");
			$("#email_addr").prop("disabled", true);
		} else {
			$("#email_addr").val($("#email_select").val());
			$("#email_addr").prop("disabled", true);
		}
	});

})

function searchPost() {
	new daum.Postcode({
		oncomplete : function(data) {
			var fullAddr = '';
			var extraAddr = '';

			if (data.userSelectedType == 'R') {
				fullAddr = data.roadAddress;
			} else {
				fullAddr = data.jibunAddress;
			}
			if (data.userSelectedType == 'R') {
				if (data.bname !== '') {
					extraAddr += data.bname;
				}
				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')' : '');
			}
			document.getElementById('m_zipcode').value = data.zonecode;
			document.getElementById('m_faddr').value = fullAddr;
			document.getElementById('m_laddr').value = '';
		}
	}).open();
}

// 회원정보 수정
function myinfoUp() {
	var m_id = $("#m_id").val();
	var m_no = $("#m_no").val();
	var m_pwd = $("#m_pwd").val();
	var m_email = $("#email_id").val() + "@" + $("#email_addr").val();
	var m_phone = $("#NUMst").val() + "-" + $("#NUMnd").val() + "-"
			+ $("#NUMrd").val();
	var m_addr = $("#m_zipcode").val() + "*" + $("#m_faddr").val() + "*" + $("#m_laddr").val();
	var myp = $("#myp").val();
	if (checkPWD == false) {
		console.log("비밀번호 다름");
	}
	if (checkPWD == false) {
		swal("", "필수항목이 비어있습니다. 입력해주세요.", "warning");
	} else {
		swal({
			icon : "warning",
			text : "정말 수정 하시겠습니까?",
			closeOnClickOutside : false,
			closeOnEsc : false,
			buttons : [ "돌아가기", "수정 완료!" ],
		}).then(function(isConfirm) {
			if (isConfirm) {
				swal('수정 완료!', '회원정보 수정을 완료했습니다.', 'success').then(function(isConfirm) {
					$.ajax({
						type : "POST",
						url : "mypage3",
						data : {
							"m_id" : m_id,
							"m_pwd" : m_pwd,
							"m_email" : m_email,
							"m_phone" : m_phone,
							"m_addr" : m_addr,
							"myp" : myp
						},
						success : function(data) {
							console.log(m_id);
							console.log(myp);
							window.location.href = "mypage?m_no=" + m_no;
						},
						error : function(data) {
							console.log(m_id);
							console.log(myp);
						}
					});
				});
			}
		})
	}
}