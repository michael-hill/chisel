require 'minitest/autorun'
require 'minitest/pride'
require './lib/chunk'
require './lib/list_converter'

class ListConverterTest < Minitest::Test

  def test_it_converts_unordered_lists
    expected_html = "<ul>\n\t<li>Sushi</li>\n\t<li>Barbeque</li>\n\t<li>Mexican</li>\n</ul>"
    actual_html = List_Converter.new.unordered_list_to_html("* Sushi\n* Barbeque\n* Mexican")
    assert_equal expected_html, actual_html
  end

  def test_it_converts_ordered_lists
    expected_html = "<ol>\n\t<li>Sushi</li>\n\t<li>Barbeque</li>\n\t<li>Mexican</li>\n</ol>"
    actual_html = List_Converter.new.ordered_list_to_html("1. Sushi\n2. Barbeque\n3. Mexican")
    assert_equal expected_html, actual_html
  end
end
