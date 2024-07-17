# Coldfusion OpenSRS API Domain availability lookup
OpenSRS domain availability lookup for Coldfusion/Lucee server.

# License

Copyright (c) 1997-2024 interVations

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

# About

This CFC is to facilitate making calls to the OpenSRS Domains API.

As a reseller of domains from OpenSRS/Tucows for over ten(10) years, we code exclusively using Coldfusion/Lucee.

We are embarking on a unique integration of the OpenSRS API platform with an aim to give our many customers the tools they need for everyday domain management tasks.

The Coldfusion OpenSRS API Domain availability lookup code is just a small piece. We are publishing it here for free for all to use without limitations, we just ask that you support this repository by sponsoring us by buying us a coffee at the link below.

# <img src="https://github.com/images/modules/search/mona-love.png" alt="Sponsor"> Sponsor this project
https://buymeacoffee.com/intervations

By sponsoring this project, you help move it up our list of projects to do.

We intend to sell copies of the final skin product which will be accessable in a private repository. Depending on how much you sponsor, you will be given a generous discount of the final price.

## Usage
    
    <cfset objOpenSRS = createObject("component","apiOpenSRS") />
    <cfset stResults = objOpenSRS.searchDomainAvailability(domain_name=url.domain)>
    
    <cfloop array="#stResults#" index="domain">
        #domain.domain# - #domain.status#
    </cfloop>
    
See also a functional example at:

    https://demo.intervations.com.au/opensrs-api-v1.0-domain-availability-lookup/


# Need further information or have feedback?

Submit a question or feedback using the Issues tab on this respository, or you can always contact the team directly by emailing info@intervations.com.au.

# Who are interVations?

interVations is not just your run-of-the-mill internet solutions provider – we are a force of innovation and transformation. At the core of our passion lies web hosting and design/development expertise, where we excel in creating remarkable online experiences. Our mission is to empower you, fuelling your journey towards exceeding your boldest online marketing goals.

Visit, https://intervations.com.au, for more.
