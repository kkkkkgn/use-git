<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.time.LocalDate"%>
<%
    LocalDate currentDate = LocalDate.now();
    int currentYear = currentDate.getYear();
    int currentMonth = currentDate.getMonthValue();
    int year = 0;
    int month = 0;
    year = (year != 0) ? year : currentYear; // 기본값은 현재 년도
    month = (month != 0) ? month : currentMonth; // 기본값은 현재 월

    LocalDate startCalendar = LocalDate.of(year, month, 1);
    LocalDate endCalendar = LocalDate.of(year, month, startCalendar.lengthOfMonth());
    int startDayOfWeek = startCalendar.getDayOfWeek().getValue();
    int endDay = endCalendar.getDayOfWeek().getValue();

    StringBuilder strCalendar = new StringBuilder();
    strCalendar.append("<table border='0' cellspacing='0' id='tablearea'>");
//     strCalendar.append("<caption>");
//     strCalendar.append(year).append("년").append(month).append("월");
//     strCalendar.append("</caption>");
    strCalendar.append("<thead><tr align='center'>");

    for (int thDate = 0; thDate <= 6; thDate++) {
        if (thDate == 0) {
            strCalendar.append("<th>일</th>");
        } else if (thDate == 1) {
            strCalendar.append("<th>월</th>");
        } else if (thDate == 2) {
            strCalendar.append("<th>화</th>");
        } else if (thDate == 3) {
            strCalendar.append("<th>수</th>");
        } else if (thDate == 4) {
            strCalendar.append("<th>목</th>");
        } else if (thDate == 5) {
            strCalendar.append("<th>금</th>");
        } else {
            strCalendar.append("<th>토</th>");
        }
    }

    strCalendar.append("</tr></thead><tbody>");
    strCalendar.append("<tr>");

    for (int i = 1; i < startDayOfWeek; i++) {
        strCalendar.append("<td></td>");
    }
    for (int i = 1, n = startDayOfWeek; i <= endCalendar.getDayOfMonth(); i++, n++) {
        if (n % 7 == 1) {
            strCalendar.append("<tr>");
        }

        // 오늘 이전 날짜 처리
        String cellClass = (LocalDate.of(year, month, i).isBefore(currentDate)) ? "past-day" : "";

        strCalendar.append("<td class='").append(cellClass).append("'>").append(i).append("</td>");
        if (n % 7 == 0) {
            strCalendar.append("</tr>");
        }
    }

    for (int i = 0; i < 7 - endDay; i++) {
        if (endDay == 0) {
            continue;
        }
        strCalendar.append("<td></td>");
    }

    strCalendar.append("</tbody></table>");
