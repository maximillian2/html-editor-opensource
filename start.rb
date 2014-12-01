require 'Qt4'
require_relative 'mainwindow_ui'
require_relative 'webpage_ui'
require_relative 'new_tab'
require_relative 'local_preview'
require_relative 'no_file_open'

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
  ## Help submenu slot
  slots 'about_program()'
  
  ## General slots
  slots 'remove_tab(int)', 'update_line_count()', 'update_connects(int)'
      
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
    Qt::Object.connect(@ui.menu_bold, SIGNAL('activated()'), @ui.tabWidget.currentWidget, SLOT('bold()'))
#    Qt::Object.connect(@ui.menu_italic, SIGNAL('activated()'), self, SLOT('insert_italic()'))
#    Qt::Object.connect(@ui.menu_underline, SIGNAL('activated()'), self, SLOT('insert_underline()'))
#    Qt::Object.connect(@ui.menu_image, SIGNAL('activated()'), self, SLOT('insert_image()'))
 #   Qt::Object.connect(@ui.menu_hyperlink, SIGNAL('activated()'), self, SLOT('insert_link()'))
  #  Qt::Object.connect(@ui.menu_unordered, SIGNAL('activated()'), self, SLOT('insert_unordered_list()'))
  #  Qt::Object.connect(@ui.menu_ordered, SIGNAL('activated()'), self, SLOT('insert_ordered_list()'))
    Qt::Object.connect(@ui.menu_save_file, SIGNAL('activated()'), self, SLOT('save_file()'))    
    Qt::Object.connect(@ui.menu_save_file, SIGNAL('activated()'), self, SLOT('save_file()'))    
    Qt::Object.connect(@ui.menu_new_file, SIGNAL('activated()'), self, SLOT('new_file()'))
    Qt::Object.connect(@ui.menu_about_program, SIGNAL('activated()'), self, SLOT('about_program()'))
        
    ## Connecting toolbar items 
    Qt::Object.connect(@ui.toolbar_run, SIGNAL('activated()'), self, SLOT('local_preview()'))
    Qt::Object.connect(@ui.toolbar_open_file, SIGNAL('activated()'), self, SLOT('open_file()'))
    Qt::Object.connect(@ui.toolbar_bold, SIGNAL('activated()'), @ui.tabWidget.currentWidget, SLOT('bold()'))
  #  Qt::Object.connect(@ui.toolbar_italic, SIGNAL('activated()'), self, SLOT('insert_italic()'))
 #   Qt::Object.connect(@ui.toolbar_underline, SIGNAL('activated()'), self, SLOT('insert_underline()'))
 #   Qt::Object.connect(@ui.toolbar_image, SIGNAL('activated()'), self, SLOT('insert_image()'))
  #  Qt::Object.connect(@ui.toolbar_hyperlink, SIGNAL('activated()'), self, SLOT('insert_link()'))
    Qt::Object.connect(@ui.toolbar_save_file, SIGNAL('activated()'), self, SLOT('save_file()'))
    Qt::Object.connect(@ui.toolbar_new_file, SIGNAL('activated()'), self, SLOT('new_file()'))
    
    ## Connecting widget with command link buttons
    Qt::Object.connect(@ui.new_file_linkbutton, SIGNAL('clicked()'), self, SLOT('new_file()'))
    Qt::Object.connect(@ui.open_file_linkbutton, SIGNAL('clicked()'), self, SLOT('open_file()'))
         
    ## Set default behaviour
    @ui.no_file_widget.setVisible(true)
    @ui.tabWidget.setVisible(false) 
    @current_file = ''  
    @ui.menu_show_toolbar.setChecked(true)
    @ui.menu_show_statusbar.setChecked(true) 
    # FIXME
#    @ui.plainTextEdit.setTabStopWidth(20)   ## tab width
#    @ui.plainTextEdit.setFocus
    Qt::Object.connect(@ui.tabWidget, SIGNAL('tabCloseRequested(int)'), self, SLOT('remove_tab(int)'))
