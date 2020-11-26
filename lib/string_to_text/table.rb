module StringToText
  require 'active_support/inflector'
  # require "rails/generators/actions/create_migration"

  # fetch table names and convert them to a string_to_textsyntax

  class Table

    # include ::Rails::Generators::Migration

    attr_reader :attributes, :name

    def initialize(name, attributes)
      @name, @attributes = name, attributes
    end

    def to_script
      script = []
      attributes.reject { |a| a.name.nil? || a.name.empty? || a.type != 'string' }.each do |attr|
        script << "change_column :#{name}, :#{attr.name}, :text"
        script << "\n"
      end
      script
      # create_migration
    end

    def self.parse(table_data)
      return unless name = table_data[/table "([^"]+?)"/]
      name = $1
      table_fields = table_fields_of(table_data)
      Table.new(name, table_fields)
    end

    private
    def self.table_fields_of(table_data)
      table_data.lines.to_a.select { |line| line =~ /t\.(?!index)\w+/ }.map { |att| Attribute.parse(att) }
    end

  end
end
