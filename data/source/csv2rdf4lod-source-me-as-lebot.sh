#3> <#> a <http://purl.org/twc/vocab/conversion/CSV2RDF4LOD_environment_variables> ;
#3>     rdfs:seeAlso 
#3>     <http://purl.org/twc/page/csv2rdf4lod/distributed_env_vars>,
#3>     <https://github.com/timrdf/csv2rdf4lod-automation/wiki/Script:-source-me.sh> .

export CSV2RDF4LOD_CONVERT_PERSON_URI="http://tw.rpi.edu/instances/TimLebo"
source /home/lebot/prizms/ieeevis/data/source/csv2rdf4lod-source-me-for-ieeevis.sh
CSV2RDF4LOD_BASE_URI_OVERRIDE=''
if [[ -z "$CSV2RDF4LOD_CONFIG_OMIT" ]]; then
   alias ieeevis='sudo su ieeevis'
   export PATH=$PATH`/home/lebot/opt/prizms/bin/install/paths.sh`
   export CLASSPATH=$CLASSPATH`/home/lebot/opt/prizms/bin/install/classpaths.sh`
   export CSV2RDF4LOD_HOME="/home/lebot/opt/prizms/repos/csv2rdf4lod-automation"
   export JENAROOT=/home/lebot/opt/apache-jena-2.10.0
   export DATAFAQS_HOME="/home/lebot/opt/prizms/repos/DataFAQs"
   export PYTHONPATH='/home/lebot/opt/python/lib/site-packages' # TODO: manual
   export PATH=$PATH:'/home/lebot/opt/python/bin' # TODO: manual
fi
