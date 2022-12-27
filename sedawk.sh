#!/bin/bash

FILE=passwd_new

# a. Create copy of passwd file to passwd_new. exclamation Do all modifications on passwd_new file
cp passwd "$FILE"

# b. Change shell for user saned from /usr/sbin/nologin to /bin/bash using AWK
awk -i inplace -F: 'BEGIN {OFS=":"} {if ($1=="saned") $7="/bin/bash"; print}' "$FILE"

# c. Change shell for user avahi from /usr/sbin/nologin to /bin/bash using SED
sed -i '/avahi:/s/\/usr\/sbin\/nologin/\/bin\/bash/' "$FILE"

# d. Save only 1-st 3-th 5-th 7-th columns of each string based on : delimiter
awk -i inplace -F: 'BEGIN {OFS=":"} {print $1, $3, $5, $7}' "$FILE"

# e. Remove all lines from file containing word daemon
sed -i '/daemon/d' "$FILE"

# f. Change shell for all users with even UID to /bin/zsh
awk -i inplace -F: 'BEGIN {OFS=":"} {if ($2%2==0) $7="/bin/zsh"; print}' "$FILE"
