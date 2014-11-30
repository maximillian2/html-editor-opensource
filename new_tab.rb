class New_Tab < Qt::Dialog
  def initialize(parent = nil, open_file)
    super(parent)
    
    @plainEdit = Qt::PlainTextEdit.new
    unless open_file.nil?
      @plainEdit.setPlainText(File.new(open_file).read)
    end
    
    self.layout = Qt::VBoxLayout.new do |m|
        m.addWidget(@plainEdit)
    end
  end
end