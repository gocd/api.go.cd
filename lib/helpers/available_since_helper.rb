module AvailableSinceHelper

  class AvailableSinceDescription
    attr_reader :version, :options, :old_versions

    def initialize(version, options)
      @version      = version
      @options      = options
      @old_versions = {}
    end

    def in_version(version, options = {})
      @old_versions[version] = options
    end
  end

  class UpdatedToDescription
    attr_reader :api_version, :version

    def initialize(api_version, version)
      @api_version = api_version
      @version     = version
    end

    def api_version_text
      @api_version == nil ? "newer version" : "version v#{@api_version}"
    end
  end

  def available_since(version, options = {}, &block)
    since = AvailableSinceDescription.new(version, options)
    since.instance_eval(&block) if block_given?

    partial('partials/available_since.md.erb', locals: {since: since})
  end

  def updated_to(api_version, version)
    update = UpdatedToDescription.new(api_version, version)

    partial('partials/updated_to.md.erb', locals: {update: update})
  end

end
