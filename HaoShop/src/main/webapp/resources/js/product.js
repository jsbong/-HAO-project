function buyProduct() {
   var m_no = $("#m_no").val();
   var p_no = $("#p_no").val();
   var pay_quantity = $("#pay_quantity").val();
   var p_size = $("#p_size").val();
   var hiddenbtn = $("#hiddenbtn").val();
   var c_no0 = [0];
   if (m_no == "Administrator") {
      swal("", "관리자 권한으로는 이용하실 수 없습니다.", "warning");
   } else if (!m_no) {
      swal("", "비회원은 이용하실 수 없습니다.", "error");
   } else if (pay_quantity == 0) {
      swal("", "수량을 선택해주세요", "error");
   } else if (!p_size) {
      swal("", "사이즈를 선택해주세요", "error");
   }else {
      $.ajax({
         type : "POST",
         url : "payment",
         data : {
            "m_no" : m_no,
            "p_no" : p_no,
            "pay_quantity" : pay_quantity,
            "p_size" : p_size,
            "c_no0" : c_no0,
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
      formData.set('p_explain', CKEDITOR.instances.p_explain.getData());
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

function chking() {
   var main_name = $("#cate_main_name option:selected").val();
   var sub_name = $(".cate_sub_name.current option:selected").val();
   
   $("#cate_no").val(main_name + sub_name);
}

function main_nameChange() {
   var main_name = $("#cate_main_name option:selected").attr("data-tab");
   
   $(".cate_sub_name").removeClass("current");
   $(".cate_sub").removeClass("current");
   
   $("#"+main_name+"1").addClass("current");
   $("#"+main_name).addClass("current");
}