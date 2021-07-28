<!---Get page content for fld_pageID = 3--->
<cfquery datasource="hdStreet" name="rsPage">
    SELECT FLD_PAGETITLE, FLD_PAGECONTENT
    FROM TBL_PAGES
    WHERE FLD_PAGEID = 3 AND FLD_PAGEISACTIVE = 1
</cfquery>

<cfmodule template="customTags/front.cfm" title="HD street band - We play for You">
  <div id="pageBody">
      <cfoutput>
        <h1>#rsPage.FLD_PAGETITLE#</h1>
          #rsPage.FLD_PAGECONTENT#
      </cfoutput>
    </div>
</cfmodule>
