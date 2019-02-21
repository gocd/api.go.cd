require 'pathname'

module RenderAllSubTopics
  def render_all_sub_topics(topic_name, options={})
    output = ActiveSupport::SafeBuffer.new
    files = Dir["#{@app.source_dir}/includes/#{topic_name}/_*"].sort
    if options[:reverse_order]
      files = files.reverse 
    end

    files.collect do |file|
      filepath = Pathname.new(file).relative_path_from(Pathname.new(@app.source_dir))
      dirname, basename = *filepath.split
      output.safe_concat render_partial("#{dirname.to_s}/#{basename.to_s.gsub(/^_/, '')}")
    end

    output
  end
end
