module GoCDHelpers
  def short_version(api_version_header)
    api_version_header.match(/application\/vnd.go.cd.(.*)\+json/i).captures[0]
  end

  def deprecated_api_message(opts={})
    concat_content("The #{opts[:api_name]} API version #{opts[:old_api_version]} has been deprecated. ")
    concat_content("This version will be removed in a release scheduled for #{opts[:removal_date_and_year]}. ")
    concat_content(link_to_versioned_api(opts[:new_api_available_in_release], opts[:api_section], "Version #{opts[:new_api_version]}"))
    concat_content(" of the API is available, and users are encouraged to use it.")
  end

  def removed_api_message(opts={})
    concat_content("The #{opts[:api_name]} API version #{opts[:old_api_version]} has been removed. ")
    concat_content(link_to_versioned_api(opts[:new_api_available_in_release], opts[:api_section], "Version #{opts[:new_api_version]}"))
    concat_content(" of the API is available, and users are encouraged to use it.")
  end

  def link_to_versioned_api(version, api_section, text='API')
    link_to text, "https://api.gocd.org/#{version}/##{api_section}"
  end
end