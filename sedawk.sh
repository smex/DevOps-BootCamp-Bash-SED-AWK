#!/bin/bash

cat passwd | awk '/saned/ {gsub("/usr/sbin/nologin", "/bin/bash")}1' | sed '/avahi:/s/\/usr\/sbin\/nologin/\/bin\/bash/' | awk -F ":" '{print $1 ":" $3 ":" $5 ":" $7}' | sed '/daemon/d' | awk -F ":" '{if ($2 % 2 == 0 ) {$4="/bin/zsh"; print $1 ":" $2 ":" $3 ":" $4} else {print $1 ":" $2 ":" $3 ":" $4}}' > passwd_new
