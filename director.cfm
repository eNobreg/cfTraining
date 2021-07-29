<!---Get page content--->
<cfinclude template="includes/myFunctions.cfm" />
<cfset rsPage = getPageContent(1) />

<cfmodule template="customTags/front.cfm" title="HD street band - Director">
  <div id="pageBody">
    <cfoutput>
      <h1>#rsPage.FLD_PAGETITLE#</h1>
      #rsPage.FLD_PAGECONTENT#
    </cfoutput>
  </div>
</cfmodule>
