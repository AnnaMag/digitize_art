 #!/bin/bash

touch $1
touch temp

echo "id, accession_number, year_acquired, type" > header.txt

for f in $( find "`pwd`" -name *json); do
   jq '[.id, .accession_number, .year_acquired, .type] | join(", ")' $f | sed 's/\"//g' >> temp
done

cat header.txt temp > $1

rm temp header.txt
