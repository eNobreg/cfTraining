<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Untitled Document</title>
</head>

<body>
	<!---Step 1 - Create an array using explicit notation--->
	<cfset aColors = arrayNew(1) />
	<cfSet aColors[1] = "Red" />
	<cfSet aColors[2] = "Blue" />
	<cfSet aColors[3] = "Green" />
	<p>Dump the explicit array</p>
	<cfdump var = "#aColors#" labal="Explicit Delcaration" />
	
	<!---Step 2 - Create an array using the implicit array notation--->
	<cfset aColorsImplicit = ["Red", "Green", "Blue"] />
	<p>Dump the implicit array</p>
	<cfdump var="#aColorsImplicit#" label="Implicit Declaration" />
	
	<!---Step 3 - use arrayLen()--->

	<h1>The aColors array contains <cfoutput>#arraylen(aColors)#</cfoutput> Elements</h1>
    
	<!---Step 4 - use <cfloop> to loop over the array--->
	<cfoutput>
		<cfloop from="1" to="#arraylen(aColors)#" index="i">
			#i# = #aColors[i]# <br />
		</cfloop>
	</cfoutput>
    

	<!--- Step 5 - Use arrayAppend() and arrayPrepend() --->
	<cfSet arrayAppend(aColors, 'Orange') />
	<cfset arrayprepend(aColors, 'Yellow') />
	<cfdump var="#aColors#" label="Appened two colors" />
	
	<br />
	<!---Step 6 - Use arrayDeleteAt() --->
	<cfset arrayDeleteAt(aColors,3) />
	<cfdump var="#aColors#" label="Deleted at 3" />

</body>
</html>