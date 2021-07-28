<cfparam name="attributes.legend" default="No legend supplied for this image" />
<cfif thistag.executionmode EQ 'start'>
    <div class="imageWrapper">
<cfelse>
        <p><cfoutput>#attributes.legend#</cfoutput></p>
    </div>
</cfif>


