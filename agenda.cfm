<cfmodule template="customTags/front.cfm" tilte="HD street band - Agenda">
  <div id="pageBody">
    <div id="calendarContent">
      <cfif isDefined("url.eventID")>
        <!--- If there is an event ID go here and output single agenda---->

        <cfoutput>
            <h1>#rsSingleEvent.fld_eventName#</h1>
            #rsSingleEvent.fld_eventDescription#
        </cfoutput>
        <a href="agenda.cfm">Go back to the agenda</a>
      <cfelse>
        <!--- Output the upcoming event table if url.eventID is not defined --->

        <h1> Agenda</h1>
        <cfif rsCurrentEvents.recordCount EQ 0>
          <p>Sorry there are no events to display at this time</p>
        <cfelse>
          <table>
            <cfoutput query="rsCurrentEvents">
              <tr>
                <th>#dateformat(FLD_EVENTDATETIME, "mm dd yyyy")#</th>
                <td>#FLD_EVENTNAME# - #FLD_EVENTLOCATION# (#FLD_EVENTVENUE#)</td>
                <td><a href="agenda.cfm?eventID=#FLD_EVENTID#">Read More</a></td>
              </tr>
            </cfoutput>
          </table>
        </cfif>
      </cfif>
    </div>
    <div id="calendarSideBar">
      <cfif isDefined("url.eventID")>
        <cfoutput>
          <h1>Event Details</h1>
          <div id="EventDetails">
            <p id="eventDate"><span id="month">#dateFormat(rsSingleEvent.FLD_EVENTDATETIME, "mmm")#</span> <span id="days">#dateFormat(rsSingleEvent.FLD_EVENTDATETIME, "dd")#</span></p>
            <h2>#rsSingleEvent.FLD_EVENTNAME# - #rsSingleEvent.FLD_EVENTLOCATION#</h2>
          </div>
          <p>#rsSingleEvent.FLD_EVENTVENUE#</p>
        </cfoutput>
      <cfelse>
        <cfif rsCurrentEvents.recordcount EQ 0>
          <p>Sorry, there are no events to display at this time</p>
        <cfelse>
          <cfoutput>
          <h1>Next Event</h1>
            <div id="EventDetails">
              <p id="eventDate"><span id="month">#dateFormat(rsCurrentEvents.FLD_EVENTDATETIME, "mmm")#</span> <span id="days">#dateFormat(rsCurrentEvents.FLD_EVENTDATETIME, "dd")#</span></p>
              <h2>#rsCurrentEvents.FLD_EVENTNAME# - #rsCurrentEvents.FLD_EVENTLOCATION#</h2>
            </div>
            <p>#rsCurrentEvents.FLD_EVENTVENUE#</p>
            <p class="alignRight"><a href="agenda.cfm?eventID=#rsCurrentEvents.FLD_EVENTID#">Read More</a></p>
          </cfoutput>
        </cfif>
      </cfif>
  </div>
  </div>
</cfmodule>
