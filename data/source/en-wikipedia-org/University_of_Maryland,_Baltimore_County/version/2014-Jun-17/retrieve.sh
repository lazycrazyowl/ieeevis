#!/bin/bash
#3> <> rdfs:seeAlso <http://www.mediawiki.org/wiki/Manual:Parameters_to_Special:Export>,
#3>                 <http://en.wikipedia.org/wiki/Wikipedia:Lamest_edit_wars>;
#3> .

page='University_of_Maryland,_Baltimore_County'

echo source/$page.xml

# Retrieves first 5 edits.
curl -d "" "http://en.wikipedia.org/w/index.php?title=Special:Export&pages=$page%0ATalk:$page&offset=1&limit=5&action=submit" > source/${page}_1-5.xml

# Retrieves first 1000 edits.
#curl -d "" "http://en.wikipedia.org/w/index.php?title=Special:Export&pages=$page%0ATalk:$page&history&action=submit" > source/${page}_0.xml

# Retrieves first 1000 edits.
#curl -d "" "http://en.wikipedia.org/w/index.php?title=Special:Export&pages=$page%0ATalk:$page&offset=1000&limit=1000&action=submit" > source/${page}_1.xml

# Retrieves the latest edit.
#curl "http://en.wikipedia.org/w/index.php?title=Special:Export&pages=$page%0ATalk:$page&offset=1000&limit=1000&action=submit" > source/$page_1.xml

# ^^ Failures


# Success!
# Retrieves 1767 page edits and 211 Talk: edits.
if [[ ! -e "source/$page.xml" ]];then
   curl "http://en.wikipedia.org/w/index.php?title=Special:Export&pages=$page%0ATalk:$page&history&action=submit" > source/$page.xml
fi
