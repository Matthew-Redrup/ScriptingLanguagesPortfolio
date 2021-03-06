#!/bin/bash

awk 'BEGIN {
    FS=":";
    print "_______________________________";
    print "|\033[34mUsername\033[0m | \033[34mUserID\033[0m |\033[34mGroupID\033[0m |\033[34mHome\033[0m |\033[34mShell\033[0m |";
    print "                               ";
    print "_______________________________";
}
{
    printf("| \033[34m%-20s\033[0m | \033[35m%-5d\033[0m | \033[35m%-8d\033[0m | \033[35m%-25s\033[0m | \033[35m%-25s\033[0m |\n", $1, $3, $4, $6, $7);
}
END {
    print("_______________________________");
}' /etc/passwd