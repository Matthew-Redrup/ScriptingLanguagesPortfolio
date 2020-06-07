#!/bin/bash
echo "Google server IPs:"
awk 'BEGIN {
    FS=":";
    print "_______________________________";
    print "|\033[34mServer Type\033[0m | \033[34mIP\033[0m |";
}
{
    printf("| \033[34m%-10s\033[0m | \033[35m%-18s\033[0m |\n", $1, $2);
}
END {
    print("_______________________________");
}' input.txt