%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Trip Table</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <style>
		#plan-lists {
            overflow: auto;
            margin: 10px 0;
		}
        #region select{
            width: 45%;
            height: 38px;
            border-radius: 5px;
        }
        .form-text {
            width: 100px;
            height: 38px;
        }
        .circle {
        	background-image: url(../img/add.png);
            background-repeat: no-repeat;
            background-size: contain;
            width: 12px;
            height: 12px;
            display: block;
        }
        .table td {
          text-align: center;
        }
        </style>
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/tripplan.css" rel="stylesheet" />
        
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-write bg-write">
                <div class="container px-5">
                    <i class="arrow-down"></i>
                    <a class="navbar-brand" href="index.html">Trip Table</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="about.html">이용안내</a></li>
                            <li class="nav-item"><a class="nav-link" href="course .html">코스추천</a></li>
                            <li class="nav-item"><a class="nav-link" href="contact.html">여행계획</a></li>
                            <li class="nav-item"><a class="nav-link" href="pricing.html">숙소예약</a></li>
                            <li class="nav-item"><a class="nav-link" href="pricing.html">마이페이지</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><span>사용자</span> 님</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="blog-home.html">My Trip</a></li>
                                    <li><a class="dropdown-item" href="blog-post.html">프로필 설정</a></li>
                                    <li><a class="dropdown-item" href="blog-home.html">회원 탈퇴</a></li>
                                    <li><a class="dropdown-item" href="blog-post.html">로그아웃</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <div class="" id="navbar-line"></div>
            <!-- Header-->
            <div class="flex h-full plan-container">
                <div class="bg-white" >
                    <div class="flex h-full">                       
                        <ul class="step-lists">
                            <div class="logo py-3 text-center mb-3"><a href="./index.html" class="text-center">Trip Table</a></div>
                            <div class="step-list">
                                <li class="w-full text-center">
                                    <a class="text-xs py-2" data-toggle="tab" href="#link1" role="tablist">STEP 1<br>지역 선택</a>
                                </li>
                                <li class="w-full text-center">
                                    <a class="text-xs py-2" data-toggle="tab" href="#link2" role="tablist">STEP 2<br>날짜 확인</a>
                                </li>
                                <li class="w-full text-center">
                                    <a class="text-xs py-2" data-toggle="tab" href="#link3" role="tablist">STEP 3<br>장소 검색</a>
                                </li>
                                <li class="w-full text-center">
                                    <a class="text-xs py-2 " data-toggle="tab" href="#link4" role="tablist">STEP 4<br>숙소 설정</a>
                                </li>
                                <li class="w-full text-center">
                                    <a class="text-xs py-2 " data-toggle="tab" href="#link5" role="tablist">STEP 5<br>상세 설정</a>
                                </li>
                            </div>
                            <div class="btn-container">
                                <li class="w-full p-2 text-center">
                                    <button type="submit" class="btn btn-info-light px-2 ">다음</button>
                                </li>
                            </div>
                        </ul>
                        
<!----------------------- SETP01 지역 선택 --> 
                        <div id="left-plan-container" class="bg-white mh-3 w-full " >
	                      	<form action="" id="region" class="flex">
	                      	<div class="w-full flex" style="justify-content: space-around;">
	                      		<input type="hidden" name="reg_id" />
	                      		<select id="reg_sido" name="reg_sido">
	                      			<option value="00">ALL</option>
	                      			<option value="01">경기도</option>
	                      			<option value="02">서울</option>
	                      		</select>
	                      		<select id="reg_sigun" name="reg_sigun">
	                      			<option value="00">ALL</option>
	                      			<option value="01">경기도</option>
	                      			<option value="02">서울</option>
	                      		</select>
                     		</div>
<!--                      		<div> -->
<!--                       			<button type="submit" class="btn btn-info-light">검색</button> -->
<!--                       		</div> -->
	                      	</form>
                            <div id="plan-lists">                              
                                <div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-body-tertiary" style="width: 100%;">
                                <a href="/" class="d-flex align-items-center flex-shrink-0 p-3 link-body-emphasis text-decoration-none border-bottom">                                
                                  <span class="fs-5 fw-semibold"></span>
                                </a>
                                <div class="list-group list-group-flush border-bottom scrollarea">
                                  <a href="#" class="list-group-item list-group-item-action active py-3 lh-sm" aria-current="true">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                      <strong class="mb-1">List group item heading</strong>
                                      <small>Wed</small>
                                    </div>
                                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                                  </a>
                                  <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                      <strong class="mb-1">List group item heading</strong>
                                      <small class="text-body-secondary">Tues</small>
                                    </div>
                                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                                  </a>
                                  <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                      <strong class="mb-1">List group item heading</strong>
                                      <small class="text-body-secondary">Mon</small>
                                    </div>
                                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                                  </a>
                            
                                  <a href="#" class="list-group-item list-group-item-action py-3 lh-sm" aria-current="true">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                      <strong class="mb-1">List group item heading</strong>
                                      <small class="text-body-secondary">Wed</small>
                                    </div>
                                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                                  </a>
                                  <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                      <strong class="mb-1">List group item heading</strong>
                                      <small class="text-body-secondary">Tues</small>
                                    </div>
                                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                                  </a>
                                  <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                      <strong class="mb-1">List group item heading</strong>
                                      <small class="text-body-secondary">Mon</small>
                                    </div>
                                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                                  </a>
                                  <a href="#" class="list-group-item list-group-item-action py-3 lh-sm" aria-current="true">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                      <strong class="mb-1">List group item heading</strong>
                                      <small class="text-body-secondary">Wed</small>
                                    </div>
                                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                                  </a>
                                  <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                      <strong class="mb-1">List group item heading</strong>
                                      <small class="text-body-secondary">Tues</small>
                                    </div>
                                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                                  </a>
                                  <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                      <strong class="mb-1">List group item heading</strong>
                                      <small class="text-body-secondary">Mon</small>
                                    </div>
                                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                                  </a>
                                  <a href="#" class="list-group-item list-group-item-action py-3 lh-sm" aria-current="true">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                      <strong class="mb-1">List group item heading</strong>
                                      <small class="text-body-secondary">Wed</small>
                                    </div>
                                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                                  </a>
                                  <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                      <strong class="mb-1">List group item heading</strong>
                                      <small class="text-body-secondary">Tues</small>
                                    </div>
                                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                                  </a>
                                  <a href="#" class="list-group-item list-group-item-action py-3 lh-sm">
                                    <div class="d-flex w-100 align-items-center justify-content-between">
                                      <strong class="mb-1">List group item heading</strong>
                                      <small class="text-body-secondary">Mon</small>
                                    </div>
                                    <div class="col-10 mb-1 small">Some placeholder content in a paragraph below the heading and date.</div>
                                  </a>
                                </div>
                              </div>
                            </div>
  						</div>
