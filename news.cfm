<!---Get news years--->
<cfquery datasource="hdStreet" name="rsNewsYears">
  SELECT YEAR(FLD_NEWSCREATIONDATE) AS fld_newsYear
  FROM TBL_NEWS
  ORDER BY FLD_NEWSCREATIONDATE DESC
</cfquery>

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
      <div id="calendarContent">
        <cfif isDefined("url.newsID")>
            <cfquery datasource="hdStreet" name="rsSingleNews">
                SELECT TBL_NEWS.FLD_NEWSCONTENT, TBL_NEWS.FLD_NEWSTITLE, TBL_NEWS.FLD_NEWSCREATIONDATE, TBL_USERS.FLD_USERFIRSTNAME, TBL_USERS.FLD_USERLASTNAME
                FROM TBL_NEWS INNER JOIN TBL_USERS ON TBL_NEWS.FLD_NEWSAUTHOR = TBL_USERS.FLD_USERID
                WHERE FLD_NEWSID = #url.newsID#
            </cfquery>
            <cfoutput>
                <h1>#rsSingleNews.FLD_NEWSTITLE#</h1>
                <p class="metadata">Published on #dateFormat(rsSingleNews.FLD_NEWSCREATIONDATE, "mm dd yyy")# by #rsSingleNews.FLD_USERFIRSTNAME# #rsSingleNews.FLD_USERLASTNAME#</p>
                #rsSingleNews.FLD_NEWSCONTENT#
            </cfoutput>
        <cfelseif isDefined('url.year')>
          <cfquery datasource="hdStreet" name="rsNewsOfYear">
            SELECT FLD_NEWSTITLE, FLD_NEWSCREATIONDATE, FLD_NEWSID
            FROM TBL_NEWS
            WHERE year(FLD_NEWSCREATIONDATE) = #url.year#
            ORDER BY FLD_NEWSCREATIONDATE DESC
          </cfquery>
                <h1>All the news for <cfoutput>#url.year#</cfoutput></h1>
            <table> <!---Output  news in a table--->
            <cfoutput query="rsNewsOfYear">
                    <tr>
                        <td>#dateFormat(FLD_NEWSCREATIONDATE, 'mm dd yyyy')#</td>
                        <td>#FLD_NEWSTITLE#</td>
                        <td><a href="news.cfm?newsID=#FLD_NEWSID#">Read more</a></td>
                    </tr>
            </cfoutput>
            </table>
        <cfelse>
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
                <td><a href="news.cfm?newsID=#FLD_NEWSID#">Read more</a></td>
              </tr>
            </cfoutput>
          </table>
        </cfif>
      </div>
      <div id="calendarSideBar">
        <h1>News archive</h1>
          <ul>
            <cfoutput query="rsNewsYears" group="fld_newsYear">
                <li><a href="news.cfm?year=#fld_newsYear#">#fld_newsYear#</a></li>
            </cfoutput>
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
