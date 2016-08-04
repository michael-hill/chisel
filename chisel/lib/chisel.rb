require './lib/chunk'
require './lib/header'
require './lib/paragraph'
require './lib/list_converter'

class Chisel

  markdown_file = ARGV[0]
  html_file = ARGV[1]

  markdown = File.read(markdown_file)
  html = Chunk.new(markdown).to_html

  File.write(html_file, html)

  num_lines_of_markdown = markdown.lines.count
  num_lines_of_html = html.lines.count
puts "Converted #{markdown_file} (#{num_lines_of_markdown} lines) to #{html_file} (#{num_lines_of_html} lines)"
end
