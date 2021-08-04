<!---Get page content for fld_pageID = 3--->
<cfset pageService = createObject("component", 'components.pageService') />
<cfset rsPage = pageService.getPageContent(3) />

<cfmodule template="customTags/front.cfm" title="HD street band - We play for You">
  <div id="pageBody">
      <cfoutput>
        <h1>#rsPage.FLD_PAGETITLE#</h1>
          #rsPage.FLD_PAGECONTENT#
      </cfoutput>
    </div>
</cfmodule>
