while read p; do

    if [ $(ssh -o StrictHostKeyChecking=no $p "uname" </dev/null) == "SunOS" ]; then

        echo -e "==================================$p in SunOS \n=================================="
        scp -o StrictHostKeyChecking=no ~/sunos/slpbkplog <username>@"$p":/usr/openv/netbackup/local/scripts
        if [ "$?" = "0" ]; then

            echo -e "\n succesfully copied to $p \n"

        else

            echo -e "\n fail to copy to $p \n"

        fi

    elif [ $(ssh -o StrictHostKeyChecking=no $p "uname" </dev/null) == "Linux" ]; then

        echo -e "==================================$p in Linux \n=================================="
        scp -o StrictHostKeyChecking=no ~/linux/slpbkplog <username>@"$p":/usr/openv/netbackup/local/scripts
        if [ "$?" = "0" ]; then

            echo -e "\n succesfully copied to $p \n"

        else

            echo -e "\n fail to copy to $p \n"

        fi

    fi

done </tmp/serverlist
