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
    strCalendar.append("<caption>");
    strCalendar.append(year).append("년").append(month).append("월");
    strCalendar.append("</caption>");
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
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    #tablearea td, #tablearea th {
        padding: 10px;
        text-align: center;
        background-color: white;
        border: none;
        font-weight: 400;
        width: 40px;
        line-height: 2rem;
        font-size: 0.9rem;
        opacity: 1;
    }
    #tablearea th {
        font-weight: 600;
    }
    #tablearea th:first-child {
        color: #e53e30;
    }
    #tablearea th:last-child {
        color: #006f80;
    }
	#tablearea td {
        cursor: pointer;
    }
    #tablearea td:first-child {
        color: #e53e30;
    }
    #tablearea td:last-child {
        color: #006f80;
    }
    .past-day {
        color: #ccc !important;
        pointer-events: none !important; /* 클릭 이벤트 비활성화 */
    }
</style>
</head>
<body>
<%=strCalendar.toString() %>
</body>
</html>