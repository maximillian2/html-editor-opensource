require 'Qt4'
require_relative 'mainwindow_ui'
require_relative 'webpage_ui'
require_relative 'new_tab'
require_relative 'local_preview'
require_relative 'no_file_open'
require_relative 'about_program'

class Start < Qt::MainWindow
  ## File submenu slots
  slots 'new_file()', 'open_file()', 'save_file()', 'save_as()'
  ## Tools submenu slots
  slots 'open_in_browser()', 'local_preview()'
  ## View submenu slots
  slots 'toggle_statusbar(bool)', 'toggle_toolbar(bool)'
  ## Help submenu slot
  slots 'about_program()'

  ## General slots
  slots 'remove_tab(int)', 'update_line_count()', 'update_connects(int)', 'enable_save()'

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
    Qt::Object.connect(@ui.menu_save_file, SIGNAL('activated()'), self, SLOT('save_file()'))
    Qt::Object.connect(@ui.menu_save_file, SIGNAL('activated()'), self, SLOT('save_file()'))
    Qt::Object.connect(@ui.menu_new_file, SIGNAL('activated()'), self, SLOT('new_file()'))
    Qt::Object.connect(@ui.menu_about_program, SIGNAL('activated()'), self, SLOT('about_program()'))

    ## Connecting toolbar items
    Qt::Object.connect(@ui.toolbar_run, SIGNAL('activated()'), self, SLOT('local_preview()'))
    Qt::Object.connect(@ui.toolbar_open_file, SIGNAL('activated()'), self, SLOT('open_file()'))
    Qt::Object.connect(@ui.toolbar_save_file, SIGNAL('activated()'), self, SLOT('save_file()'))
    Qt::Object.connect(@ui.toolbar_new_file, SIGNAL('activated()'), self, SLOT('new_file()'))

    ## Connecting command link buttons
    Qt::Object.connect(@ui.new_file_linkbutton, SIGNAL('clicked()'), self, SLOT('new_file()'))
    Qt::Object.connect(@ui.open_file_linkbutton, SIGNAL('clicked()'), self, SLOT('open_file()'))

    ## Set default behaviour
    @ui.no_file_widget.setVisible(true)
    @ui.tabWidget.setVisible(false)
    @ui.toolbar_save_file.setEnabled(false)
    @ui.menu_show_toolbar.setChecked(true)
    @ui.menu_show_statusbar.setChecked(true)
    @current_file = ''

    
    @line_label = Qt::Label.new("Line: 1")    
    @column_label = Qt::Label.new("Column: 1")    
    
    @ui.statusbar.addWidget(@line_label)
    @ui.statusbar.addWidget(@column_label)
    
    Qt::Object.connect(@ui.tabWidget, SIGNAL('tabCloseRequested(int)'), self, SLOT('remove_tab(int)'))
    Qt::Object.connect(@ui.tabWidget, SIGNAL('currentChanged(int)'), self, SLOT('update_connects(int)'))

  end

  ## FILE SUBMENU SLOTS
  def new_file
    puts 'triggered new_file'
    @ui.tabWidget.setVisible(true)
    @ui.no_file_widget.setVisible(false)

    new_tab_index = @ui.tabWidget.addTab(New_Tab.new(self, nil), "untitled")
    @ui.toolbar_save_file.setEnabled(true) if @ui.tabWidget.count > 0

    @ui.tabWidget.setCurrentIndex(new_tab_index)
    @ui.tabWidget.widget(new_tab_index).setFocus
  end

  def open_file
    ## when cancel this dialog, then nothing shows up
    puts 'triggered open_file'
    @ui.tabWidget.setVisible(true)
    @ui.no_file_widget.setVisible(false)

    @filedialog = Qt::FileDialog
    @open_file = @filedialog.getOpenFileName(self, "Open file", Qt::Dir::homePath, "HTML Document(*.html);;All files(*)")
    @current_file = @open_file
## dilemma
    if @current_file.nil? && @ui.tabWidget.count < 1
      remove_tab(0)
    else
