#!/bin/bash
# File              : lore.sh
# Author            : Amar Lakshya <amar.lakshya@protonmail.com>
# Date              : 22.07.2020
# Last Modified Date: 22.07.2020
# Last Modified By  : Amar Lakshya <amar.lakshya@protonmail.com>

set -e
choices=$(ls data/)
if [[ "$?" -eq 0 ]]; then
	echo $choices
fi

for choice in $choices ; do
	if [[ "$1" == "$choice" ]]; then
		zimpath=$(ls ./data/$choice/*.zim)
		zimindex="./data/$choice/$choice"
		if [[ ! -d $zimindex ]]; then
			./gozimindex -path=$zimpath -index=$zimindex
		fi
		./gozimhttpd -path=$zimpath -index=$zimindex
	fi
done
