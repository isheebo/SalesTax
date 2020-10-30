## Running the Samples
For manual testing, you can uncomment this line `# puts App.new(ARGV).generate_receipt` in `lib/app.rb` and run any of these on the terminal.

```sh
ruby lib/app.rb "1 book at 12.49" "1 music CD at 14.99" "1 chocolate bar at 0.85"
ruby lib/app.rb "1 imported box of chocolates at 10.00" "1 imported bottle of perfume at 47.50"
ruby lib/app.rb "1 imported bottle of perfume at 27.99" "1 bottle of perfume at 18.99" "1 packet of headache pills at 9.75" "1 box of imported chocolates at 11.25"
``` 


## Running the tests
It is assumed that you have rspec installed. If you don't, you can install rspec globally using
```sh
gem install rspec
```

run tests using 
```sh 
rspec 
```
