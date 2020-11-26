namespace :string_to_text do
  # https://www.pgrs.net/2008/03/13/alphabetize-schema-rb-columns/
  task :generate do
    StringToText::CLI.start(*ARGV)
  end
end