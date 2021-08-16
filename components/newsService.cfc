<cfcomponent output="false">

    <!--- Get Latest News Method --->
    <cffunction name="getLatestNews" access="public" returntype="query">
        <cfset var rsAllNews = '' />
        <cfquery  name="rsAllNews">
            SELECT FLD_NEWSTITLE, FLD_NEWSCREATIONDATE, FLD_NEWSID
            FROM TBL_NEWS
            ORDER BY FLD_NEWSCREATIONDATE DESC
        </cfquery>
        <cfreturn rsAllNews />
    </cffunction>

    <!--- Get News Years Method --->
    <cffunction name="getNewsYears" access="public" returntype="query">
        <cfset var rsNewsYears = '' />
        <cfquery  name="rsNewsYears">
            SELECT YEAR(FLD_NEWSCREATIONDATE) AS fld_newsYear
            FROM TBL_NEWS
            ORDER BY FLD_NEWSCREATIONDATE DESC
        </cfquery>
        <cfreturn rsNewsYears />
    </cffunction>

    <!--- Get News by ID method --->
    <cffunction name="getNewsByID" access="public" returntype="query">
        <cfargument name="newsID" type="numeric" required="true" />
        <cfset var rsSingleNews = '' />
        <cfquery  name="rsSingleNews">
            SELECT TBL_NEWS.FLD_NEWSCONTENT, TBL_NEWS.FLD_NEWSTITLE, TBL_NEWS.FLD_NEWSCREATIONDATE, TBL_USERS.FLD_USERFIRSTNAME, TBL_USERS.FLD_USERLASTNAME
            FROM TBL_NEWS INNER JOIN TBL_USERS ON TBL_NEWS.FLD_NEWSAUTHOR = TBL_USERS.FLD_USERID
            WHERE FLD_NEWSID = #arguments.newsID#
        </cfquery>
        <cfreturn rsSingleNews />
    </cffunction>

    <!--- Get news for a specific year method --->
    <cffunction name="getNewsForYear" access="public" returntype="query">
        <cfargument name="year" type="numeric" required="true" />
        <cfset var rsNewsOfYear = '' />
        <cfquery  name="rsNewsOfYear">
            SELECT FLD_NEWSTITLE, FLD_NEWSCREATIONDATE, FLD_NEWSID
            FROM TBL_NEWS
            WHERE year(FLD_NEWSCREATIONDATE) = #arguments.year#
            ORDER BY FLD_NEWSCREATIONDATE DESC
        </cfquery>
        <cfreturn rsNewsOfYear />
    </cffunction>

</cfcomponent>