#       for i in @ui.tabWidget.count
#        if (File.basename(@open_file) == @ui.tabWidget.tabText(i))
#          @ui.tabWidget.setCurrentIndex(i)
#          return
#        end
#       end
       @ui.tabWidget.insertTab(@ui.tabWidget.count, New_Tab.new(@open_file), File.basename(@open_file))
       @ui.tabWidget.setCurrentIndex(@ui.tabWidget.count-1)
       @ui.tabWidget.widget(@ui.tabWidget.count-1).setFocus

       @ui.statusbar.showMessage("File loaded.", 2000)
    end
  end

  def save_file
    puts 'triggered save_file'
    if @ui.tabWidget.tabText(@ui.tabWidget.currentIndex) == "untitled"

      @savedialog = Qt::FileDialog.new(self)
      @savedialog.setDefaultSuffix("html")  # => not working. wtf?
      @save_file = @savedialog.getSaveFileName(self, "Save", Qt::Dir::homePath, "HTML Document(*.html);;All files(*)")
      @current_file = @save_file 
      unless @save_file.nil?
        File.open(@save_file, 'w') { |file| file.write(@ui.tabWidget.currentWidget.toPlainText) }
        @ui.tabWidget.setTabText(@ui.tabWidget.currentIndex, File.basename(@save_file))
        puts "file #{@save_file} saved"
      end
    else
      File.open(@current_file, 'w') { |file| file.write(@ui.tabWidget.currentWidget.toPlainText) }
      puts "file #{@current_file} saved"
    end
    @ui.statusbar.showMessage("File saved.", 2000)
    @ui.toolbar_save_file.setEnabled(false)
  end

  ## TOOLS SUBMENU SLOTS
  def open_in_browser
    puts 'triggered open_in_browser'
    save_file

    ## Not cross-platform but solution :/
    system("xdg-open #{@current_file}")
  end

  def local_preview
    puts 'triggered local_preview'
    save_file()
    @web_page = Local_Preview.new(self, @current_file)
    @web_page.show
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
    # TODO: me
    # puts 'triggered about_program'
    # @about = About_Program.new(self)
    # @about.show
  end

  ## GENERAL SLOTS
  def enable_save
    @ui.toolbar_save_file.setEnabled(true)
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
    @line_label.setText("Line: 1")
    @column_label.setText("Column: 1")
    puts "deleted tab ##{int}"
  end

  def update_line_count
    puts 'triggered update line'
    @line_label.setText("Line: " + (@ui.tabWidget.currentWidget.textCursor.blockNumber+1).to_s)
    @column_label.setText("Column: " + (@ui.tabWidget.currentWidget.textCursor.columnNumber+1).to_s)
    @ui.statusbar.update
  end

  def update_connects(int)
    ## Menu connects
    Qt::Object.connect(@ui.menu_copy, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('copy()'))
    Qt::Object.connect(@ui.menu_cut, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('cut()'))
    Qt::Object.connect(@ui.menu_paste, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('paste()'))
    Qt::Object.connect(@ui.menu_undo, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('undo()'))
    Qt::Object.connect(@ui.menu_redo, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('redo()'))
    Qt::Object.connect(@ui.menu_bold, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('bold()'))
    Qt::Object.connect(@ui.menu_italic, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('italic()'))
    Qt::Object.connect(@ui.menu_underline, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('underline()'))
    Qt::Object.connect(@ui.menu_image, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('image()'))
    Qt::Object.connect(@ui.menu_hyperlink, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('link()'))
    Qt::Object.connect(@ui.menu_unordered, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('ulist()'))
    Qt::Object.connect(@ui.menu_ordered, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('olist()'))
    ## Toolbar connects
    Qt::Object.connect(@ui.toolbar_copy, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('copy()'))
    Qt::Object.connect(@ui.toolbar_cut, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('cut()'))
    Qt::Object.connect(@ui.toolbar_paste, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('paste()'))
    Qt::Object.connect(@ui.toolbar_undo, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('undo()'))
    Qt::Object.connect(@ui.toolbar_redo, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('redo()'))
    Qt::Object.connect(@ui.toolbar_bold, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('bold()'))
    Qt::Object.connect(@ui.toolbar_italic, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('italic()'))
    Qt::Object.connect(@ui.toolbar_underline, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('underline()'))
    Qt::Object.connect(@ui.toolbar_image, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('image()'))
    Qt::Object.connect(@ui.toolbar_hyperlink, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('link()'))
    Qt::Object.connect(@ui.toolbar_ulist, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('ulist()'))
    Qt::Object.connect(@ui.toolbar_olist, SIGNAL('activated()'), @ui.tabWidget.widget(int), SLOT('olist()'))

    Qt::Object.connect(@ui.tabWidget.widget(int), SIGNAL('cursorPositionChanged()'), self, SLOT('update_line_count()'))
    Qt::Object.connect(@ui.tabWidget.widget(int).document, SIGNAL('contentsChanged()'), self, SLOT('enable_save()')) unless @ui.tabWidget.widget(int).nil?
    @ui.tabWidget.widget(int).setFocus unless int < 0

    @line_label.setText("Line: 1")
    @column_label.setText("Column: 1")
   Qt::Object.connect(@ui.tabWidget, SIGNAL('currentChanged(int)'), @ui.tabWidget.widget(int), SLOT('focus_current(int)'))
  end
end

if $0 == __FILE__
  app = Qt::Application.new(ARGV)
  myapp = Start.new
  myapp.show
  app.exec
end