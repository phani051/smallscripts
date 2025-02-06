while read p; do
    mkdir /home/pr0488/exclusion_list/output/$p
    scp -o StrictHostKeyChecking=no pr0488@$p:/usr/openv/netbackup/exclude* ~/exclusion_list/output/$p
done </home/pr0488/exclusion_list/serverlist
