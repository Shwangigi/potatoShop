$(document).ready(function() {
    var modal = $("#deleteModal");
    let boardNumber;
    
    // 리스트 페이지 이동
    document.getElementById('listBtn').addEventListener('click', function() {
       window.location.href = '/shop/list';
      });
    
    // 삭제 버튼 클릭 시 모달 열기
    $("#removeBtn").on("click", function() {
       boardNumber = $("input[name='board_number']").val();
       modal.modal("show");
    });
 
    // 모달의 삭제 확인 버튼 클릭 시 삭제 요청
    $("#confirmDeleteBtn").on("click", function() {
       $.ajax({
          url: "/shop/remove",
          type: "POST",
          data: { board_number: boardNumber },
          success: function() {
             alert("삭제되었습니다.");
             modal.modal("hide");
             window.location.href = '/shop/list';
          },
          error: function() {
             alert("삭제 중 오류가 발생했습니다.");
          }
       });
    });
 
    // 좋아요 버튼 클릭 시
    $("#likeBtn").on("click", function(event) {
       event.preventDefault(); // 기본 제출 방지
       let likes_board_number = $("#board_number1").val();
       let likes_member_number =  $("#member_number1").val();
       $.ajax({
          url: "/shop/update_like",
          type: "POST",
          contentType: "application/json",
          data: JSON.stringify({
		  types : '좋아요', 
		  likes_board_number: likes_board_number, 
		  likes_member_number: likes_member_number
		  }),
          success: function() {
             alert("값이 성공적으로 업데이트되었습니다.");
          },
          error: function() {
             alert("값 업데이트 중 오류가 발생했습니다.");
          }
       });
  

    });
 
    // 관심 버튼 클릭 시
    $("#interestBtn").on("click", function() {
      event.preventDefault(); // 기본 제출 방지
       let likes_board_number = $("#board_number1").val();
       let likes_member_number =  $("#member_number1").val();
       $.ajax({
          url: "/shop/update_interest",
          type: "POST",
          contentType: "application/json",
          data: JSON.stringify({
		  types : '관심', 
		  likes_board_number: likes_board_number, 
		  likes_member_number: likes_member_number
		  }),
          success: function() {
             alert("값이 성공적으로 업데이트되었습니다.");
          },
          error: function() {
             alert("값 업데이트 중 오류가 발생했습니다.");
          }
       });
    });
 
 });