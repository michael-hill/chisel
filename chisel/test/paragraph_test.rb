require 'minitest/autorun'
require 'minitest/pride'
require './lib/chunk'
require './lib/paragraph'

class ParagraphTest < Minitest::Test

  def test_it_converts_paragraph
    markdown_chunk = "line 1"
    actual_chunk = Paragraph.new.paragraph_tag(markdown_chunk)
    html_chunk = "<p>\n  line 1\n</p>"
    assert_equal html_chunk, actual_chunk
  end

  def test_it_can_indent
    markdown_chunk = "This is a sentence."
    actual_chunk = Paragraph.new.indent(markdown_chunk)
    html_chunk ="  This is a sentence.\n"
    assert_equal html_chunk, actual_chunk
  end
end
