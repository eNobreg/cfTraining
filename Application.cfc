<cfcomponent output='false'>
    <cfset this.name = 'hdStreetWebstie' />
    <cfset this.applicationTimeout = createTimespan(0, 2, 0, 0) />
    <cfset this.datasource = "hdStreet" />
    <cfset this.customtagpaths = expandPath('/cftraining/customTags')/>
    <!---- Testing new setup! ---->

    <cffunction name="onApplicationStart" returntype="boolean">
        <cfset application.pageService = createObject("component", "components.pageService") />
        <cfset application.eventsService = createObject("component", "components.eventsService") />
        <cfset application.newsService = createObject("component", "components.newsService") />
        <cfset application.userService = createObject("component", "components.userService") />
        <cfreturn true />
    </cffunction>


    <cffunction name="onRequestStart" returntype="boolean">
        <cfreturn true />
    </cffunction>

</cfcomponent>