<!----------------------- SETP01 지역 선택 --> 
<!----------------------- SETP02 날짜 확인 -->                     
                        <div id="left-plan-container" class="bg-white mh-3 " >
                        <!-- 여행지 이름 -->
                            <div class="spot_name pt-2 fw-nomarl" style="font-size: 0.75rem;">춘천</div>
                            <div class="fs-6 fw-bold">민희와 함께하는 여행</div> 
                        <!-- 날짜 선택 -->
                            <div class="flex items-center justify-start w-full pl-4 py-1">
                                <div class="datepicker-wrapper">
                                    <div class="datepicker__input-container">
                                        <button class="btn btn-light trvl_day" id="">2023.12.12(화) - 2023.12.14(목)<span class="ml-2"><i class="trvl-calendar"></i></span></button>
                                    </div>
                                </div>
                                <div class="block md:hidden mt-0.5"></div>
                            </div>
                            <div class="flex flex-col">
                        <!-- 시간 설정 -->
                                <div class="text-sm py-3">여행시간 상세설정 <span id="trvl_time" class="ml-2">총 24시간 00분</span> </div>
                        <!-- 안내 문 -->
                                <div class="text-sm" id="trvl_time_help"><p>입력하신 <b>여행기간(여행지 도착 날짜, 여행지 출발 날짜)</b>이 맞는지 확인해 주시고 각 날짜의 일정 <b>시작시간</b>과<b>종료시간</b>을 현지 시간 기준으로 설정해 주세요. 기본 설정 시간은 <b>오전 10시~오후 10시 총 12시간</b>입니다.</p></div>
                        <!-- 요일 테이블 -->
                                <div class="py-3">
                                    <table id="trvl_tableColumes">
                                        <thead class="text-gray-400 bg-white">
                                            <tr>
                                                <th>일자</th>
                                                <th>요일</th>
                                                <th>시작시간</th>
                                                <th>종료시간</th>
                                            </tr>
                                        </thead>
                                        <tbody id="trvl_tablearea">
                                            <tr>
                                                <td>12/12</td>
                                                <td>화</td>
                                                <td><input class="bg-white" type="time" name="trvlStartTime" value="10:00" style="width: 105px; font-size: 0.9rem;" /></td>
                                                <td><input class="bg-white" type="time" name="trvlEndTime" value="22:00" style="width: 105px; font-size: 0.9rem;" /></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                        <!-- 시간 설정 완료 -->    
                                <div class="flex w-full">
                                    <button type="submit" class="flex btn btn-info-light items-center justify-center w-full p-2 mt-4">시간 설정 완료</button>
                                </div>

                            </div>
                        
                        </div>
<!----------------------- SETP02 날짜 확인 -->
<!----------------------- SETP03 장소 검색 -->

<!----------------------- SETP03 장소 검색 -->
<!----------------------- SETP04 숙소 설정 -->

