<!---Get page content for fld_pageID = 5--->
<cfset pageService = createObject("component", 'components.pageService') />
<cfset rsPage = pageService.getPageContent(5) />

<cfmodule template="customTags/front.cfm" title="HD street band - Site Map">
  <div id="pageBody">
  <!---Erase from here--->
    <cfoutput>
        <h1>#rsPage.FLD_PAGETITLE#</h1>
        #rsPage.FLD_PAGECONTENT#
    </cfoutput>
  </div>
</cfmodule>
