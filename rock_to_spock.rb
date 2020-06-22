VALID_CHOICES = %w(rock paper scissors lizard Spock)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(key, value)
  outcomes = {
    rock: ['scissors', 'lizard'],
    paper: ['Spock', 'rock'],
    scissors: ['lizard', 'paper'],
    lizard: ['Spock', 'paper'],
    Spock: ['rock', 'scissors']
  }
  if outcomes[key.to_sym].include?(value)
    true
  else false
  end
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

player_score = 0
computer_score = 0
choice = ''

prompt("First to five wins the match!")
loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    prompt("Use the first lowercase letter for each choice for speed.")
    prompt("Capitalize \"Spock.\"")
    initial_input = Kernel.gets().chomp().split('').first
    VALID_CHOICES.each do |word|
      choice = word if word.start_with?(initial_input)
    end

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose:#{choice}; Computer chose:#{computer_choice}")
  display_results(choice, computer_choice)

  if win?(choice, computer_choice) == true
    player_score += 1
  elsif win?(computer_choice, choice) == true
    computer_score += 1
  end

  prompt("The score is: Player: #{player_score}, Computer: #{computer_score}")

  if player_score == 5
    prompt("You are the grand winner!")
    break
  elsif computer_score == 5
    prompt('The computer is the grand winner!')
    break
  else next
  end
end

