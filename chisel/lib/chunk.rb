require './lib/paragraph'
require './lib/header'

class Chunk

  def initialize(markdown)
    @markdown = markdown
    @header = Header.new
    @paragraph = Paragraph.new
    @list_converter = List_Converter.new
  end

  def chunks_to_string(chunks)
    chunks.join("\n\n") << "\n"
  end

  def string_to_chunks(string)
    string.split(/\n\n+/)
  end

  def to_html
    html_chunks = string_to_chunks(@markdown).map { |chunk| chunk_to_html chunk}
    chunks_to_string html_chunks
  end

  def chunk_to_html(markdown_chunk)
    if header?(markdown_chunk)
    @header.header_tags(markdown_chunk)
      elsif unordered_list?(markdown_chunk)
        @list_converter.unordered_list_to_html(markdown_chunk)
      elsif ordered_list?(markdown_chunk)
        @list_converter.ordered_list_to_html(markdown_chunk)
      else
        @paragraph.paragraph_tag(markdown_chunk)
      end
  end

  def header?(chunk)
  chunk[0] == "#"
  end

  def unordered_list?(chunk)
    chunk[0..1] == "* "
  end

  def ordered_list?(chunk)
    characters = chunk.chars
    if characters.first.match(/[0-9]/) && characters[0..1].include?(".")
      true
    else
      false
    end
  end
end
