require './lib/chunk'

class List_Converter

  def unordered_list_to_html(markdown)
    markdown = markdown.split("\n")
    html_lines = markdown.map do |line|
      "\t<li>#{line[2..-1]}</li>\n"
    end
    "<ul>\n#{html_lines.join}</ul>"
  end

  def ordered_list_to_html(markdown)
    markdown = markdown.split("\n")
    html_lines = markdown.map do |line|
      "\t<li>#{line[3..-1]}</li>\n"
    end
    "<ol>\n#{html_lines.join}</ol>"
  end
end
