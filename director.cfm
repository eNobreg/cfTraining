<!---Get page content--->
<cfquery datasource="hdStreet" name="rsPage">
    SELECT FLD_PAGETITLE, FLD_PAGECONTENT
    FROM TBL_PAGES
    WHERE FLD_PAGEID = 1 AND FLD_PAGEISACTIVE = 1
</cfquery>

<cfmodule template="customTags/front.cfm" title="HD street band - Director">
  <div id="pageBody">
    <cfoutput>
      <h1>#rsPage.FLD_PAGETITLE#</h1>
      #rsPage.FLD_PAGECONTENT#
    </cfoutput>
  </div>
</cfmodule>
