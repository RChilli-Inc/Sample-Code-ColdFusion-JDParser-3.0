<Cfset rchilli={
 url="http://jdrest.rchilli.com/JDParser/RChilli/ParseJD"
, UserKey="your userkey"
, Version="3.0"
, SubUserId="subuserid as per agreement"
}>
 
<cfset cv=structnew()>
<cffile action="readBinary" file="filepath\filename.ext" variable="cv.File">
<Cfset cv.filename="filename.ext">
<cfset cv.encoded=BinaryEncode(cv.file, "Base64")>
 
<cfset rchilli.FileName=cv.filename>
<Cfset rchilli.FileData=cv.encoded>
 
<cfset rchilliJson={
    "filedata"="#rchilli.filedata#"
    ,"filename"="#rchilli.filename#"
    ,"userkey"="#rchilli.userkey#"
    ,"version"="#rchilli.version#"
    ,"subuserid"="#rchilli.subuserid#"
}>
 
<cfoutput>#serializejson(rchillijson)#</cfoutput>
 
<cfhttp url="#rchilli.url#" method="POST" result="rchilliPost">
     <cfhttpparam type="header" name="Content-Type" value="application/json">
     <cfhttpparam type="body" value="#serializejson(rchillijson)#">
</cfhttp>
 
<cfdump var="#rchilliPost.filecontent#"> 
<cfabort>