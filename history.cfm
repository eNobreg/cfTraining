<!---Get page content for fld_pageID = 2--->
<cfset pageService = createObject("component", 'components.pageService') />
<cfset rsPage = pageService.getPageContent(2) />

<cf_front title="HD street band - History">
  <div id="pageBody">
  <!---Erase from here--->
  <cfoutput>
      <h1>#rsPage.FLD_PAGETITLE#</h1>
      #rsPage.FLD_PAGECONTENT#
  </cfoutput>
<!---To here--->
</div>
</cf_front>
