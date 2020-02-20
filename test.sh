rm *.dat
echo "Running parser..."
sh runParser.sh
echo "Creating database..."
sqlite3 ebay_data.db < create.sql
echo "Loading tables..."
sqlite3 ebay_data.db < load.txt
echo "Testing queries..."
answers=(13422 80 8365 1046871451 3130 6717 150)
for i in {1..7}
do
  if [ $(sqlite3 ebay_data.db < query${i}.sql) != ${answers[$(( $i - 1 ))]} ]
  then
    echo "Query $i failed!"
  else
    echo "Query $i succeded!"
  fi
done
