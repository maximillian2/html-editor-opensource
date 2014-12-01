class New_Tab < Qt::Widget
  
  ## Edit slots
  slots 'copy_text()', 'cut_text()', 'paste_text()', 'undo_text()', 'redo_text()'
  
  ## Insert slots
  slots 'bold()', 'italic()', 'underline()', 'link()', 'image()', 'ulist()', 'olist()' 
  
  attr_reader :plainTextEdit
  
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
  
  def copy_text; @plainEdit.copy(); end
  def cut_text; @plainEdit.cut(); end
  def paste_text; @plainEdit.paste(); end
  def undo_text; @plainEdit.undo(); end
  def redo_text; @plainEdit.redo(); end
  
  def bold
    @plainEdit.moveCursor(Qt::TextCursor::End)        
    @plainEdit.insertPlainText("<b></b>")
    cursor = @plainEdit.textCursor 
    pos = cursor.position
    cursor.setPosition(pos-4)
    @plainEdit.setTextCursor(cursor)
  end
  
  def italic
  
  end
 
end