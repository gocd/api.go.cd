module ShortVersion
  def short_version(api_version_header)
    api_version_header.match(/application\/vnd.go.cd.(.*)\+json/i).captures[0]
  end
end