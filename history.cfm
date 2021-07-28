<!---Get page content for fld_pageID = 2--->
<cfquery datasource="hdStreet" name="rsPage">
    SELECT FLD_PAGETITLE, FLD_PAGECONTENT
    FROM TBL_PAGES
    WHERE FLD_PAGEID = 2 AND FLD_PAGEISACTIVE = 1
</cfquery>

<cfmodule template="customTags/front.cfm" title="HD street band - History">
  <div id="pageBody">
  <!---Erase from here--->
  <cfoutput>
      <h1>#rsPage.FLD_PAGETITLE#</h1>
      #rsPage.FLD_PAGECONTENT#
  </cfoutput>
<!---To here--->
</div>
</cfmodule>
