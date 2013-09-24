# Noicycle

Utility gem to calculate dates involved in a Tower of Hanoi backup rotation method.

## Installation

Add this line to your application's Gemfile:

    gem 'noicycle'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install noicycle

## Usage

To get the dates of a 7-tape backup from a give reference date:

    ref_date = Date.parse("5th May 2013")
    noicycle.tapes(ref_date, 7)
    
The result is a Hash that contains tape-keys and date values. For instance, on 24th september 2013, the upper code returned the following hash:

    {
        2=>#<Date: 2013-09-24 ((2456560j,0s,0n),+0s,2299161j)>, 
        1=>#<Date: 2013-09-23 ((2456559j,0s,0n),+0s,2299161j)>, 
        3=>#<Date: 2013-09-22 ((2456558j,0s,0n),+0s,2299161j)>, 
        4=>#<Date: 2013-09-18 ((2456554j,0s,0n),+0s,2299161j)>, 
        7=>#<Date: 2013-09-10 ((2456546j,0s,0n),+0s,2299161j)>, 
        5=>#<Date: 2013-08-25 ((2456530j,0s,0n),+0s,2299161j)>, 
        6=>#<Date: 2013-08-09 ((2456514j,0s,0n),+0s,2299161j)>
    }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