<!----------------------- SETP04 숙소 설정 -->
<!----------------------- SETP05 상세 설정 --> 
                        <div id="left-plan-container" class="bg-white mh-3 w-full " style="width:390px;" >

                           	<!-- 인원 & 친구초대 설정 -->
                       		<div class="flex items-center justify-center w-full fs-6 py-3">
                               	<div class="d-flex gap-2 justify-content-center py-2">
							  		<span class="badge d-flex p-2 align-items-center text-bg-primary rounded-pill">
								    	<span class="px-1">인원목록</span>
								    	<a href="#"><i class="circle"></i></a>
							  		</span>
								  	<span class="badge d-flex p-2 align-items-center text-primary-emphasis bg-primary-subtle rounded-pill">
									    <span class="px-1">친구초대</span>
									    <a href="#"><i class="circle"></i></a>
								  	</span>
								  	<span class="badge d-flex p-2 align-items-center text-primary-emphasis bg-primary-subtle border border-primary-subtle rounded-pill">
									    <span class="px-1">가계부</span>
									    <a href="#"><i class="circle"></i></a>
								  	</span>
								  	<span class="badge d-flex p-2 align-items-center text-primary-emphasis bg-primary-subtle border border-primary-subtle rounded-pill">
									    <span class="px-1">준비물</span>
									    <a href="#"><i class="circle"></i></a>
								  	</span>
								</div>
                           	</div>
                           	<!-- 친구초대 -->
                           	<div class="d-flex flex-column flex-md-row gap-4 align-items-center justify-content-center">
							  <div class="list-group w-full none">
							    <label class="list-group-item d-flex gap-2">
							      <input class="form-check-input flex-shrink-0" type="checkbox" value="" checked="">
							      <span>
							        홍길동
							        <small class="d-block text-body-secondary">With support text underneath to add more detail</small>
							      </span>
							    </label>
							    <label class="list-group-item d-flex gap-2">
							      <input class="form-check-input flex-shrink-0" type="checkbox" value="">
							      <span>
							        박문수
							        <small class="d-block text-body-secondary">Some other text goes here</small>
							      </span>
							    </label>
							    <label class="list-group-item d-flex gap-2">
							      <input class="form-check-input flex-shrink-0" type="checkbox" value="">
							      <span>
							        김남길
							        <small class="d-block text-body-secondary">And we end with another snippet of text</small>
							      </span>
							    </label>
							  </div>
							</div >
							<!-- 친구초대 -->
							<!-- 가계부 -->
							<div class="d-flex flex-column flex-md-row gap-4 align-items-center justify-content-center">
								<div class="container">
				          
				                  	<!-- 입력 폼 부분 -->
				                	<div class="form-container">
					                    <div class="flex justify-center items-center gap-2">
					                    	<label for="date" style="width: 150px;">일차:</label>
					                    	<select id="date" class="custom-select mb-2 mr-sm-2" style="width: 80px;">
					                    		<option value="1 일">1 일</option>
					                    		<option value="2 일">2 일</option>
					                    	</select>
						                    <label for="amount" class="mb-2 mr-sm-2" style="width: 150px;">금액:</label>
						                    <input type="text" id="amount" class="form-control mb-2 mr-sm-2" placeholder="금액">
					                    </div>
					                    <div class="flex justify-center items-center gap-2">
						                    <label for="description" class="mb-2 mr-sm-2" style="width: 49px;">내용:</label>
						                    <input type="text" id="description" class="form-control mb-2 mr-sm-2" placeholder="비용 내용">
					                    </div>
					                    <!-- 삭제 버튼 -->
					                    <button onclick="deleteSelected()" class="btn btn-danger mb-2 mr-2" style="float: right;">선택 삭제</button>
					                    <button onclick="addExpense()" class="btn btn-primary mb-2 mr-2" style="float: right;">추가</button>
				                  	</div>
				          
				                  	<!-- 가계부 테이블 -->
				                  	<table class="table">
			                      		<thead>
		                            	<tr>
											<th class="text-center" style="width: 31px;"></th>
											<th class="text-center" style="width: 50px;">일차</th>
											<th class="text-center">내용</th>
											<th class="text-center" style="width: 100px;">금액</th>
			                          	</tr>
				                      	</thead>
				                      	<tbody id="expenseTableBody">
			                          	<!-- 여기에 비용 항목이 동적으로 추가될 예정입니다. -->
				                      	</tbody>
		                  			</table>
				
				                  	<!-- 총 금액 부분 -->
				                  	<div class="flex gap-2 justify-start items-center">
					                    <label for="people" class="mb-2 mr-sm-2" style="width: 40px;">인원:</label>
					                    <input type="number" id="people" class="form-control mb-2 mr-sm-2" placeholder="1명" min="1" value="1" style="width: 60px; height: 30px;">
					                    <label for="people" class="mb-2 mr-sm-2" style="width: 60px;">총 금액: </label>
					                    <div class="flex justify-center items-center mb-2"><span id="totalAmount" class="badge badge-success">0</span> 원</div>
				                  	</div>
				                  	<div class="total flex items-center" style="height: 38px; justify-content: space-between;">
					                    <div>인원별 금액: <span id="amountPerPerson" class="badge badge-info">0</span> 원</div>
					                    <button type="button" class="btn btn-primary mr-2" style="float: right;" onclick="calculatePerPersonAmount()">계산하기</button>
				                  	</div>
				
									<script>
				                    function addExpense() {
				                        var dateInput = document.getElementById('date');
				                        var descriptionInput = document.getElementById('description');
				                        var amountInput = document.getElementById('amount');
				                        var peopleInput = document.getElementById('people'); // 인원 입력란
				
				                        var date = dateInput.value;
				                        var description = descriptionInput.value;
				                        var amount = parseFloat(amountInput.value.replace(/,/g, '')); // 콤마 제거
				                        var people = parseInt(peopleInput.value);
				
				                        if (!date || !description || isNaN(amount) || isNaN(people) || people < 1) {
				                            alert('날짜, 내용, 금액, 인원을 모두 입력하세요.');
				                            return;
				                        }
				
				                        // 테이블에 새로운 행 추가
				                        var tableBody = document.getElementById('expenseTableBody');
				                        var newRow = tableBody.insertRow(tableBody.rows.length);
				                        var cell1 = newRow.insertCell(0);
				                        var cell2 = newRow.insertCell(1);
				                        var cell3 = newRow.insertCell(2);
				                        var cell4 = newRow.insertCell(3);
				                        var checkbox = document.createElement('input');
				                        checkbox.type = 'checkbox';
				                        cell1.appendChild(checkbox);
				                        cell2.innerHTML = date;
				                        cell3.innerHTML = description;
				                        cell4.innerHTML = formatCurrency(amount);
				
				                        // 금액 합산 업데이트
				                        updateTotalAmount(amount);
				
				                        // 입력 필드 초기화
				                        descriptionInput.value = '';
				                        amountInput.value = '';
				                    }
				
				                    function updateTotalAmount(amount) {
				                        var totalAmountElement = document.getElementById('totalAmount');
				
				                        var currentTotal = parseFloat(totalAmountElement.textContent.replace(/,/g, '')); // 콤마 제거
				                        var newTotal = currentTotal + amount;
				                        totalAmountElement.textContent = formatCurrency(newTotal);
				                    }
				
				                    function deleteSelected() {
				                        var tableBody = document.getElementById('expenseTableBody');
				                        var checkboxes = tableBody.querySelectorAll('input[type="checkbox"]:checked');
				
				                        checkboxes.forEach(function (checkbox) {
				                            var row = checkbox.closest('tr');
				                            var amountCell = row.cells[3];
				                            var amount = parseFloat(amountCell.textContent.replace(/,/g, '')); // 콤마 제거
				
				                            // 금액 합산 업데이트
				                            updateTotalAmount(-amount);
				
				                            // 선택된 행 삭제
				                            row.remove();
				                        });
				                    }
				
				                    function formatCurrency(amount) {
				                        // 천 단위로 콤마 추가
				                        return amount.toFixed(0).replace(/\d(?=(\d{3})+$)/g, '$&,') + '원';
				                    }
				
				                    // 인원별 금액 계산 및 업데이트
				                    function calculatePerPersonAmount() {
				                        var totalAmountElement = document.getElementById('totalAmount');
				                        var amountPerPersonElement = document.getElementById('amountPerPerson');
				                        var peopleInput = document.getElementById('people');
				
				                        var totalAmount = parseFloat(totalAmountElement.textContent.replace(/,/g, '')); // 콤마 제거
				                        var people = parseInt(peopleInput.value);
				
				                        if (isNaN(totalAmount) || isNaN(people) || people < 1) {
				                            alert('총 금액과 인원을 확인하세요.');
				                            return;
				                        }
				
				                        var amountPerPerson = totalAmount / people;
				                        amountPerPersonElement.textContent = formatCurrency(amountPerPerson);
				                    }
									</script>
								</div>
							</div>
							<!-- 가계부 -->
							<!-- 준비물  -->
							
							<!-- 준비물  -->
						</div>
