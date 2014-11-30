class NoFileOpen < Qt::Widget
  def initialize(parent = nil)
    super(parent)
    
    @label = Qt::Label.new("No files open")
    @label.setAlignment(Qt::AlignHCenter)
    @new_file_linkbutton = Qt::CommandLinkButton.new("New file", "Create a new empty file.")
    @open_file_linkbutton = Qt::CommandLinkButton.new("Open file", "Open a saved file.")
    
    self.layout = Qt::VBoxLayout.new do |m|
        m.addWidget(@label)
        m.addWidget(@new_file_linkbutton)
        m.addWidget(@open_file_linkbutton)
    end
  end
end