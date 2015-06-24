require 'pathname'

module RenderAllSubTopics
  def render_all_sub_topics(topic_name)
    output = ActiveSupport::SafeBuffer.new
    Dir["#{current_page.app.source_dir}/includes/#{topic_name}/_*"].sort.collect do |file|
      filepath = Pathname.new(file).relative_path_from(Pathname.new(current_page.app.source_dir))
      dirname, basename = *filepath.split
      output.safe_concat render_partial("#{dirname.to_s}/#{basename.to_s.gsub(/^_/, '')}")
    end

    output
  end
end
