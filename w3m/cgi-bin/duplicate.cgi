#!/usr/bin/env python3
import os

def main():
    url = os.environ["W3M_URL"]
    current_line = os.environ["W3M_CURRENT_LINE"]
    print("Content-type: text/plain",
          f"W3M-control: GOTO {url}",
          f"W3M-control: GOTO_LINE {current_line}",
          "W3m-control: DELETE_PREVBUF",
          "W3M-control: PREV",
          "W3M-control: CENTER_V",
          "W3M-control: NEXT",
          sep="\n",
          end="\n\n")
main()
