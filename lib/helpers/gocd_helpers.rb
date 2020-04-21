module GoCDHelpers
  def short_version(api_version_header)
    api_version_header.match(/application\/vnd.go.cd.(.*)\+json/i).captures[0]
  end

  def deprecated_api_message(opts = {})
    if [nil, 'unversioned'].include?(opts[:old_api_version])
      concat_content("The unversioned #{opts[:api_name]} API has been deprecated in GoCD release v#{opts[:deprecated_in_release]}. ")
    else
      concat_content("The #{opts[:api_name]} API version #{opts[:old_api_version]} has been deprecated in GoCD release v#{opts[:deprecated_in_release]}. ")
    end

    if opts[:removal_date_and_year] && opts[:removal_in_release]
      raise "Please specify either 'removal_date_and_year' or 'removal_in_release'"
    end

    if opts[:removal_date_and_year]
      concat_content("This version will be removed in GoCD release scheduled for #{opts[:removal_date_and_year]}. ")
    end

    if opts[:removal_in_release]
      concat_content("This version will be removed in GoCD release v#{opts[:removal_in_release]}. ")
    end

    unless [nil].include?(opts[:new_api_version])
      concat_content(link_to_versioned_api(opts[:api_section], "Version #{opts[:new_api_version]}"))
      concat_content(" of the API is available, and users are encouraged to use it.")
    end
  end

  def removed_api_message(opts = {})
    if [nil, 'unversioned'].include?(opts[:old_api_version])
      concat_content("The unversioned #{opts[:api_name]} API has been removed. ")
    else
      concat_content("The #{opts[:api_name]} API version #{opts[:old_api_version]} has been removed. ")
    end

    concat_content(link_to_versioned_api(opts[:api_section], "Version #{opts[:new_api_version]}"))
    concat_content(" of the API is available, and users are encouraged to use it.")
  end

  def link_to_versioned_api(api_section, text = 'API')
    link_to text, "##{api_section}"
  end
end
