date '+%A, %d %B' | awk '{print toupper(substr($1,1,1)) substr($1,2), $2, toupper(substr($3,1,1)) substr($3,2)}'
