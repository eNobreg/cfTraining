<cfcomponent output="false" displayname="Page Service component" hint="This component handles various aspects of page management">
    <cffunction name="getPageContent" returntype="query" hint="This function retreives a single page from the database based on the unique ID number of the page">
        <cfargument name="pageID" type="numeric" required="true" hint="Unique ID number of the page to retrieve">
        <cfset var rsPage = '' />
        <cfquery datasource="hdStreet" name="rsPage">
            SELECT FLD_PAGETITLE, FLD_PAGECONTENT
            FROM TBL_PAGES
            WHERE FLD_PAGEID = #arguments.pageID# AND FLD_PAGEISACTIVE = 1
        </cfquery>
        <cfreturn rsPage />
    </cffunction>
</cfcomponent>
