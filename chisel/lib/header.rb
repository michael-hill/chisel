require './lib/chunk'

class Header

  def header_tags(chunk)
    hash_count = chunk.count("#")
    header_output = chunk.delete("#")
    "<h#{hash_count}>#{header_output}</h#{hash_count}>"
  end
end
