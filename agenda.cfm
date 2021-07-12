<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HD Street Concert Band - Agenda</title>
<link href="/cfTraining/styles/hdStreet.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="/cfTraining/script/jquery.js"></script>
<script type="text/javascript" src="/cfTraining/script/menu.js"></script>
</head>

<body>
<div id="wrapper">
  <div id="header"> <a href="#"><img src="/cfTraining/images/logo.png" alt="logo" name="logo" width="188" height="181" id="logo" /></a>
    <p id="mainTitle"><img src="/cfTraining/images/mainTitle.png" width="398" height="158" alt="HD Street Concert Band" /><span>HD Street Concert Band</span></p>
<ul>
       	<li><a href="siteMap.cfm">Site Map</a></li>
        <li><a href="contactUs.cfm">Contact us</a></li>
    </ul>
  </div>
  <div id="menu">
    <ul>
      <li><a href="index.html">Home</a></li>
      <li><a href="agenda.cfm">Agenda</a></li>
      <li><a href="#">The Band</a>
        <ul>
          <li><a href="director.cfm">The director</a></li>
          <li><a href="history.cfm">The band History</a></li>
        </ul>
      </li>
      <li><a href="wePlayForYou.cfm">We play for You</a></li>
      <li><a href="comePlayWithUs.cfm">Come play with us</a></li>
      <li><a href="news.cfm">News</a></li>
    </ul>
  </div>
  <div id="pageBody">
    <div id="calendarContent">
      <cfquery datasource="hdStreet" name="rsCurrentEvents">
        SELECT FLD_EVENTID, FLD_EVENTNAME, FLD_EVENTDATETIME, FLD_EVENTLOCATION, FLD_EVENTVENUE
        FROM TBL_EVENTS
        WHERE FLD_EVENTDATETIME >= #now()#
        ORDER BY FLD_EVENTDATETIME ASC
      </cfquery>
      <h1> Agenda</h1>
      <cfif rsCurrentEvents.recordcount EQ 0>
        <p>Sorry there are no events to display at this time</p>
      <cfelse>
        <table>
          <cfoutput query="rsCurrentEvents">
            <tr>
              <th>#dateformat(FLD_EVENTDATETIME, "mm dd yyyy")#</th>
              <td>#FLD_EVENTNAME# - #FLD_EVENTLOCATION# (#FLD_EVENTVENUE#)</td>
              <td><a href="agenda.cfm">Read More</a></td>
            </tr>
          </cfoutput>
        </table>
      </cfif>
    </div>
    <div id="calendarSideBar">
      <cfif rsCurrentEvents.recordcount EQ 0>
        <p>Sorry, there are no events to display at this time</p>
      <cfelse>
        <cfoutput>
        <h1>Next Event</h1>
          <div id="EventDetails">
            <p id="eventDate"><span id="month">#dateFormat(rsCurrentEvents.FLD_EVENTDATETIME, "mmm")#</span> <span id="days">#dateFormat(rsCurrentEvents.FLD_EVENTDATETIME, "dd")#</span></p>
            <h2>#rsCurrentEvents.FLD_EVENTNAME# - #rsCurrentEvents.FLD_EVENTLOCATION#</h2>
          </div>
          <p>#rsCurrentEvents.FLD_EVENTVENUE#</p>
          <p class="alignRight"><a href="events/20110719.html">Read More</a></p>
        </cfoutput>
      </cfif>
  </div>
  </div>
  <div id="footer">
    <p>&copy; Copyright 2011 - HD Street Concert Band</p>
  </div>
</div>
</body>
</html>
