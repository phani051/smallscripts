while read -r line; do
    master=$(echo $line | awk '{print $2}')
    policy=$(echo $line | awk '{print $3}')
    abcd="sudo /usr/openv/netbackup/bin/admincmd/bpplinfo $policy -modify -inactive -keyword 'Migrated to Networker as per CHG000009722292' -M $master"
    ssh -t -t -o StrictHostKeyChecking=no $master "${abcd}" </dev/null
done </home/pr0488/disablenbupolicy/data
