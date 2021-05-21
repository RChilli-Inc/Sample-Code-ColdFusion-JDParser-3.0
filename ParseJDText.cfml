 <Cfset rchilli={
 url="http://jdrest.rchilli.com/JDParser/RChilli/ParseJDText"
, UserKey="your userkey"
, Version="7.0.0"
, SubUserId="subuserid as per agreement"}>
 
<cfset cv=structnew()>
<cfset rchilliJson={
     "base64text"="base64 text data"
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