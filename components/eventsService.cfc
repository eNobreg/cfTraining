<cfcomponent>

    <!--- Get current events method --->
    <cffunction name="getCurrentEvents" access="public" output="false" returntype="query">
        <cfset var rsCurrentEvents = '' />
        <cfquery  name="rsCurrentEvents">
            SELECT FLD_EVENTID, FLD_EVENTNAME, FLD_EVENTDATETIME, FLD_EVENTLOCATION, FLD_EVENTVENUE
            FROM TBL_EVENTS
            WHERE FLD_EVENTDATETIME >= #now()#
            ORDER BY FLD_EVENTDATETIME ASC
        </cfquery>
        <cfreturn rsCurrentEvents />
    </cffunction>

    <!--- Get event by ID method --->
    <cffunction name="getEventById" access="public" output="false" returntype="query">
        <cfargument name="eventID" type="numeric" required="true" />
        <cfset var rsSingleEvent = '' />
        <cfquery  name="rsSingleEvent">
            SELECT FLD_EVENTID, FLD_EVENTNAME, FLD_EVENTDATETIME,
            FLD_EVENTLOCATION, FLD_EVENTVENUE, FLD_EVENTDESCRIPTION
            FROM TBL_EVENTS
            WHERE FLD_EVENTID = #arguments.eventID#
        </cfquery>
        <cfreturn rsSingleEvent />
    </cffunction>

</cfcomponent>
