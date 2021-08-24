<!--- Creating an instance of the user service component --->
<cfset userService = createObject("component", "components.userService") />

<!--- Form Processing Script --->
<cfif structKeyExists(form, 'fld_newUserSubmit')>
    <!--- Generate missing Data --->
    <cfset form.fld_userPassword = generateSecretKey("AES") />
    <cfset form.fld_userRole = 1 />
    <cfset form.fld_userApproved = 0 />
    <cfset form.fld_userIsActive = 0 />
    <!--- Start server side form validation --->
    <cfset aErrorMessages = userService.validateUser(form.fld_userFirstName, form.fld_userLastName, form.fld_userEmail, form.fld_userPassword, form.fld_userPassword) />
    <cfif arrayIsEmpty(aErrorMessages)>
        <!--- Insert into Database --->
        <cfset
            userService.addUser(form.fld_userFirstName, form.fld_userLastName,
            form.fld_userEmail, form.fld_userPassword, form.fld_userRole,
            form.fld_userInstrument,form.fld_userComment,form.fld_userApproved,
            form.fld_userIsActive) />
        <cfset userIsInserted = true />
    </cfif>
</cfif>

<!---Get page content for fld_pageID = 4--->
<cfset pageService = createObject("component", 'components.pageService') />
<cfset rsPage = pageService.getPageContent(4) />

<!--- Get list of instruments for form drop down --->
<cfset rsInstrumentsList = userService.getInstruments() />

<cf_front title="HD street band - Play with us">
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
</cf_front>