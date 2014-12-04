require 'qtwebkit'

class Local_Preview < Qt::Dialog
  def initialize(parent = nil, input)
    super(parent)    
    puts "got file: #{input}"
    @web_view = Qt::WebView.new
    @web_view.load(Qt::Url::fromUserInput(input))
  	@web_view.show
  end
end