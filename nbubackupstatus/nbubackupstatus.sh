while read p; do
    ssh -o StrictHostKeyChecking=no $p "/usr/openv/netbackup/bin/bpclimagelist -t FULL | tail -1" </dev/null >>output
    ssh -o StrictHostKeyChecking=no $p "/usr/openv/netbackup/bin/bpclimagelist -t INCR | tail -1" </dev/null >>output

done <servers.txt
