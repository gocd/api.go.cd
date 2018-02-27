module DescribeObjectHelper
  class ObjectDescription
    # `__name`, because the object can have a property called `name`
    # which causes problems because of the method_missing
    attr_reader :__name, :__options, :__properties
    def initialize(name, options={})
      @__name = name
      @__options = options
      @__properties  = []
    end

    def method_missing(method, *args)
      options = args.extract_options!
      raise "2 arguments are a must (type and description)" if args.length != 2

      name        = method
      type        = args.first
      description = args.last

      __add_property(name, type, description, options)
    end

    def __add_property(name, type, description, options={})
      @__properties << PropertyDescription.new(name, type, description, options)
    end

    def timeout(type, description, options={})
      __add_property('timeout', type, description, options)
    end

    def template_file
      File.expand_path('../../templates/describe_object.md.erb', __FILE__)
    end
  end

  class PropertyDescription
    attr_reader :name, :type, :description, :options
    def initialize(name, type, description, options={})
      @name        = name
      @type        = type
      @description = description
      @options     = options
    end
  end

  def describe_object(name, options={}, &block)
    object = ObjectDescription.new(name, options)
    object.instance_eval(&block)

    partial('partials/describe_object.md.erb', locals: {object: object})
  end

  def describe_sub_object(name, options={}, &block)
    object = ObjectDescription.new(name, options)
    object.instance_eval(&block)

    partial('partials/describe_sub_object.md.erb', locals: {object: object})
  end

  def describe_property(property)
    original_description = property.description.gsub(/\.$/, '') #remove any trailing period.

    if property.options[:list]
      original_description.gsub!(/\.$/, '')
      original_description << ':'
      original_description << '<ul>'
      property.options[:list].each do |list_item|
        original_description << '<li>'
        original_description << list_item.gsub(/\.$/, '') << '.'
        original_description << '</li>'
      end
      original_description << '</ul>'
    end

    if property.options[:one_of]
      original_description.gsub!(/\.$/, '')
      original_description << ". Can be one of " << property.options[:one_of].collect{|enum| "`#{enum}`" }.join(', ') << '.'
    end

    if property.options[:defaults_to]
      original_description.gsub!(/\.$/, '')
      original_description << ". Defaults to #{property.options[:defaults_to]}."
    end

    if property.options[:mandatory]
      original_description.gsub!(/\.$/, '')
      original_description << '. This attribute MUST be specified.'
    end

    if property.options[:since]
      original_description.gsub!(/\.$/, '')
      original_description << ". **Since v#{property.options[:since]}**."
    end

    # append a trailing period
    original_description.gsub!(/\.$/, '')
    original_description << '.'
  end

  def describe_property_type(property)
    type = property.type

    if type.is_a?(Array)
      type.collect {|t| "`#{t}`" }.join(" &#124; ")
    else
      type
    end
  end
end
