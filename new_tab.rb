class New_Tab < Qt::Widget
  
  ## Edit slots
  slots 'copy_text()', 'cut_text()', 'paste_text()', 'undo_text()', 'redo_text()'
  
  ## Insert slots
  slots 'bold()', 'italic()', 'underline()', 'link()', 'image()', 'ulist()', 'olist()' 
  
  ## General
#  slots 'focus_current(int)'
  
  def initialize(parent = nil, open_file)
    super(parent)
    
    @plainEdit = Qt::PlainTextEdit.new
    
    unless open_file.nil?
      @plainEdit.setPlainText(File.new(open_file).read)
    end
    
    @plainEdit.setTabStopWidth(20)
    
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
    @plainEdit.moveCursor(Qt::TextCursor::End)        
    @plainEdit.insertPlainText("<i></i>")
    cursor = @plainEdit.textCursor 
    pos = cursor.position
    cursor.setPosition(pos-4)
    @plainEdit.setTextCursor(cursor)
  end
 
  def underline
    puts 'inserted underline tag' 
    
    @plainEdit.moveCursor(Qt::TextCursor::End)        
    @plainEdit.insertPlainText("<u></u>")
    cursor = @plainEdit.textCursor 
    pos = cursor.position
    cursor.setPosition(pos-4)
    @plainEdit.setTextCursor(cursor)  
  end
  
  def image
    puts 'inserted image tag' 
    
    @plainEdit.moveCursor(Qt::TextCursor::End)        
    @plainEdit.insertPlainText("<img src = ''></img>")
    cursor = @plainEdit.textCursor 
    pos = cursor.position
    cursor.setPosition(pos-6)
    @plainEdit.setTextCursor(cursor)
  end
  
  def link
    puts 'inserted link tag' 
    
    @plainEdit.moveCursor(Qt::TextCursor::End)        
    @plainEdit.insertPlainText("<a href = ''></a>")
    cursor = @plainEdit.textCursor 
    pos = cursor.position
    cursor.setPosition(pos-4)
    @plainEdit.setTextCursor(cursor)
  end
  
  def ulist
    puts 'inserted unordered list tag' 
    
    @plainEdit.moveCursor(Qt::TextCursor::End)        
    @plainEdit.insertPlainText("<ul>\n\t<li></li>\n</ul>\n")
    cursor = @plainEdit.textCursor 
    pos = cursor.position
    cursor.setPosition(pos-12)
    @plainEdit.setTextCursor(cursor)
  end
  
  def olist
    puts 'inserted ordered tag' 

    @plainEdit.moveCursor(Qt::TextCursor::End)        
    @plainEdit.insertPlainText("<ol>\n\t<li></li>\n</ol>\n")
    cursor = @plainEdit.textCursor 
    pos = cursor.position
    cursor.setPosition(pos-12)
    @plainEdit.setTextCursor(cursor)
  end
  
#  def focus_current(int); puts 'catcha!'; @plainEdit.setFocus; end
  
  def plainText; @plainEdit.toPlainText; end
end