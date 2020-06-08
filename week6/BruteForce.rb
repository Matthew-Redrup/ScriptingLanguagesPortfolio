#!/usr/bin/ruby
require 'digest'
# Read the password hash
passwordHash = "5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5"
# Open the wordlist and repeat for each word
IO.foreach("wordlist.txt") do | word |
    word.chomp!
    # Hash the word
    wordlistHash = Digest::SHA256.hexdigest(word)
    puts("Trying password #{word}: #{wordlistHash}")
    # If the hash is the same as the correct password's hash then we have cracked the password!
    if(wordlistHash == passwordHash)
        puts("Password has been cracked! It was #{word}")
        return
    end
end