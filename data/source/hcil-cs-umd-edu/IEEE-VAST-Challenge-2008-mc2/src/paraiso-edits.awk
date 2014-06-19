# (cur) (last) 23:44, 15 January 2007 Alonzo (Talk | contribs) m (100,571 bytes) (?Scientific criticism of Paraiso beliefs - link)
# (cur) (last) 03:21, 14 January 2007 Alfonso (Talk | contribs) (100,552 bytes) (?External links - pruning links (see talk))

BEGIN {
   print "Edit date,Editing user,Minor edit or not,Resulting page size in bytes,Edit comment"
}

{
   #print $0
   talk_contribs_pos = index($0,"(Talk | contribs)");
   date_and_user     = substr($0,1,talk_contribs_pos-1);
   minor_bytes_comment = substr($0,talk_contribs_pos);

   # Date
   sub(/^# \(cur\) \(last\) /, "", date_and_user)
   sub(/ *$/, "", date_and_user)
   year_pos = index(date_and_user," 200") # NOTE: Assumes year is 2010
   date = substr(date_and_user,1,year_pos+4)

   # User
   user = date_and_user
   gsub(/^.*200. */,"",user)

   # Minor edit?
   index(minor_bytes_comment, "(Talk | contribs) m (") > 0 ? minor = "minor" : minor = "";

   # Bytes
   bytes_pos = index(minor_bytes_comment," bytes)")
   bytes = substr(minor_bytes_comment,1,bytes_pos)
   gsub(/^.*\(Talk \| contribs\)[m ]+\(/,"",bytes)
   gsub(/ *$/,"",bytes)

   # Comment
   comment = substr(minor_bytes_comment,bytes_pos)
   gsub(/ *bytes\) */,"",comment)
   gsub(/\(/,"",comment)
   if( index(comment,")") > 0 ) {
      gsub(/\)[^)]*$/,"",comment)
      gsub(/"/,"\\\"",comment)
   }else {
      comment = ""
   }
 
   print "\""date"\",\""user"\",\""minor"\",\""bytes"\",\""comment"\""
   #print ""
}