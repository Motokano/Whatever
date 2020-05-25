bzip2 -dk *.bz2

for file in `ls /work/seinou_grp/kou/sync/mbacbt01*.log`; do 
  cat $file| grep jsr_batch_run_id | awk -F' ' '{print $2 " " $3 " " $15 " " $20}' > temp.csv
  while read line; do 
    for i in `echo $line | awk -F' ' '{print $3}'| grep -oe '\([0-9.]*\)'`; do 
      echo -n "${i},"; 
      echo -n ; 
      grep $i temp.csv | grep -v COMPLETED |awk -F' ' '{print $1 "," $2}';  
      echo -n "${i},"; 
      echo -n ; 
      grep $i temp.csv | grep COMPLETED |awk -F' ' '{print $1 "," $2}'; 
    done ; 
  done < temp.csv > data.csv; done
