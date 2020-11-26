module StringToText
  class Help
    ## Usage help text to print in all platforms
    GENERIC_HELP = <<-END_OF_HELP

Usage: string_to_text [options]
Generate a rails string_to_text script for a given schema.rb
 -h             Displays help.
 -p <path>      It specifies a path to a folder or to a file.
 -c             Will copy the script to your clipboard. Requires xclip be installed on Linux.

END_OF_HELP

    ## Windows specific usage help text
    WINDOWS_HELP = <<-WINDOWS_SAMPLE
Examples:
string_to_text
string_to_text -p C:\\Users\\JohnDoe
string_to_text -c -p C:\\Users\\JohnDoe\\Documents\\schema.rb
WINDOWS_SAMPLE

    ## Linux specific usage help text
    LINUX_HELP = <<-LINUX_SAMPLE
Examples:
string_to_text
string_to_text -c -p ~/work/rails/my_app
string_to_text -c -p ~/work/rails/my_app/db/schema.rb
LINUX_SAMPLE

    def self.message
      return GENERIC_HELP +
      case platform
      when /darwin/i then LINUX_HELP
      when /linux/i  then LINUX_HELP
      when /mingw/i  then WINDOWS_HELP
      when /win/i    then WINDOWS_HELP
      end
    end

    def self.platform
      RUBY_PLATFORM
    end
  end
end