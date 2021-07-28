<!---Get news years--->
<cfquery datasource="hdStreet" name="rsNewsYears">
  SELECT YEAR(FLD_NEWSCREATIONDATE) AS fld_newsYear
  FROM TBL_NEWS
  ORDER BY FLD_NEWSCREATIONDATE DESC
</cfquery>

<cfmodule template="customTags/front.cfm" title="HD street band - News">
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
</cfmodule>