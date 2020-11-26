module StringToText
  class Attribute

    attr_reader :name, :type

    def initialize(name, type)
      @name, @type = name, type
    end

    def to_script
      "#{name}:#{type}" unless ["created_at","updated_at"].include?(name)
    end

    def self.parse(attribute)
      match = attribute.match(/t\.(\w+)\s+"(\w+)"/)
      if match
        name = match.captures[1]
        type = match.captures[0]
        Attribute.new(name, type)
      end
    end

  end
end
