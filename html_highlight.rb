class HTML_Highlighter < Qt::SyntaxHighlighter
  def initialize(parent = nil)
    super
    @patterns = Hash.new
    @patterns[:html] = ["<[\/]?html>", "darkCyan"]
    @patterns[:body] = ["<[\/]?(body|head)>", "darkCyan"]
    @patterns[:title] = ["<[\/]?title>", "darkCyan"]
    @patterns[:two_letter] = ["<[\/]?(br|ul|ol)>", "darkCyan"]
    @patterns[:sub_two] = ["<[\/]?(li|td|th)>", "cyan"]
    @patterns[:h] = ["<[\/]?h[1-6]>", "darkCyan"]
    @patterns[:doctype] = ["<!DOCTYPE.[a-z].*>", "darkCyan"]
    @patterns[:comment] = ["<!--[a-z].*-->", "gray"]
    @patterns[:one_letter_tags] = ["<[\/]?[auipbq]([^>]*)>", "darkCyan"]
    @patterns[:quote_marks] = ["[\'\"][A-Za-z].*[\'\"]", "green"]
    # @patterns[:all] = ["<[\/]?[A-Za-z]>", "darkCyan"]
    # @patterns[:options] = ["(\S+).=", "green"]
    # TODO: finish 'em
  end

  def highlightBlock(text)
    @patterns.each do |type, specs|
    	puts "type: #{type}"
    	puts "type: #{specs.inspect}"
    	highlightColor(text, specs.first, specs.last)
    end
  end

  def highlightColor(text, pattern, color)
    myClassFormat = Qt::TextCharFormat.new
    puts "this color is #{color}"
    puts "color #{color} is valid = " + Qt::Color.new(color).isValid.to_s
    myClassFormat.setForeground(Qt::Brush.new(Qt::Color.new(color)))
    myClassFormat.setFontWeight(Qt::Font::Bold)

    # Use Qt matcher to support UTF-8 encoding
    matcher = Qt::RegExp.new(pattern, Qt::CaseInsensitive)
    index = matcher.indexIn(text)
    until index < 0
      length = matcher.matchedLength
      setFormat(index, length, myClassFormat)
      index = matcher.indexIn(text, index + length)
    end
  end
end
