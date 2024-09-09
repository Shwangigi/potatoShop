
function openModal(id) {
    $.ajax({
        url: '/potato/admin/memberList',  // 서버로 요청 보낼 URL
        method: 'GET',
        data: { id: id },  // 전달할 파라미터 (id)
        success: function(response) {
            if (response.status === "success") {
                // 성공적으로 데이터를 받았을 경우 모달 창에 데이터 표시
                $('#modalContent').html("회원명: " + response.member.name);
            } else {
                // 에러 메시지를 모달 창에 표시
                $('#modalContent').html(response.message);
            }
            $('#myModal').modal('show'); // 모달 창 띄우기
        },
        error: function(error) {
            alert("오류가 발생했습니다.");
        }
    });
}