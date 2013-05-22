#GenerateTestMap.sh
#
#generates testing map svg
#use GenerateAndPublish.sh to deploy new maps
#
#depends- xsltproc

xsltproc -novalid -o TestMap.svg map.xslt map.xml
