require 'qtwebkit'

class Local_Preview < Qt::Dialog
  def initialize(parent = nil, input)
    super(parent)    
    @web_view = Qt::WebView.new(self)
    puts Qt::Url::fromLocalFile(input.to_s)
    @web_view.setUrl(Qt::Url.new("file:///" + input.to_s))
  end
end