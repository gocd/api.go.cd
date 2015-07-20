module AvailableSinceHelper

  class AvailableSinceDescription
    attr_reader :version, :options, :old_versions
    def initialize(version, options)
      @version = version
      @options = options
      @old_versions = {}
    end

    def in_version(version, options={})
      @old_versions[version] = options
    end
  end

  def available_since(version, options={}, &block)
    since = AvailableSinceDescription.new(version, options)
    since.instance_eval(&block) if block_given?

    partial('partials/available_since.md.erb', locals: {since: since})
  end

end
