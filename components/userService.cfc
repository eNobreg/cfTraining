<cfcomponent>
    <!--- Get Single user by ID --->
    <cffunction name="getUserByID" access="public" returntype="query" output="false">
        <cfargument name="userID" type="numeric" required="true" />
    </cffunction>


    <!--- Get instruments list --->
    <cffunction name="getInstruments" access="public" returntype="query" output="false">

    </cffunction>

    <!--- Add user Method --->
    <cffunction name="addUser" access="public" returntype="void" output="false" >
        <cfargument name="userFirstName" type="string" required="true" />
        <cfargument name="userLastName" type="string" required="true" />
        <cfargument name="userEmail" type="string" required="true" />
        <cfargument name="userPassword" type="string" required="true" />
        <cfargument name="userRole" type="numeric" required="true" />
        <cfargument name="userInstrument" type="numeric" required="true" />
        <cfargument name="userComment" type="string" required="true" />
        <cfargument name="userIsApproved" type="numeric" required="true" />
        <cfargument name="userIsActive" type="numeric" required="true" />

    </cffunction>

    <!--- Validate user Method --->
    <cffunction name="validateUser" access="public" returntype="array" output="false">
        <cfargument name="userFirstName" type="string" required="true" />
        <cfargument name="userLastName" type="string" required="true" />
        <cfargument name="userEmail" type="string" required="true" />
        <cfargument name="userPassword" type="string" required="true" />
        <cfargument name="userPasswordConfirm" type="numeric" required="true" />

    </cffunction>

    <!--- Update user Method --->
    <cffunction name="updateUser" access="public" returntype="void" output="false" >
        <cfargument name="userFirstName" type="string" required="true" />
        <cfargument name="userLastName" type="string" required="true" />
        <cfargument name="userEmail" type="string" required="true" />
        <cfargument name="userPassword" type="string" required="true" />
        <cfargument name="userRole" type="numeric" required="true" />
        <cfargument name="userInstrument" type="numeric" required="true" />
        <cfargument name="userComment" type="string" required="true" />
        <cfargument name="userIsApproved" type="numeric" required="true" />
        <cfargument name="userIsActive" type="numeric" required="true" />
        <cfargument name="userID" type="numeric" required="true" />

    </cffunction>
</cfcomponent>
