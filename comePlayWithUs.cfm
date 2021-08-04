
<!--- Form Processing Script --->
<cfif structKeyExists(form, 'fld_newUserSubmit')>
    <!--- Start server side form validation --->
    <cfset aErrorMessages = ArrayNew(1) />
    <!--- Validate first name --->
    <cfif form.fld_userFirstName EQ ''>
        <cfset arrayAppend(aErrorMessages, 'Please enter a valid first name') />
    </cfif>
    <!--- Validate last name --->
    <cfif form.fld_userLastName EQ ''>
        <cfset arrayAppend(aErrorMessages, 'Please enter a valid last name') />
    </cfif>
    <!--- Validate email address --->
    <cfif form.fld_userEmail EQ '' OR NOT isValid("eMail", form.fld_userEmail)>
        <cfset arrayAppend(aErrorMessages, 'Please enter a valid email address') />
    </cfif>

    <cfif arrayIsEmpty(aErrorMessages)>
        <!--- Generate missing Data --->
        <cfset form.fld_userPassword = generateSecretKey("AES") />
        <cfset form.fld_userRole = 1 />
        <cfset form.fld_userApproved = 0 />
        <cfset form.fld_userIsActive = 0 />
        <!--- Insert into Database --->

        <cfset userIsInserted = true />
    </cfif>
</cfif>

<!---Get page content for fld_pageID = 4--->
<cfset pageService = createObject("component", 'components.pageService') />
<cfset rsPage = pageService.getPageContent(4) />

<!--- Get list of instruments for form drop down --->
<cfquery datasource="hdStreet" name="rsInstrumentsList">
	SELECT FLD_INSTRUMENTID, FLD_INSTRUMENTNAME
	FROM TBL_INSTRUMENTS
	ORDER BY FLD_INSTRUMENTNAME ASC
</cfquery>

<cfmodule template="customTags/front.cfm" title="HD street band - Play with us">
<div id="pageBody">
<div id="calendarContent">
<cfoutput>
        <h1>#rsPage.FLD_PAGETITLE#</h1>
    	#rsPage.FLD_PAGECONTENT#
</cfoutput>
</div>
    <div id="calendarSideBar">
        <cfif isDefined('userIsInserted')>
            <h2>Thank you!</h2>
            <p>Your request has been submitted! You should hear from us soon!</p>
            <p>We look forward to talking to you!</p>
        <cfelse>
            <h2>Complete the form below to join our band</h2>
            <cfif isDefined('aErrorMessages') AND NOT arrayIsEmpty(aErrorMessages)>
                <cfoutput>
                    <cfloop array="#aErrorMessages#" index="message">
                            <p class="errorMessage">#message#</p>
                    </cfloop>
                </cfoutput>
            </cfif>
            <cfform id="frm_newUser">
                <fieldset>
                    <legend>Join our band</legend>
                    <dl>
                        <dt><label>First Name</label></dt>
                        <dd><cfinput type="text" name="fld_userFirstName" id="fld_userFirstName" required="true" message="Please enter your first name"/></dd>
                        <dt><label>Last Name</label></dt>
                        <dd><cfinput type="text" name="fld_userLastName" id="fld_userLastName" required="true" message="Please enter your last name"/></dd>
                        <dt><label>E-mail Address</label></dt>
                        <dd><cfinput type="text" name="fld_userEmail" id="fld_userEmail" required="true" validate="eMail" message="Please enter a valid email address"/></dd>
                        <dt><label>Instrument</label></dt>
                        <dd>
                            <cfselect name="fld_userInstrument" id="fld_userInstrument" query="rsInstrumentsList" value="FLD_INSTRUMENTID" display="FLD_INSTRUMENTNAME" queryposition="below">
                                <option value="0">Please choose your instrument</option>
                            </cfselect>
                        </dd>
                        <dt><label>Comment</label></dt>
                        <dd><textarea name="fld_userComment" id="fld_userComment"></textarea></dd>
                    </dl>
                    <input type="submit" name="fld_newUserSubmit" id="fld_newUserSubmit" value="Join the band"/>
                </fieldset>
            </cfform>
        </cfif>
    </div>
</div>
</div>
</cfmodule>