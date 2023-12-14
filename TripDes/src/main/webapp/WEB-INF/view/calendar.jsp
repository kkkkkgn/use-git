<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script type="text/javascript">
       
    </script>
</head>
<body>
    <script type="text/javascript">
        // 달력 만들기 
        // 필요한 정보
        // 1. 몇년도 몇월의 해당되는 1일의 요일이 필요하다
        // 2. 몇년도 몇월의 해당되는 마지막 날짜 
        // 3. 몇년도 몇월의 해당되는 마지막 요일


        // 입력 -----------------------------------------------
        const year = 2023;
        const month = 6;
        // ---------------------------------------------------


        // Data 객체 생성  --------------------------------------
        const startCalender = new Date( year, month-1, 1 );
        //console.log(startCalender);


        const endCalender = new Date ( year, month, 1-1 );
        //console.log(endCalender);


        // 1일 요일 + 1(일: 1)
        const startDayOfWeek = startCalender.getDay() + 1;
        //console.log(startDayOfWeek);


        // 마지막 날짜 ( 한달 날짜 )
        const endDate = endCalender.getDate();
        //console.log(endDate);
        const endDay = endCalender.getDay()+1;
        //console.log(endDay);
        // ----------------------------------------------------
        


        let strCalendar = "<table border='1' cellspacing='0' id='tablearea'>";
        strCalendar += "<caption>" + year + "년" + month + "월" + "</caption>";
        strCalendar += "<thead><tr align='center'>"
        for ( let thDate = 0; thDate <= 6; thDate++ ){
            if (thDate == 0 ){
                strCalendar += "<th>"+"일"+"</th>"
            } else if ( thDate == 1 ) {
                strCalendar += "<th>"+"월"+"</th>"
            } else if ( thDate == 2 ) {
                strCalendar += "<th>"+"화"+"</th>"
            } else if ( thDate == 3 ) {
                strCalendar += "<th>"+"수"+"</th>"
            } else if ( thDate == 4 ) {
                strCalendar += "<th>"+"목"+"</th>"
            } else if ( thDate == 5 ) {
                strCalendar += "<th>"+"금"+"</th>"
            } else {
                strCalendar += "<th>"+"토"+"</th>"
            }
            
        }
        strCalendar += "</tr></thead><tbody><tr>";


        // 1일까지의 공백
        for (let i = 1; i < startDayOfWeek; i++ ){
            strCalendar += "<td></td>"
        }


        for ( let i = 1, n = startDayOfWeek; i <= endDate; i++ , n++ ){
            if ( n % 7 == 1 ){
                strCalendar += "<tr>";
            }
            strCalendar += "<td align='right'>" + i + "</td>";
            if ( n % 7 == 0 ){
                strCalendar += "</tr>";
            }
        }


        for ( let i = 0; i < 7 - endDay; i++ ){
            if ( endDay == 0 ){
                continue;
            }
            strCalendar += "<td></td>";
        }


        strCalendar += "</tbody></table>"


        document.write(strCalendar);


    </script>
</body>
</html>
