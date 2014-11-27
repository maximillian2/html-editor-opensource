require 'Qt4'
require_relative 'mainwindow_ui'
require_relative 'webpage_ui'
require_relative 'new_tab'

class Start < Qt::MainWindow
  ## File submenu slots
  slots 'new_file()', 'open_file()', 'save_file()', 'save_as()' 
  ## Edit submenu slots
  slots 'copy()', 'cut()', 'paste()'
  ## Tools submenu slots
  slots 'open_in_browser()', 'local_preview()' 
  ## View submenu slots
  slots 'toggle_statusbar(bool)', 'toggle_toolbar(bool)'
  ## Insert submenu slots
  slots 'insert_bold()', 'insert_italic()', 'insert_underline()', 'insert_image()', 'insert_link()', 'insert_unordered_list()', 'insert_ordered_list()'  
  
  ## General slots
  slots 'remove_tab(int)', 'update_line_count()'
  
  def initialize(parent = nil)
    super
    @ui = Ui_Editor.new
    @ui.setupUi(self)

    ## Connecting menu items    
    Qt::Object.connect(@ui.menu_browser_preview, SIGNAL('activated()'), self, SLOT('open_in_browser()'))
    Qt::Object.connect(@ui.menu_preview, SIGNAL('activated()'), self, SLOT('local_preview()'))
    Qt::Object.connect(@ui.menu_show_toolbar, SIGNAL('toggled(bool)'), self, SLOT('toggle_toolbar(bool)'))
    Qt::Object.connect(@ui.menu_show_statusbar, SIGNAL('toggled(bool)'), self, SLOT('toggle_statusbar(bool)'))
    Qt::Object.connect(@ui.menu_open_file, SIGNAL('activated()'), self, SLOT('open_file()'))
    Qt::Object.connect(@ui.menu_bold, SIGNAL('activated()'), self, SLOT('insert_bold()'))
    Qt::Object.connect(@ui.menu_italic, SIGNAL('activated()'), self, SLOT('insert_italic()'))
    Qt::Object.connect(@ui.menu_underline, SIGNAL('activated()'), self, SLOT('insert_underline()'))
    Qt::Object.connect(@ui.menu_image, SIGNAL('activated()'), self, SLOT('insert_image()'))
    Qt::Object.connect(@ui.menu_hyperlink, SIGNAL('activated()'), self, SLOT('insert_link()'))
    Qt::Object.connect(@ui.menu_unordered, SIGNAL('activated()'), self, SLOT('insert_unordered_list()'))
    Qt::Object.connect(@ui.menu_ordered, SIGNAL('activated()'), self, SLOT('insert_ordered_list()'))
    Qt::Object.connect(@ui.menu_copy, SIGNAL('activated()'), @ui.plainTextEdit, SLOT('copy()'))
    Qt::Object.connect(@ui.menu_cut, SIGNAL('activated()'), @ui.plainTextEdit, SLOT('cut()'))
    Qt::Object.connect(@ui.menu_paste, SIGNAL('activated()'), @ui.plainTextEdit, SLOT('paste()'))
    Qt::Object.connect(@ui.menu_undo, SIGNAL('activated()'), @ui.plainTextEdit, SLOT('undo()'))
    Qt::Object.connect(@ui.menu_redo, SIGNAL('activated()'), @ui.plainTextEdit, SLOT('redo()'))
    Qt::Object.connect(@ui.menu_save_file, SIGNAL('activated()'), self, SLOT('save_file()'))    
    Qt::Object.connect(@ui.menu_new_file, SIGNAL('activated()'), self, SLOT('new_file()'))
        
    ## Connecting toolbar items 
    Qt::Object.connect(@ui.toolbar_run, SIGNAL('activated()'), self, SLOT('local_preview()'))
    Qt::Object.connect(@ui.toolbar_open_file, SIGNAL('activated()'), self, SLOT('open_file()'))
    Qt::Object.connect(@ui.toolbar_bold, SIGNAL('activated()'), self, SLOT('insert_bold()'))
    Qt::Object.connect(@ui.toolbar_italic, SIGNAL('activated()'), self, SLOT('insert_italic()'))
    Qt::Object.connect(@ui.toolbar_underline, SIGNAL('activated()'), self, SLOT('insert_underline()'))
    Qt::Object.connect(@ui.toolbar_image, SIGNAL('activated()'), self, SLOT('insert_image()'))
    Qt::Object.connect(@ui.toolbar_hyperlink, SIGNAL('activated()'), self, SLOT('insert_link()'))
    Qt::Object.connect(@ui.toolbar_copy, SIGNAL('activated()'), @ui.plainTextEdit, SLOT('copy()'))
    Qt::Object.connect(@ui.toolbar_cut, SIGNAL('activated()'), @ui.plainTextEdit, SLOT('cut()'))
    Qt::Object.connect(@ui.toolbar_paste, SIGNAL('activated()'), @ui.plainTextEdit, SLOT('paste()'))
    Qt::Object.connect(@ui.toolbar_undo, SIGNAL('activated()'), @ui.plainTextEdit, SLOT('undo()'))
    Qt::Object.connect(@ui.toolbar_redo, SIGNAL('activated()'), @ui.plainTextEdit, SLOT('redo()'))
    Qt::Object.connect(@ui.toolbar_save_file, SIGNAL('activated()'), self, SLOT('save_file()'))
    Qt::Object.connect(@ui.toolbar_new_file, SIGNAL('activated()'), self, SLOT('new_file()'))
    
    ## Set default behaviour 
    @ui.menu_show_toolbar.setChecked(true)
    @ui.menu_show_statusbar.setChecked(true) 
    @ui.plainTextEdit.setTabStopWidth(20)   ## tab width
    @ui.plainTextEdit.setFocus
    Qt::Object.connect(@ui.tabWidget, SIGNAL('tabCloseRequested(int)'), self, SLOT('remove_tab(int)'))
    Qt::Object.connect(@ui.plainTextEdit, SIGNAL('cursorPositionChanged()'), self, SLOT('update_line_count()'))
  end
  
  def open_in_browser
    puts 'triggered open_in_browser'
    ## Bug here!!!
    #QDesktopServices::openUrl("http://www.yandex.ua")
    #system("xdg-open http://url.com") 
  end 
  
  def local_preview
    puts 'triggered local_preview'
    @web_page = WebPage.new
    @web_page.show
  end
  
  def new_file
    puts 'triggered new_file'
    @ui.tabWidget.addTab(New_Tab.new, "*unititled")
  end
  
  def open_file
    puts 'triggered open_file'
    @filedialog = Qt::FileDialog
    @open_file = @filedialog.getOpenFileName(self, "Open file", Qt::Dir::homePath, "HTML Document(*.html);;All files(*)")
    
    unless @open_file.nil?
       @ui.tabWidget.insertTab(@ui.tabWidget.count, New_Tab.new(@open_file), File.basename(@open_file))
       @ui.tabWidget.setCurrentIndex(@ui.tabWidget.count-1)
    end
  end
  
  def save_file
    puts 'triggered save_file'
    @savedialog = Qt::FileDialog.new(self)
    puts 'not creating filedialog object'
    @savedialog.setDefaultSuffix("html")  # => not working. wtf? 
    @save_file = @savedialog.getSaveFileName(self, "Save", Qt::Dir::homePath, "HTML Document(*.html);;All files(*)") 
    puts @save_file
    
    unless @save_file.nil?   
      File.open(@save_file, 'w') { |file| file.write(@ui.plainTextEdit.toPlainText) }
  #    puts @ui.tabWidget.currentWidget
