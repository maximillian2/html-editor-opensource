require 'qtwebkit'

class Integer
  def to_filesize
    {
      ' bytes'  => 1024,
      ' kilobytes' => 1024 * 1024,
      ' megabytes' => 1024 * 1024 * 1024,
    }.each_pair { |e, s| return "#{s / self}#{e}" if self < s }
  end
end


class Local_Preview < Qt::Dialog
  def initialize(parent = nil, input)
    super(parent)    
    setWindowTitle("Previewing #{input}...")

    @vert = Qt::VBoxLayout.new

    @label = Qt::Label.new("File size: #{File.size(input).to_filesize}")
    puts "got file: #{input}"
    @web_view = Qt::WebView.new
    @web_view.load(Qt::Url::fromUserInput(input))

    @vert.addWidget(@web_view)
    @vert.addWidget(@label)

    setLayout(@vert)
  end
end