<!----------------------- SETP05 상세 설정 -->                       
                        
                    	
                	</div>
               	</div>
                <div class="map">
                    <div class="plan-googlemap-container"></div>
                </div>
           	</div>
        </main>
        <!--달력-->
        <div class="datepicker" id="CalendarTableara">
            <div id="datepickerBG" class="fixed top-0 bottom-0 left-0 right-0 z-50 flex items-center justify-center w-screen h-full bg-black bg-opacity-75">
                <div id="datepicker" class="relative bg-white rounded-none md:rounded-lg shadow md:max-h-[90vh] overflow-y-auto overflow-x-hidden w-full h-full pt-8 p-4 md:p-12 md:w-auto md:h-auto flex flex-col justify-center items-center">
                    <div class="flex items-center justify-center w-full pt-2 bg-white md:pt-4 md:text-4xl">여행 기간이 어떻게 되시나요?</div>
                    <div class="flex flex-col items-center justify-center w-full px-2 py-1">
                        <div class="text-[9px] text-black md:text-sm underline-offset-4 underline">* 여행 일자는 <b class="">최대 10일</b>까지 설정 가능합니다.</div>
                        <div class="py-1 px-2 text-[9px] text-black md:text-sm underline-offset-4 underline">현지 여행 기간<b class="">(여행지 도착 날짜, 여행지 출발 날짜)</b>으로 입력해 주세요.</div>
                    </div>
                    <div class="flex flex-col items-center justify-center my-2"></div>
                    <div class="relative my-4">
                        <div class="datepicker__month-container">
                            <div class="datepicker__header datepicker__header--custom">
                                <div class="flex justify-center m-2 bg-white md:m-4">
                                    <div aria-label="Previous Month" class="mx-3">
                                        <span class="">&lt;</span>
                                    </div>
                                    <span class="datepicker__current-month">2023년 12월</span>
                                    <div aria-label="Next Month" class="" style="visibility: hidden;">
                                        <span class="mx-3">&gt;</span>
                                    </div>
                                </div>
								<div>
									<%=strCalendar.toString() %>
								</div>
								
                            </div>
                           
                        </div>
                    </div>
 					<div class="btn-container w-full">
						<button id="CanlenderBtn" type="submit" class="btn btn-info-light" style="float:right; margin-right:20px;">선택</button>
					</div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
        <!-- 부트스트랩 JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script type="text/javascript">
        $(document).ready(function() {
        	$('.trvl_day').on('click', function(){
        		$('#CalendarTableara').css('display','block');
        	});
        	$('.trvl_day .trvl-calendar').on('click', function(){
        		$('#CalendarTableara').css('display','block');
        	});
            $('.plan-content').css('display','none');

        	$('#datepickerBG').on('click', function (e) {
                if ($('#datepicker').is(':hover')) {
                    $('.datepicker').css('display', 'block');
                } else if ($('#CanlenderBtn').is(e.target) ) {
                    alert("click");
                    $('.datepicker').css('display', 'none');
                } else {
                    $('.datepicker').css('display', 'none');
                }
        	});
       	});
        </script>
    </body>
</html>
