#!/bin/sh
google_q='http://google.com/search?btnG=Google&q'
cat <<_END_
Content-type: text/plain
W3m-control: GOTO $google_q=$QUERY_STRING
W3m-control: DELETE_PREVBUF
_END_

# 検索ワードは`$QUERY_STRING`に格納される。 スペースが`+`に書き換わる。クエリなので
