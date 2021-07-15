<!---Get page content for fld_pageID = 4--->
<cfcontent type="text/html; charset=utf-8">
<!DOCTYPE html>

<cfquery datasource="hdStreet" name="rsPage">
    SELECT FLD_PAGETITLE, FLD_PAGECONTENT
    FROM TBL_PAGES
    WHERE FLD_PAGEID = 4 AND FLD_PAGEISACTIVE = 1
</cfquery>

<!--- Get list of instruments for form drop down --->
<cfquery datasource="hdStreet" name="rsInstrumentsList">
	SELECT FLD_INSTRUMENTID, FLD_INSTRUMENTNAME
	FROM TBL_INSTRUMENTS
	ORDER BY FLD_INSTRUMENTNAME ASC
</cfquery>

<html>
<head>
    <meta charset="utf-8"/>
    <title>HD Street Concert Band - Come play with us</title>
    <link href="/cfTraining/styles/hdStreet.css" rel="stylesheet" type="text/css" media="screen"/>
    <script type="text/javascript" src="/cfTraining/script/jquery.js"></script>
    <script type="text/javascript" src="/cfTraining/script/menu.js"></script>
</head>

<body>
<div id="wrapper">
    <div id="header"><a href="#"><img src="/cfTraining/images/logo.png" alt="logo" name="logo" width="188" height="181"
                                      id="logo"/></a>
        <p id="mainTitle"><img src="/cfTraining/images/mainTitle.png" width="398" height="158"
                               alt="HD Street Concert Band"/><span>HD Street Concert Band</span></p>
        <ul>
            <li><a href="siteMap.cfm">Site Map</a></li>
            <li><a href="contactUs.cfm">Contact us</a></li>
        </ul>
    </div>
    <div id="menu">
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="agenda.cfm">Agenda</a></li>
            <li><a href="#">The Band</a>
                <ul>
                    <li><a href="director.cfm">The director</a></li>
                    <li><a href="history.cfm">The band History</a></li>
                </ul>
            </li>
            <li><a href="wePlayForYou.cfm">We play for You</a></li>
            <li><a href="comePlayWithUs.cfm">Come play with us</a></li>
            <li><a href="news.cfm">News</a></li>
        </ul>
    </div>
<div id="pageBody">
<div id="calendarContent">
<cfoutput>
        <h1>#rsPage.FLD_PAGETITLE#</h1>
    	#rsPage.FLD_PAGECONTENT#
</cfoutput>
</div>
    <div id="calendarSideBar">
        <h2>Complete the form below to join our band</h2>
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
    </div>
</div>
</div>
<div id="footer">
    <p>&copy; Copyright 2011 - HD Street Concert Band</p>
</div>
</div>
</body>
</html>
