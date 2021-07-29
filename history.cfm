<!---Get page content for fld_pageID = 2--->
<cfinclude template="includes/myFunctions.cfm" />
<cfset rsPage = getPageContent(2) />

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
