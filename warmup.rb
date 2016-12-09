# Run `rspec spec/the_warmup_spec.rb` to get started.

def say_hello
  "hello"
end

def scream(message)
  message.upcase!
  message+="!"
end

def first_char(word)
  letter = word.match(/^\w/).to_s
  letter.downcase
end

def polly_wanna(word)
  str=""
  3.times do
    str += word.match(/#{word}/).to_s
  end
  str
end

def after_you
  "no, after you"
end
