require 'io/console'

def ask(question)
  print question
  puts choice = $stdin.getch
  choice
end
