<!---Get page content for fld_pageID = 5--->
<cfquery datasource="hdStreet" name="rsPage">
  SELECT FLD_PAGETITLE, FLD_PAGECONTENT
  FROM TBL_PAGES
  WHERE FLD_PAGEID = 5 AND FLD_PAGEISACTIVE = 1
</cfquery>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>HD Street Concert Band - Site Map</title>
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
      <li><a href="index.cfm">Home</a></li>
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
  <!---Erase from here--->
    <cfoutput>
        <h1>#rsPage.FLD_PAGETITLE#</h1>
        #rsPage.FLD_PAGECONTENT#
    </cfoutput>
  </div>
  <div id="footer">
    <p>&copy; Copyright 2011 - HD Street Concert Band</p>
  </div>
</div>
</body>
</html>
