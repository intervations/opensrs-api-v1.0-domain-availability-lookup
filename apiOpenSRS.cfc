<!--- @@Copyright: interVations 1997-2024, https://www.intervations.com.au --->
<!--- @@displayname: OpenSRS Domains API --->
<!--- @@Description: This component is for interacting with the OpenSRS Domains API --->
<!--- @@Developer: Jason Fenton (info@intervations.com.au) --->

<cfcomponent>
	
	<cffunction name="searchDomainAvailability" access="remote" returntype="array">
		<cfargument name="domain_name" type="string" required="yes">
		
		<cfset lookupKey = 0>
		
		<cfsavecontent variable="lookupTLDs">
			<item key='0'>.au</item><item key='1'>.com.au</item><item key='2'>.net.au</item><item key='3'>.org.au</item><item key='4'>.asn.au</item><item key='5'>.id.au</item><item key='6'>.com</item><item key='7'>.net</item><item key='8'>.org</item><item key='9'>.biz</item><item key='10'>.info</item><item key='11'>.mobi</item><item key='12'>.co</item>
		</cfsavecontent>
		
		<cfscript>
			Variables.xml = "<?xml version='1.0' encoding='UTF-8' standalone='no' ?><!DOCTYPE OPS_envelope SYSTEM 'ops.dtd'><OPS_envelope><header><version>0.9</version></header><body><data_block><dt_assoc><item key='protocol'>XCP</item><item key='action'>name_suggest</item><item key='object'>domain</item><item key='attributes'><dt_assoc><item key='services'><dt_array><item key='0'>lookup</item></dt_array></item><item key='searchstring'>#arguments.domain_name#</item><item key='tlds'><dt_array>#lookupTLDs#</dt_array></item></dt_assoc></item></dt_assoc></data_block></body></OPS_envelope>";

			variables.signature = lcase(hash(Variables.xml & "yourOpenSRSAPIKey", "md5")); // change yourOpenSRSAPIKey to your OpenSRS API Key.
			variables.signature = lcase(hash(Variables.signature & "yourOpenSRSAPIKey", "md5")); // change yourOpenSRSAPIKey to your OpenSRS API Key.

			cfhttp(method="post", url="https://horizon.opensrs.net:55443") { // change to https://rr-n1-tor.opensrs.net:55443 for production use.
				cfhttpparam(type="header", name="Content-Type", value="text/xml");
				cfhttpparam(type="header", name="X-Username", value=yourOpenSRSUsername; // change yourOpenSRSUsername to your OpenSRS Username.
				cfhttpparam(type="header", name="X-Signature", value=variables.signature);
				cfhttpparam(type="body", value=Variables.xml);
			}

			if (cfhttp.statusCode eq "200 OK") {
				// Parse the XML response
				responseXML = xmlParse(cfhttp.fileContent);

				// Extract lookup domain data
				lookupDomains = [];
				lookupItems = xmlSearch(responseXML, "/OPS_envelope/body/data_block/dt_assoc/item[@key='attributes']/dt_assoc/item[@key='lookup']/dt_assoc/item[@key='items']/dt_array/item");

				for (item in lookupItems) {
					domain = xmlSearch(item, "dt_assoc/item[@key='domain']")[1].xmlText;
					status = xmlSearch(item, "dt_assoc/item[@key='status']")[1].xmlText;
					arrayAppend(lookupDomains, { "domain": domain, "status": status });
				}
			} else {
				// Something went wrong
				writeOutput("<h3>Error</h3>");
				writeDump(cfhttp);
			}
		</cfscript>
		
		<cfreturn lookupDomains>
	</cffunction>
	
</cfcomponent>