#    Qt::Object.connect(@ui.plainTextEdit, SIGNAL('cursorPositionChanged()'), self, SLOT('update_line_count()'))
    Qt::Object.connect(@ui.tabWidget, SIGNAL('currentChanged(int)'), self, SLOT('update_connects(int)'))
  end
  
  ## FILE SUBMENU SLOTS
  def new_file
    puts 'triggered new_file'
    @ui.tabWidget.setVisible(true)
    @ui.no_file_widget.setVisible(false)

    @ui.tabWidget.addTab(New_Tab.new(self, nil), "*untitled")
    @ui.toolbar_save_file.setEnabled(true) if @ui.tabWidget.count > 0
  end
  
  def open_file
    puts 'triggered open_file'
    @ui.tabWidget.setVisible(true)
    @ui.no_file_widget.setVisible(false)

    @filedialog = Qt::FileDialog
    @open_file = @filedialog.getOpenFileName(self, "Open file", Qt::Dir::homePath, "HTML Document(*.html);;All files(*)")
    ## FIXME
    @current_file = @filedialog
    
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
    @current_file = @save_file
    
    unless @save_file.nil?   
#      File.open(@save_file, 'w') { |file| file.write(@ui.plainTextEdit.toPlainText) }
  #    puts @ui.tabWidget.currentWidget
#      @ui.tabWidget.widget(@ui.tabWidget.currentIndex).setModified(false)
      
      @ui.tabWidget.setTabText(@ui.tabWidget.currentIndex, File.basename(@save_file))
      puts "file #{@save_file} saved"
    end    
  end

  ## TOOLS SUBMENU SLOTS
  def open_in_browser
    puts 'triggered open_in_browser'
    ## Bug here!!!
   # @desktop = Qt::DesktopServices.new
   # @desktop.openUrl("http://www.yandex.ua")
    #system("xdg-open http://url.com") 
  end 
  
  def local_preview
    puts 'triggered local_preview'
    puts "try to open #{@open_file}"
    @web_page = Local_Preview.new(@current_file)
    @web_page.exec
  end
  
  ## INSERT SUBMENU SLOTS
  ## TODO: change plainTextEdit to tabWidget.currentWidget 
  def insert_bold
    puts 'inserted bold tag' 

    #@ui.tabWidget.currentWidget.
    @ui.tabWidget.currentWidget.plainTextEdit.moveCursor(Qt::TextCursor::End)        
    @ui.tabWidget.currentWidget.plainTextEdit.insertPlainText("<b></b>")
    cursor = @ui.tabWidget.currentWidget.plainTextEdit.textCursor 
    pos = cursor.position
    cursor.setPosition(pos-4)
    @ui.tabWidget.currentWidget.plainTextEdit.setTextCursor(cursor)
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
  
  ## VIEW SUBMENU SLOTS
  def toggle_statusbar(bool)
    @ui.statusbar.setVisible(bool)
  end
  
  def toggle_toolbar(bool)
    @ui.toolBar.setVisible(bool)
  end

  ## HELP SUBMENU SLOTS
  def about_program
  
  end
  
  ## GENERAL SLOTS
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
    if @ui.tabWidget.count < 1
      @ui.toolbar_save_file.setEnabled(false) 
      @ui.no_file_widget.setVisible(true)
      @ui.tabWidget.setVisible(false)
      @no_file = NoFileOpen.new(self)
      @no_file.show
    end
    puts "deleted tab ##{int}"
  end
  
  #TODO: here too
  def update_line_count
    line_count = Qt::Label.new("Line: " + (@ui.plainTextEdit.textCursor.blockNumber+1).to_s) 
#    @ui.statusbar.removeWidget(line_count)
#    @ui.statusbar.addWidget(line_count)   
  end
  
  def update_connects(int)
    ## Menu connects
    Qt::Object.connect(@ui.menu_copy, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('copy_text()'))
    Qt::Object.connect(@ui.menu_cut, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('cut_text()'))
    Qt::Object.connect(@ui.menu_paste, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('paste_text()'))
    Qt::Object.connect(@ui.menu_undo, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('undo_text()'))
    Qt::Object.connect(@ui.menu_redo, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('redo_text()'))
    ## Toolbar connects
    Qt::Object.connect(@ui.toolbar_copy, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('copy_text()'))
    Qt::Object.connect(@ui.toolbar_cut, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('cut_text()'))
    Qt::Object.connect(@ui.toolbar_paste, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('paste_text()'))
    Qt::Object.connect(@ui.toolbar_undo, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('undo_text()'))
    Qt::Object.connect(@ui.toolbar_redo, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('redo_text()'))
  end 
end

if $0 == __FILE__
  app = Qt::Application.new(ARGV)
  myapp = Start.new
  myapp.show
  app.exec
end