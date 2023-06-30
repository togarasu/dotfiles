#!/usr/bin/python3

import os

def main():
  print("Content-type: text/plain")
  print(command(commands))
  print("")

word = os.environ.get("W3M_CURRENT_WORD", "NOT FOUND")

commands = [
  f'GOTO "https://ejje.weblio.jp/content/{word}"',
  f"GOTO_LINE 29",
  "DELETE_PREVBUF",
  "NEXT_LINK"
]

def command(coms):
  str = 'W3m-control: COMMAND '
  for com in coms:
    str += (com + "; ")
  return str
  
if __name__ == "__main__":
    main()
