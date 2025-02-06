rm ~/nbustatus/output
rm ~/nbustatus/final_output
while read p; do
    bpbkar_pid=$(ssh -o StrictHostKeyChecking=no $p ""pgrep bpbkar"" </dev/null)
    #echo "bpbkar_pid = $bpbkar_pid"
    #echo "Server name = $p"
    echo "$p $bpbkar_pid" >>output
done <servers.txt

awk 'BEGIN {printf("%5s%5s%5s\n" ,"Server",",","bpbkarPID")}
{printf("%5s%5s%5s\n", $1,",", $2)}' <~/nbustatus/output >final_output

cat final_output | column -t -s ","
