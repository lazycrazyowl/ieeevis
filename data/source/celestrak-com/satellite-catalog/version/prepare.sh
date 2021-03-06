#!/bin/bash
#
#3> <> a conversion:PreparationTrigger; # Could also be conversion:Idempotent;
#3>    foaf:name "prepare.sh";
#3>    rdfs:seeAlso
#3>     <https://github.com/timrdf/csv2rdf4lod-automation/wiki/Automated-creation-of-a-new-Versioned-Dataset>,
#3>     <https://github.com/timrdf/csv2rdf4lod-automation/wiki/Triggers>,
#3>     <https://github.com/timrdf/csv2rdf4lod-automation/wiki/Conversion-trigger>,
#3>     <https://github.com/timrdf/csv2rdf4lod-automation/wiki/Conversion-cockpit>;
#3> .
#
# This script is responsible for processing files in source/ and storing their modified forms
# as files in the manual/ directory. These modified files should be ready for conversion.
# 
# This script is also responsible for constructing the conversion trigger
#   (e.g., with cr-create-conversion-trigger.sh -w manual/*.csv)
#
# When this script resides in a cr:directory-of-versions directory,
# (e.g. source/datahub-io/corpwatch/version)
# it is invoked by retrieve.sh (or cr-retrieve.sh).
#   (see https://github.com/timrdf/csv2rdf4lod-automation/wiki/Directory-Conventions)
#
# When this script is invoked, the conversion cockpit is the current working directory.

mkdir automatic &> /dev/null

src='https://github.com/timrdf/ieeevis/blob/master/data/source/celestrak-com/satellite-catalog'

cat source/satcat.txt | awk -f ../../src/fw2csv.awk             > manual/satcat.csv
justify.sh source/satcat.txt manual/satcat.csv "$src/fw2csv.awk"

#saxon.sh ../../src/sources.xsl      a a manual/sources.html     > manual/sources.csv
tidy.sh -w -od manual source/sources.asp # manual/sources.asp.tidy 
justify.sh source/sources.asp manual/sources.asp.tidy 'http://dbpedia.org/resource/HTML_Tidy'
saxon.sh ../../src/sources.xsl         a a manual/sources.asp.tidy > manual/sources.csv
justify.sh manual/sources.asp.tidy manual/sources.csv "$src/sources.xsl"

#saxon.sh ../../src/launch-sites.xsl a a manual/launchsites.html > manual/launchsites.csv
tidy.sh -w -od manual source/launchsites.asp # manual/launchsites.asp.tidy 
justify.sh source/launchsites.asp manual/launchsites.asp.tidy 'http://dbpedia.org/resource/HTML_Tidy'
saxon.sh ../../src/launch-sites.xsl a a manual/launchsites.asp.tidy > manual/launchsites.csv
justify.sh manual/launchsites.asp.tidy manual/launchsites.csv "$src/launch-sites.xsl"

echo manual/satcat.csv 
echo manual/sources.csv
echo manual/launchsites.csv

if [ ! -e convert-satellite-catalog.sh ]; then
   cr-create-conversion-trigger.sh -w manual/satcat.csv manual/sources.csv manual/launchsites.csv
fi
