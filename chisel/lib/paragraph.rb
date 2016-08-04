require './lib/chunk'


class Paragraph
  def paragraph_tag(chunk)
    "<p>\n#{indent(text_to_html(chunk))}</p>"
  end

  def indent(string)
    string.lines.map { |line| "  #{line.chomp}\n" }.join
  end

  def text_to_html(text)
    text.gsub("**").with_index { |_, index| "<#{'/' if index.odd?}strong>" }
    .gsub("*").with_index { |_, index| "<#{'/' if index.odd?}em>" }
    .gsub("&", "&amp;")
    end
end
