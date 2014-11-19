require 'Qt4'
require_relative 'mainwindow_ui'

class Start < Qt::MainWindow
  # slots in use
  slots 'set_text_browser()'
  
  def initialize(parent = nil)
    super
    @ui = Ui_Editor.new
    @ui.setupUi(self)
    Qt::Object.connect(@ui.add_button, SIGNAL('clicked()'), self, SLOT('set_text_browser()'))
  end
  
  def set_text_browser()
    @ui.textBrowser.setText(@ui.textEdit.toPlainText())
  end
end

if $0 == __FILE__
  app = Qt::Application.new(ARGV)
  myapp = Start.new
  myapp.show
  app.exec
end