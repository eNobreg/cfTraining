<!---Get news years--->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HD Street Concert Band - News</title>
<link href="/cfTraining/styles/hdStreet.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="/cfTraining/script/jquery.js"></script>
<script type="text/javascript" src="/cfTraining/script/menu.js"></script>
</head>

<body>
<div id="wrapper">
  <div id="header"> <a href="#"><img src="../cfTraining/images/logo.png" alt="logo" name="logo" width="188" height="181" id="logo" /></a>
    <p id="mainTitle"><img src="/cfTraining/images/mainTitle.png" width="398" height="158" alt="HD Street Concert Band" /><span>HD Street Concert Band</span></p>
<ul>
       	<li><a href="siteMap.cfm">Site Map</a></li>
        <li><a href="contactUs.cfm">Contact us</a></li>
    </ul>
  </div>
  <div id="menu">
    <ul>
      <li><a href="index.html">Home</a></li>
      <li><a href="agenda.html">Agenda</a></li>
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
    <!---Output all news if no url scope newsID not present in URL--->
    <!---Get all news--->
      <cfquery datasource="hdStreet" name="rsAllNews">
        SELECT FLD_NEWSTITLE, FLD_NEWSCREATIONDATE, FLD_NEWSID
        FROM TBL_NEWS
        ORDER BY FLD_NEWSCREATIONDATE DESC
      </cfquery>
       <h1>News</h1>
      <table> <!---Output  news in a table--->
        <cfoutput query="rsAllNews">
          <tr>
            <td>#dateFormat(FLD_NEWSCREATIONDATE, 'mm dd yyyy')#</td>
            <td>#FLD_NEWSTITLE#</td>
            <td><a href="news.cfm">Read more</a></td>
          </tr>
        </cfoutput>
      </table>
    </div>
    <div id="calendarSideBar">
<h1>News archive</h1>
      <ul>
        <li><a href="#">2010</a></li>
        <li><a href="#">2009</a></li>
        <li><a href="#">2008</a></li>
        <li><a href="#">2007</a></li>
      </ul>
      <p class="alignRight">&nbsp;</p>
</div>
  </div>
  <div id="footer">
    <p>&copy; Copyright 2011 - HD Street Concert Band</p>
  </div>
</div>
</body>
</html>
