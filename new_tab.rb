class New_Tab < Qt::Widget
  def initialize(parent = nil, open_file)
    super(parent)
    
    label = Qt::Label.new("hello")
    plainEdit = Qt::PlainTextEdit.new
    plainEdit.setPlainText(File.new(open_file).read)
    self.layout = Qt::VBoxLayout.new do |m|
      m.addWidget(plainEdit)
    end
  end
end