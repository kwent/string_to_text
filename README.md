# String to text (Convert your string columns to text for PostgreSQL)

[![Build Status](https://github.com/kwent/string_to_text/workflows/build/badge.svg?branch=master)](https://github.com/kwent/string_to_text/actions)

This Gem generates Rails migration instructions to change any `string` columns to `text` for `PostgreSQL` based on a Rails database schema you already have. Unlike traditional migrations, which modify the database as they generate Rails migration code, this Gem reads the schema for your database and generates the Rails code which matches your database's existing columns.

Generally, there is no downside to using `text` in terms of performance/memory. On the contrary: `text` is the optimum. Other types have more or less relevant downsides. `text` is literally the "preferred" type among string types in the `PostgreSQL` type system, which can affect function or operator type resolution.

More info available: https://stackoverflow.com/questions/20326892/any-downsides-of-using-data-type-text-for-storing-strings

This Gem does not modify anything; it simply prints a string which you can then use to invoke the Rails generators, and optionally copies the string to your clipboard. Generated string commands available are:

```bash
change_column :users, :name, :text
change_column :coupons, :code, :text
```

Use your schema.rb file from `<rails_app>/db` or generated with `rake db:schema:dump`. You can optionally rename schema.rb to `schema_your_fav_name.rb` and it will still be found. Unique schema file names will prevent schema.rb from being overwritten if you use migrations and run `rake db:migrate`.

String to Text output looks like this:

    change_column :users, :name, :text

It's possible to generate scripts for all your tables at once. Just enter `*` when selecting the table.

## Installation

Assuming that you have rubygems-bundler installed, just type:

    gem install string_to_text

## Usage

```
Usage: string_to_text [options]
Generate a rails string_to_text script for a given schema.rb
 -h             Displays help.
 -p <path>      It specifies a path to a folder or to a file.
 -c             Will copy the script to your clipboard. Requires xclip be installed on Linux.

Examples:
string_to_text
string_to_text -c -p ~/work/rails/my_app
string_to_text -c -p ~/work/rails/my_app/db/schema.rb

```

## Migrations

String to Text is set up by default to support creating migration instructions for your existing database, presuming that you have generated schema.rb with `rake db:schema:dump`.

## To install xclip on Linux

    sudo apt-get install xclip

## Contributing

    Want to contribute? Great!

1. Fork it.
2. Create a branch (`git checkout -b my_string_to_text`)
3. Commit your changes (`git commit -am "Added great stuff"`)
4. Push to the branch (`git push origin my_string_to_text`)
5. Open a [Pull Request][1]
6. That's all!!

[1]: http://github.com/kwent/string_to_text/pulls

## Collaborate

    If you want to collaborate, please send me an email, or just create an issue or pull request.

## Credits

Engine forked from the awesome https://github.com/frenesim/schema_to_scaffold
