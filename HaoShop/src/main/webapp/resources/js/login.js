/**
 * 로그인
 */
function memberCheck() {
	var m_id=$("#m_id").val();
	var m_pwd=$("#m_pwd").val();
	if (!m_id || !m_pwd) {
		swal("", "아이디 혹은 패스워드를 입력해주세요.", "error");
	} else {
		$.ajax({
			type : "POST",
			url : "checkMember",
			data : {
				"m_id" : m_id,
				"m_pwd" : m_pwd
			}, success : function(data) {
				if (data != 0) {
					$.ajax({
						type : "POST",
						url : "login",
						data : {
							"m_id" : m_id,
							"m_pwd" : m_pwd
						}, success : function() {
							window.location.href = "main";
						}
					});
				} else {
					swal("","아이디 혹은 패스워드를 확인해주세요.","warning")
				}
			}, error : function(data) {
				console.log(data);
			}
		});
	}
}

function productCart() {
	document.frm.method="POST";
	document.frm.action="productCart";
	document.frm.submit();
}

function forgotPWView() {
	var popupX = (window.screen.width / 2) - 200;
	var popupY = (window.screen.height / 2) - 125;
	window.open("forgotPW", "비밀번호 찾기", "status = no, width = 400, height = 250, left = " + popupX + ", top = " + popupY);
}

function forgotPW() {
	var m_id=$("#m_id").val();
	var member_name=$("#member_name").val();
	$.ajax({
		type : "POST",
		url : "forgotPWChkm",
		data : {
			"m_id" : m_id,
			"m_name" : member_name
		}, success : function(data) {
			if (data != 0) {
				$.ajax({
					type : "POST",
					url : "forgotPW",
					data : {
						"m_id" : m_id,
						"m_name" : member_name
					}, success : function() {
						window.location.href = "main";
					}
				});
			} else {
				swal("", "존재하는 회원이 없습니다.", "warning");
			}
		}
	});
}

function logout() {
	$.ajax({
		type : "GET",
		url : "logout",
		data : {},
		success : function(data) {
			swal("로그아웃", "완료", "success");
			location.href="main";
		}
	});
}