<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');
if (strlen($_SESSION['etmsempid']==0)) {
  header('location:logout.php');
  } else{

  ?>
<!DOCTYPE html>
<html lang="en">
   <head>
      
      <title>Employee Task Management System||Dashboard</title>
      
      <link rel="icon" href="images/favicon.png" type="image/png">
      <!--Logo site-->
      <link rel="stylesheet" href="css/bootstrap.min.css" />
      <!-- site css -->
      <link rel="stylesheet" href="style.css" />
      <!-- responsive css -->
      <link rel="stylesheet" href="css/responsive.css" />
      <!-- color css -->
      <link rel="stylesheet" href="css/colors.css" />
      <!-- select bootstrap -->
      <link rel="stylesheet" href="css/bootstrap-select.css" />
      <!-- scrollbar css -->
      <link rel="stylesheet" href="css/perfect-scrollbar.css" />
      <!-- custom css -->
      <link rel="stylesheet" href="css/custom.css" />
      
   </head>
   <body class="dashboard dashboard_1">
      <div class="full_container">
         <div class="inner_container">
            <!-- Sidebar  -->
          <?php include_once('includes/sidebar.php');?>
            <!-- end sidebar -->
            <!-- right content -->
            <div id="content">
               <!-- topbar -->
             <?php include_once('includes/header.php');?>
               <!-- end topbar -->
               
               <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/calendar2.css">
  <title>Interactive Calendar</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f4f4f4;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .container {
      display: flex;
      max-width: 800px;
      width: 100%;
      background: white;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      overflow: hidden;
    }
    .calendar-base {
      flex: 2;
      padding: 20px;
    }
    .calendar-left {
      flex: 1;
      background: #f7f9fc;
      padding: 20px;
      border-left: 1px solid #ddd;
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    .year {
      text-align: center;
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 10px;
    }
    .triangle-left, .triangle-right {
      display: inline-block;
      cursor: pointer;
    }
    .triangle-left::before {
      content: '◀';
    }
    .triangle-right::before {
      content: '▶';
    }
    .months {
      display: grid;
      grid-template-columns: repeat(12, 1fr);
      text-align: center;
      gap: 5px;
    }
    .month-hover, .month-color {
      cursor: pointer;
      padding: 5px;
      border-radius: 4px;
    }
    .month-hover:hover {
      background: #e0e0e0;
    }
    .month-color {
      background: #007bff;
      color: white;
    }
    .days {
      margin: 20px 0 10px;
      font-size: 14px;
      text-align: center;
      display: grid;
      grid-template-columns: repeat(7, 1fr);
    }
    .num-dates {
      display: grid;
      grid-template-columns: repeat(7, 1fr);
      gap: 5px;
    }
    .num-dates span {
      text-align: center;
      padding: 5px;
      cursor: pointer;
      border-radius: 4px;
    }
    .num-dates span:hover {
      background: #e0e0e0;
    }
    .grey {
      color: #bbb;
    }
    .active-day {
      background: #007bff;
      color: white;
    }
    .num-date {
      font-size: 48px;
      font-weight: bold;
    }
    .day {
      font-size: 20px;
      color: #555;
      margin: 10px 0;
    }
    .current-events ul {
      list-style: none;
      padding: 0;
      margin: 10px 0;
    }
    .current-events ul li {
      margin: 5px 0;
    }
    .add-event {
      background: #007bff;
      color: white;
      padding: 10px 20px;
      border-radius: 4px;
      cursor: pointer;
      text-align: center;
    }
    .add-event:hover {
      background: #0056b3;
    }
  </style>
</head>
<body>
  <div class="page_title">
    <h2>Calendar Task</h2>
  </div>
  <div class="container">
    <div class="calendar-base">
      
      
      <div class="year" id="year"></div>
      <div class="triangle-left" onclick="prevMonth()"></div>
      <div class="triangle-right" onclick="nextMonth()"></div>
      <div class="months" id="months">
        <!-- Months dynamically populated -->
      </div>
      <hr class="month-line">
      <div class="days">
      <span>SUN</span>
      <span>MON</span>
      <span>TUE</span>
      <span>WED</span>
      <span>THU</span>
      <span>FRI</span>
      <span>SAT</span>
      </div>
      <div class="num-dates" id="num-dates"></div>
    </div>
    
    <div class="calendar-left">
      <div class="num-date" id="selected-date"></div>
      <div class="day" id="selected-day"></div>
      <div class="current-events">
        Current Events
        <br/>
        <ul id="events-list"></ul>
        <span class="posts">See post events</span>
      </div>
      <hr class="event-line">
      <div class="add-event" onclick="addEvent()">+ Add Event</div>
    </div>
  </div>
  <script>
    const today = new Date();
    let currentMonth = today.getMonth();
    let currentYear = today.getFullYear();
    const months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    const events = {};

    function populateCalendar(month, year) {
      document.getElementById('year').textContent = year;
      document.getElementById('months').innerHTML = months.map((m, i) =>
        `<span class="${i === month ? 'month-color' : 'month-hover'}" onclick="changeMonth(${i})">${m}</span>`
      ).join('');

      const firstDay = new Date(year, month).getDay();
      const daysInMonth = new Date(year, month + 1, 0).getDate();
      const prevDays = new Date(year, month, 0).getDate();

      const dates = [];
      for (let i = firstDay - 1; i >= 0; i--) {
        dates.push(`<span class="grey">${prevDays - i}</span>`);
      }
      for (let i = 1; i <= daysInMonth; i++) {
        const isToday = i === today.getDate() && month === today.getMonth() && year === today.getFullYear();
        dates.push(`<span class="${isToday ? 'active-day' : ''}" onclick="selectDate(${i})">${i}</span>`);
      }
      const nextDays = 42 - dates.length;
      for (let i = 1; i <= nextDays; i++) {
        dates.push(`<span class="grey">${i}</span>`);
      }

      document.getElementById('num-dates').innerHTML = dates.join('');
      selectDate(today.getDate());
    }

    function prevMonth() {
      currentMonth = (currentMonth - 1 + 12) % 12;
      if (currentMonth === 11) currentYear--;
      populateCalendar(currentMonth, currentYear);
    }

    function nextMonth() {
      currentMonth = (currentMonth + 1) % 12;
      if (currentMonth === 0) currentYear++;
      populateCalendar(currentMonth, currentYear);
    }

    function changeMonth(month) {
      currentMonth = month;
      populateCalendar(currentMonth, currentYear);
    }

    function selectDate(date) {
      const selectedDate = new Date(currentYear, currentMonth, date);
      document.getElementById('selected-date').textContent = date;
      document.getElementById('selected-day').textContent = selectedDate.toLocaleDateString('en-US', { weekday: 'long' });
      document.getElementById('events-list').innerHTML = events[selectedDate.toDateString()] || '<li>No events</li>';
    }

    function addEvent() {
      const eventName = prompt('Enter event name:');
      if (eventName) {
        const selectedDate = new Date(currentYear, currentMonth, document.getElementById('selected-date').textContent);
        const dateString = selectedDate.toDateString();
        if (!events[dateString]) events[dateString] = [];
        events[dateString].push(`<li>${eventName}</li>`);
        selectDate(selectedDate.getDate());
      }
    }

    populateCalendar(currentMonth, currentYear);
  </script>
</body>
</html>


            </div>
         </div>
      </div>
      <!-- jQuery -->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <!-- wow animation -->
      <script src="js/animate.js"></script>
      <!-- select country -->
      <script src="js/bootstrap-select.js"></script>
      <!-- owl carousel -->
      <script src="js/owl.carousel.js"></script> 
      <!-- chart js -->
      <script src="js/Chart.min.js"></script>
      <script src="js/Chart.bundle.min.js"></script>
      <script src="js/utils.js"></script>
      <script src="js/analyser.js"></script>
      <!-- nice scrollbar -->
      <script src="js/perfect-scrollbar.min.js"></script>
      <script>
         var ps = new PerfectScrollbar('#sidebar');
      </script>
      <!-- custom js -->
      <script src="js/custom.js"></script>
      <script src="js/chart_custom_style1.js"></script>
   </body>
</html><?php } ?>