#      @ui.tabWidget.widget(@ui.tabWidget.currentIndex).setModified(false)
      
      @ui.tabWidget.setTabText(@ui.tabWidget.currentIndex, File.basename(@save_file))
      puts "file #{@save_file} saved"
    end    
  end
  
  def toggle_statusbar(bool)
    @ui.statusbar.setVisible(bool)
  end
  
  def toggle_toolbar(bool)
    @ui.toolBar.setVisible(bool)
  end
  
  def insert_bold
    puts 'inserted bold tag' 

    @ui.plainTextEdit.moveCursor(Qt::TextCursor::End)        
    @ui.plainTextEdit.insertPlainText("<b></b>")
    cursor = @ui.plainTextEdit.textCursor 
    pos = cursor.position
    cursor.setPosition(pos-4)
    @ui.plainTextEdit.setTextCursor(cursor)
  end
  
  def insert_italic
    puts 'inserted italic tag' 
    
    @ui.plainTextEdit.moveCursor(Qt::TextCursor::End)        
    @ui.plainTextEdit.insertPlainText("<i></i>")
    cursor = @ui.plainTextEdit.textCursor 
    pos = cursor.position
    cursor.setPosition(pos-4)
    @ui.plainTextEdit.setTextCursor(cursor)
  end
  
  def insert_underline
    puts 'inserted underline tag' 
    
    @ui.plainTextEdit.moveCursor(Qt::TextCursor::End)        
    @ui.plainTextEdit.insertPlainText("<u></u>")
    cursor = @ui.plainTextEdit.textCursor 
    pos = cursor.position
    cursor.setPosition(pos-4)
    @ui.plainTextEdit.setTextCursor(cursor)  
  end
  
  def insert_image
    puts 'inserted image tag' 
    
    @ui.plainTextEdit.moveCursor(Qt::TextCursor::End)        
    @ui.plainTextEdit.insertPlainText("<img src = ''></img>")
    cursor = @ui.plainTextEdit.textCursor 
    pos = cursor.position
    cursor.setPosition(pos-6)
    @ui.plainTextEdit.setTextCursor(cursor)
  end
  
  def insert_link
    puts 'inserted link tag' 
    
    @ui.plainTextEdit.moveCursor(Qt::TextCursor::End)        
    @ui.plainTextEdit.insertPlainText("<a href = ''></a>")
    cursor = @ui.plainTextEdit.textCursor 
    pos = cursor.position
    cursor.setPosition(pos-4)
    @ui.plainTextEdit.setTextCursor(cursor)
  end
  
  def insert_unordered_list
    puts 'inserted unordered list tag' 
    
    @ui.plainTextEdit.moveCursor(Qt::TextCursor::End)        
    @ui.plainTextEdit.insertPlainText("<ul>\n\t<li></li>\n</ul>\n")
    cursor = @ui.plainTextEdit.textCursor 
    pos = cursor.position
    cursor.setPosition(pos-12)
    @ui.plainTextEdit.setTextCursor(cursor)
  end
  
  def insert_ordered_list
    puts 'inserted ordered tag' 

    @ui.plainTextEdit.moveCursor(Qt::TextCursor::End)        
    @ui.plainTextEdit.insertPlainText("<ol>\n\t<li></li>\n</ol>\n")
    cursor = @ui.plainTextEdit.textCursor 
    pos = cursor.position
    cursor.setPosition(pos-12)
    @ui.plainTextEdit.setTextCursor(cursor)
  end
  
  def modify_tab
    puts 'triggered modify_tab'
#     @ui.tabWidget.currentTabText += '*'
  end
  
  def modify_document
    File.open(@save_file, 'w') { |file| file.write(@ui.plainTextEdit.toPlainText) }
    puts 'rewritten the file'
  end
  
  def remove_tab(int)
    @ui.tabWidget.removeTab(int)
    puts "deleted tab ##{int}"
  end
  
  def update_line_count
    line_count = Qt::Label.new("Line: " + (@ui.plainTextEdit.textCursor.blockNumber+1).to_s) 
    @ui.statusbar.removeWidget(line_count)
    @ui.statusbar.addWidget(line_count)   
  end
end

if $0 == __FILE__
  app = Qt::Application.new(ARGV)
  myapp = Start.new
  myapp.show
  app.exec
end