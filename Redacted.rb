# From code academy
puts "What is your message?"
text = gets.chomp
puts "What would you like to redact?"
redact = gets.chomp

words = text.split(" ")
words.each do |word|
    if word == redact
        print "REDACTED "
    else
        print word + " "
    end
end