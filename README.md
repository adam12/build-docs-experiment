# Building Docs experiment

This contains the build log for an experiment that spanned a few months,
where every single Rubygem had it's documentation built with yard, and
then tarball+gzipped.

The time to build the documentation, and the size of the resulting tarball
was then written to this file (and sadly, not a sqlite database or similar
at the time).

## Analytics

Run the `convert.rb` script to boot a REPL to gain some insights.

```
# Number of gems build
DB[:results].count

# Gem with the largest compressed documentation
DB[:results].order(Sequel.desc(:size)).first

# Gem which took the longest to build
DB[:results].order(Sequel.desc(:duration)).first
```
