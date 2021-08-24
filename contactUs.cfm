<!---Get page content for fld_pageID = 6--->
<cfset pageService = createObject("component", 'components.pageService') />
<cfset rsPage = pageService.getPageContent(6) />

<cf_front title="HD street band - Contact Us">
  <div id="pageBody">
  <!---Erase from here--->
    <cfoutput>
      <h1>#rsPage.FLD_PAGETITLE#</h1>
      #rsPage.FLD_PAGECONTENT#
    </cfoutput>
<!---To here--->
</div>
</cf_front>
