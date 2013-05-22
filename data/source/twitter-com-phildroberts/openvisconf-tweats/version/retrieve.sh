#!/bin/bash
#
#3> <>
#3> rdfs:comment 
#3> "Script to retrieve and convert a new version of the dataset.";
#3>
#3> rdfs:seeAlso 
#3> <https://github.com/timrdf/csv2rdf4lod-automation/wiki/Automated-creation-of-a-new-Versioned-Dataset>,
#3> <https://github.com/timrdf/csv2rdf4lod-automation/wiki/tic-turtle-in-comments>;
#3> .

export CSV2RDF4LOD_CONVERT_OMIT_RAW_LAYER="true"
$CSV2RDF4LOD_HOME/bin/util/google2source.sh -w 0AmhNh-vPS0hDdGdCNV93cU5ZOWtkNUNFQXhjaFJULWc auto
