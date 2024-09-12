<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../utils/header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 상세 정보</title>
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<style>
:root {
    --primary-color: #8D6E63;
    --secondary-color: #BCAAA4;
    --background-color: #FFFFFF;
    --text-color: #3E2723;
    --accent-color: #6D4C41;
}

body {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: var(--background-color);
    color: var(--text-color);
    line-height: 1.6;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 2rem;
    background-color: var(--background-color);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
}

.form-row {
    display: flex;
    justify-content: space-between;
    margin-bottom: 1.5rem;
}

.form-group {
    width: 48%;
}

.form-group label {
    display: block;
    font-weight: bold;
    color: var(--text-color);
    margin-bottom: 0.5rem;
}

.form-group .form-control {
    width: 100%;
    padding: 0.75rem;
    border: 1px solid var(--secondary-color);
    border-radius: 5px;
    font-size: 1rem;
}

.dashboard {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

.dashboard-header {
    background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
    color: white;
    padding: 2rem;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    margin-bottom: 2rem;
    text-align: center;
}

.dashboard-title {
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 0.5rem;
}

.table th, .table td {
    padding: 1rem;
    text-align: left;
    border-bottom: 1px solid var(--secondary-color);
}

.table th {
    background-color: var(--secondary-color);
    color: var(--text-color);
    font-weight: 700;
}

.btn {
    background-color: var(--primary-color);
    color: white;
    padding: 0.7rem 1.5rem;
    border: none;
    border-radius: 5px;
    font-size: 1rem;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin-right: 0.5rem;
}

.btn:hover {
    background-color: var(--accent-color);
}

h1 {
    text-align: center;
    color: var(--primary-color);
    margin-bottom: 2rem;
}

.form-actions {
    display: flex;
    justify-content: center;
    gap: 1rem;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

    <div class="dashboard">
        <header class="dashboard-header">
            <h1 class="dashboard-title">회원관리</h1>
        </header>

        <div class="container">
            <h1>회원 상세 정보</h1>
            
            <!-- 회원 수정 폼 시작 -->
            <form action="/potato/blacklist" method="post">
                <div class="form-row">
                    <div class="form-group">
                        <label for="memberId">회원 ID</label>
                        <input type="text" id="memberId" name="id" class="form-control" value="${member.id}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="memberName">회원 이름</label>
                        <input type="text" id="memberName" name="name" class="form-control" value="${member.name}" readonly>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="memberNickName">닉네임</label>
                        <input type="text" id="memberNickName" name="nickName" class="form-control" value="${member.nickName}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="memberPhone">전화번호</label>
                        <input type="text" id="memberPhone" name="phone" class="form-control" value="${member.phone}" readonly>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="memberAddress">주소</label>
                        <input type="text" id="memberAddress" name="address" class="form-control" value="${member.address}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="memberRegidate">회원가입일</label>
                        <input type="text" id="memberRegidate" name="regidate" class="form-control"
                               value="<fmt:formatDate value='${member.regidate}' pattern='yyyy-MM-dd' />" readonly>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="memberUpdate">회원수정일</label>
                        <input type="text" id="memberUpdate" name="update_date" class="form-control"
                               value="<fmt:formatDate value='${member.update_date}' pattern='yyyy-MM-dd' />" readonly>
                    </div>
                    <div class="form-group">
                        <label for="memberStatus">회원등급</label>
                        <select id="memberStatus" name="grade" class="form-control">
                            <option value="4" ${member.grade == 4 ? 'selected' : ''}>블랙리스트</option>
                            <option value="0" ${member.grade == 0 ? 'selected' : ''}>일반회원</option>
                        </select>
                    </div>
                </div>

                <div class="form-actions">
                     <input type="hidden" name="id" value="${member.id}" />
                    <button type="submit" class="btn" id="modifyBtn">수정</button>
                    <button type="button" class="btn" onclick="window.history.back();">돌아가기</button>
                </div>
            </form>
            <!-- 회원 수정 폼 끝 -->
        </div>
    </div>
   
   <script type="text/javascript" src="../resources/js/admin.js"></script>
   
</body>
</html>
<%@ include file="../utils/footer.jsp"%>