 #!/bin/bash

touch $1
touch temp

echo "id, year_acquired, type, description, medium, image" > header.txt

for f in $( find "`pwd`" -name *json); do
   echo $f
   jq '[.id, .year_acquired, .type, .description, .medium, .images[0].b.url ] | join(";;")' $f \
    | sed 's/\"//g' | sed 's/,/ /g' | sed 's/;;/,/g' >> temp
done

cat header.txt temp > $1

rm temp  header.txt
