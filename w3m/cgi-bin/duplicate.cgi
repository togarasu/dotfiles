#!/usr/bin/env python3
import gzip
import os
import pathlib
import sys

# w3mが保存している文章をそのまま自身のbufferに転写する。
# カスな点としてURLがcgiファイルのものになってしまう
# あとgzipされてると若干開きが遅い。読み直し程じゃないしbufferの変更が起こらない点では有利だが、複製して更新したいとかだと微問題
def main():
    url = pathlib.Path(os.environ["W3M_SOURCEFILE"])
    current_line = os.environ["W3M_CURRENT_LINE"]
    # 保存ファイルが`.gz`だったら展開して表示
    # `.gz`じゃなかったら`.html`みたいな書き方なのであんまりよろしくない
    if url.suffix == ".gz":
        with gzip.open(url, mode="rt") as f:
            content = f.read()
    else:
        content = url.read_text()
    print("Content-type: text/html",
          # 再読み込み形式でやった場合。多分いらんやつ
          # f"W3M-control: GOTO {url}",
          f"W3M-control: GOTO_LINE {current_line}",
          # "W3M-control: DELETE_PREVBUF",
          # "W3M-control: PREV",
          # "W3M-control: CENTER_V",
          # "W3M-control: NEXT",
          sep="\n",
          end="\n\n")
    print(content)
main()
