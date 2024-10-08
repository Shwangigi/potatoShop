<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="/resources/js/board_get.js"></script>
<link href="/resources/css/shop_get.css" rel="stylesheet" />
<%@ include file="../common/header.jsp"%>
<section id="article-profile">
       <a id="article-profile-link">
           <h3 class="hide">프로필</h3>
           <div class="container">
               <!-- 왼쪽 섹션 -->
               <div class="left-section">
                  <div class="profile_photo">
					<img id="img_thumb" src="${pageContext.request.contextPath}/resources/images/${member.profile_image}" alt="" 
					 width=100px height=100px>
					<span class="mask"></span>
				  </div>
                   <div id="article-profile-left">
                       <a id="nickname"  href="/potato/review">${member.nickName}</a>
                       <div id="region-name"><span>${member.address}</span></div>
                   </div>
               </div>

               <!-- 오른쪽 섹션 -->
               <div class="right-section">
                   <dl id="temperature-wrap">
                       <dt>매너온도</dt>
                       <dd class="text-color-04">
                           <span>${user.temper}°C</span>
                       </dd>
                   </dl>
                   <div class="meters">
                       <div class="bar bar-color-04" style="width: 40%;"></div>
                   </div>
               </div>
           </div>
       </a>
   </section>
	<div class="product-details">
		<div class="product-image">
			<img id="productImage" src="../resources/images/${board.photo_name}"
				alt="Product Image">
		</div>
		<div class="form-group">
			<input class="form-control" name="title"
				value='<c:out value="${ board.title }"/>' readonly="readonly" />
		</div>
		<div class="form-group">
			<input class="form-control" name="address"
				value='<c:out value="${board.board_address}"/>' readonly="readonly" />
		</div>
		<div class="form-group">
			<input class="form-control" name="status"
				value='<c:out value="${ board.status }"/>' readonly="readonly" />
		</div>
		<div class="form-group">
			<input class="form-control" name="content"
				value='<c:out value="${ board.content }"/>' readonly="readonly" />
		</div>
		<div class="form-group">
			<input class="form-control" name="price"
				value='<c:out value="${ board.price }"/>' readonly="readonly" />
		</div>
		<div class="form-group">
			
			<form id="likeForm">
				<input type="hidden" id="member_number1" name="member_number1" value="<c:out value="${ sessionScope.member_number }"/>" />
				<input type="hidden" id="board_number1" name="board_number1" value="<c:out value="${ board.board_number }"/>" />
				<c:choose> 
				<c:when test="${cart.types}==null">
				<span>
				<button id="likeBtn" class="btn btn-success" type="submit">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-suit-heart" viewBox="0 0 16 16" style="margin-right: 10px;">
	  				<path d="m8 6.236-.894-1.789c-.222-.443-.607-1.08-1.152-1.595C5.418 2.345 4.776 2 4 2 2.324 2 1 3.326 1 4.92c0 1.211.554 2.066 1.868 3.37.337.334.721.695 1.146 1.093C5.122 10.423 6.5 11.717 8 13.447c1.5-1.73 2.878-3.024 3.986-4.064.425-.398.81-.76 1.146-1.093C14.446 6.986 15 6.131 15 4.92 15 3.326 13.676 2 12 2c-.777 0-1.418.345-1.954.852-.545.515-.93 1.152-1.152 1.595zm.392 8.292a.513.513 0 0 1-.784 0c-1.601-1.902-3.05-3.262-4.243-4.381C1.3 8.208 0 6.989 0 4.92 0 2.755 1.79 1 4 1c1.6 0 2.719 1.05 3.404 2.008.26.365.458.716.596.992a7.6 7.6 0 0 1 .596-.992C9.281 2.049 10.4 1 12 1c2.21 0 4 1.755 4 3.92 0 2.069-1.3 3.288-3.365 5.227-1.193 1.12-2.642 2.48-4.243 4.38z" />
					</svg>
					<span id="likesCount" style="margin-right: 5px;"><c:out value="${ board.likes }" /></span>
				</button>
			</span>
			<span>
				<button id="interestBtn" class="btn btn-warning" type="submit">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart-plus" viewBox="0 0 16 16" style="margin-right: 10px;">
					<path d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9z" />
					<path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1zm3.915 10L3.102 4h10.796l-1.313 7zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0m7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0" />
					</svg>
					<span id="interestCount"><c:out value="${ board.interest }" /></span>
				</button>
			</span>
			</c:when>
			
			</c:choose>
			</form>
		</div>
		<div class="form-group">
			<span id="views" style="margin-right: 5px;">
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16"
					style="margin-right: 10px;">
	  		<path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0" />
	  		<path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7" />
			</svg> <c:out value="${ board.views }" /></span>
		</div>
		<c:set var="user" value="${sessionScope.member_number}" />
		<form id="setup" action="/shop/modify" method="get">
			<input type="hidden" name="board_number"
				value='<c:out value="${ board.board_number }"/>' />
			<c:choose>
				<c:when test="${user == board.writer_number}">
					<button id="modifyBtn" type="submit" class="btn btn-primary">수정</button>
					<button id="removeBtn" type="button" class="btn btn-danger"
						data-toggle="modal" data-target="#deleteModal">삭제</button>
					<button id="listBtn" type="button" class="btn btn-info">리스트</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-warning" onclick="location.href='/potato/chat?reciever=${board.writer_number}'">대화연결</button>
					<button id="listBtn" type="button" class="btn btn-info">리스트</button>
				</c:otherwise>
			</c:choose>
		</form>

		<!-- 삭제 모달 -->
		<div id="deleteModal" class="modal fade" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">삭제 확인</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>정말로 삭제하시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
						<button type="button" id="confirmDeleteBtn" class="btn btn-danger">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../common/footer.jsp"%>