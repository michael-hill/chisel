require 'minitest/autorun'
require 'minitest/pride'
require './lib/header'

class HeaderTest < Minitest::Test

  def test_it_can_add_header_tags
    headers = Header.new
    assert_equal "<h1>Header one</h1>", headers.header_tags("#Header one")
  end

  def test_it_can_determine_header_size_based_on_number_of_hashes
    headers = Header.new
    assert_equal "<h2>Header two</h2>", headers.header_tags("##Header two")
    assert_equal "<h3>Header three</h3>", headers.header_tags("###Header three")
    assert_equal "<h4>Header four</h4>", headers.header_tags("####Header four")
    assert_equal "<h5>Header five</h5>", headers.header_tags("#####Header five")
    assert_equal "<h6>Header six</h6>", headers.header_tags("######Header six")
  end
end
