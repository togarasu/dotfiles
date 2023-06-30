#!/usr/bin/env python3
import os

engine = {
        "default": (lambda q: f"http://google.com/search?btnG=Google&q={q}"),
        "e": (lambda q: f"https://ejje.weblio.jp/content/{q}"),
        "hex": (lambda q: f"https://hex.pm/packages?search={q}&sort=recent_downloads"),
        "u": (lambda q: q)
        }

def main():
    query_st = os.environ["QUERY_STRING"]
    action = parse_query(query_st, engine)

    print(
            "Content-type: text/plain",
            action,
            "W3m-control: DELETE_PREVBUF",
            sep="\n",
            end="\n\n")

def parse_query(query, engine=None):
    [key, *word] = query.split("+")
    if word == []:
        ans = engine["default"](query)
    elif furl := engine.get(key):
        ans = furl("+".join(word))
    else:
        ans = engine["default"](query)
    return "W3m-control: GOTO " + ans

main()
# 検索ワードは`$QUERY_STRING`に格納される。 スペースが`+`に書き換わる。クエリなので
