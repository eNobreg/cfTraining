<!--- Create a new instance of the NewsService component --->
<cfset newsService = createObject("component", "components.newsService") />
<!---Get news years--->
<cfset rsNewsYears = newsService.getNewsYears() />

<cfmodule template="customTags/front.cfm" title="HD street band - News">
  <div id="pageBody">
      <div id="calendarContent">
        <cfif isDefined("url.newsID")>
            <!--- Output a single news --->
            <cfset rsSingleNews = newsService.getNewsByID(url.newsID) />
            <cfoutput>
                <h1>#rsSingleNews.FLD_NEWSTITLE#</h1>
                <p class="metadata">Published on #dateFormat(rsSingleNews.FLD_NEWSCREATIONDATE, "mm dd yyy")# by #rsSingleNews.FLD_USERFIRSTNAME# #rsSingleNews.FLD_USERLASTNAME#</p>
                #rsSingleNews.FLD_NEWSCONTENT#
            </cfoutput>
        <cfelseif isDefined('url.year')>
            <!--- Gets the news of a year --->
            <cfset rsNewsOfYear = newsService.getNewsForYear(url.year) />
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
           <cfset rsAllNews = newsService.getLatestNews() />

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