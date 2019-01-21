log=./info.log 
for Domain in `cat list.txt` 
do 
  Port_List=`nmap  -Pn $Domain |grep -w "open" |awk -F'/' '{print $1}'` 
  echo "--- $Domain ---" | tee >> $log 
  echo "open port: $Port_list" | tee >> $log  
  for Port in $Port_List 
  do 
    Info=`openssl s_client -servername $Domain -connect $Domain:$Port < /dev/null | openssl x509 -noout -dates -subject` 
 
    #If SSL is not turned on, the loop exits 
    if [ -z "$Info" ] 
    then 
      echo "Port $Port SSL is not enabled" | tee >> $log 
      continue 
    else
      echo "Port $Port SSL is enabled" | tee >> $log
    fi 

    StartTime=`echo $Info| awk -F'=' '{print $2}'|awk '{$NF="";print $0}'|xargs -I {} date '+%Y-%m-%d' --date {}`  
    EndTime=`echo $Info | awk -F'=' '{print $3}'|awk '{$NF="";print $0}'| xargs -I {} date '+%Y-%m-%d' --date {}`  
    Domain_Name=`echo $Info | awk -F'=' '{print $5}'`
    echo "  $Domain:$Port SSL domain: $Domain_Name" | tee >> $log 
    echo "  $Domain:$Port SSL StartTime: $StartTime" | tee >> $log   
    echo "  $Domain:$Port SSL EndTime: $EndTime" | tee >> $log   
  done 
done
