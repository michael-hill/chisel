require 'minitest/autorun'
require 'minitest/pride'
require './lib/header'
require './lib/paragraph'
require './lib/list_converter'
require 'pry'


class ChunkTest < Minitest::Test
  def test_it_can_convert_markdown_string_to_html
    markdown = '# My Life in Desserts'
    expected_html = '<h1>My Life in Desserts</h1>'
    actual_html = '<h1>My Life in Desserts</h1>'
    html = Chunk.new(markdown).to_html
    assert_equal expected_html, actual_html
  end

  def test_blank_lines_seperate_chunks
    markdown = "a\nb\n\nc\n\n\nd"
    actual_chunks = Chunk.new("").string_to_chunks(markdown)
    expected_chunks = ["a\nb", "c", "d"]
    assert_equal expected_chunks, actual_chunks
  end
end
