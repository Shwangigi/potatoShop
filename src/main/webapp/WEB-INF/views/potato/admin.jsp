<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../utils/header.jsp"%>

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
	<link rel="icon" href="/potato/images/favicon.png" type="image/png">
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

.dashboard {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

.sidebar {
    width: 250px;
    background-color: var(--primary-color);
    color: white;
    padding: 2rem 1rem;
}

.sidebar-title {
    font-size: 1.5rem;
    font-weight: 700;
    margin-bottom: 2rem;
    text-align: center;
}

.sidebar-menu {
    list-style: none;
    padding: 0;
}

.sidebar-menu li {
    margin-bottom: 1rem;
}

.sidebar-menu a {
    color: white;
    text-decoration: none;
    display: flex;
    align-items: center;
    padding: 0.5rem 1rem;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.sidebar-menu a:hover {
    background-color: var(--accent-color);
}

.sidebar-menu i {
    margin-right: 0.5rem;
}

.main-content {
    flex: 1;
    padding: 2rem;
}

.dashboard-header {
    background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
    color: white;
    padding: 2rem;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    margin-bottom: 2rem;
}

.dashboard-title {
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 0.5rem;
}

.dashboard-subtitle {
    font-size: 1.2rem;
    font-weight: 300;
    opacity: 0.8;
}

.admin-info {
    background-color: rgba(255, 255, 255, 0.1);
    padding: 1rem;
    border-radius: 5px;
    font-size: 0.9rem;
    margin-top: 1rem;
}

.dashboard-stats {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1rem;
    margin-bottom: 2rem;
}

.stat-card {
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 1.5rem;
    text-align: center;
}

.stat-card-title {
    font-size: 1.2rem;
    color: var(--primary-color);
    margin-bottom: 0.5rem;
}

.stat-card-value {
    font-size: 2rem;
    font-weight: 700;
    color: var(--text-color);
}

.content-wrapper {
    display: flex;
    gap: 2rem;
}

.left-panel, .right-panel {
    flex: 1;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 2rem;
}

.section-title {
    color: var(--primary-color);
    font-size: 1.8rem;
    font-weight: 700;
    margin-bottom: 1.5rem;
    border-bottom: 2px solid var(--secondary-color);
    padding-bottom: 0.5rem;
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
}

.btn:hover {
    background-color: var(--accent-color);
}

.form-group {
    display: flex;
    align-items: center;
    margin-bottom: 1.5rem;
}

.form-control {
    flex: 1;
    padding: 0.7rem;
    border: 1px solid var(--secondary-color);
    border-radius: 5px;
    font-size: 1rem;
    margin-right: 0.5rem;
}

.table {
    width: 100%;
    border-collapse: collapse;
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

.pagination {
    display: flex;
    justify-content: center;
    list-style: none;
    padding: 0;
    margin-top: 2rem;
}

.pagination li {
    margin: 0 0.5rem;
}

.pagination a {
    color: var(--primary-color);
    text-decoration: none;
    padding: 0.5rem 1rem;
    border: 1px solid var(--primary-color);
    border-radius: 5px;
    transition: all 0.3s ease;
}

.pagination a:hover, .pagination .active a {
    background-color: var(--primary-color);
    color: white;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="dashboard">
		<header class="dashboard-header">
			<h1 class="dashboard-title">포테이토 서비스 관리 시스템</h1>
			관리자 : <span style="font-weight: bold;"><c:out
					value="${member.name}" /></span>
		</header>

		<div class="main-content">
            <div class="content-wrapper">
                <div class="left-panel">
                    <section class="section">
                        <h2 class="section-title">회원 검색</h2>
                        <form>
                            <div class="form-group">
                                <input type="text" id="searchInput" class="form-control" placeholder="회원 ID 입력">
                                <button type="submit" id="searchBtn" class="btn">검색</button>
                            </div>
                        </form>
                    </section>

					<section class="section">
						<h2 class="section-title">신고 내역</h2>
						<table class="table">
							<thead>
								<tr>
									<th>신고번호</th>
									<th>신고자</th>
									<th>대상</th>
									<th>신고날짜</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="reportVO" items="${reportList}">
									<tr>
										<td><c:out value="${reportVO.report_number}" /></td>
										<td><c:out value="${reportVO.writer_id}" /></td>
										<td><c:out value="${reportVO.defendant_name}" /></td>
										<td><fmt:formatDate value="${reportVO.regidate}" pattern="yyyy년 MM월 dd일 (E) HH:mm:ss" />
										<td><button class="btn view-member"	data-id="${blacklist.report_number}">블랙</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<ul class="pagination">
							<li><a href="#">&laquo;</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>
					</section>
				</div>

				<div class="right-panel">
					<section class="section">
						<h2 class="section-title">블랙리스트 관리</h2>
						<table class="table">
							<thead>
								<tr>
									<th>ID</th>
									<th>등록일</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="blacklist" items="${black}">
									<tr>
										<td><c:out value="${blacklist.id}" /></td>
										<td><fmt:formatDate value="${blacklist.update_date}" pattern="yyyy년 MM월 dd일 (E) HH:mm:ss" /></td>
										<td><button class="btn view-member"	data-id="${blacklist.member_number}">해제</button></td>
									</tr>
									
								</c:forEach>
							</tbody>	
						</table>
						<ul class="pagination">
							<li><a href="#">&laquo;</a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>
					</section>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="../resources/js/admin.js"></script>
	

	<%@include file="../utils/footer.jsp"%>