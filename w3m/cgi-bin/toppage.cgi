#!/usr/bin/python3
import os

def main():
  print("Content-type: text/plain")
  print(command(commands))
  print("")

commands = [
  f'GOTO "file:///home/{os.environ["USER"]}/.w3m/src/toppage.html"',
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
