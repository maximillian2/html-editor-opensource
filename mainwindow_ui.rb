=begin
** Form generated from reading ui file 'mainwindow.ui'
**
** Created: Mon Nov 17 20:29:22 2014
**      by: Qt User Interface Compiler version 4.8.6
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

require 'Qt4'

class Ui_Editor
    attr_reader :actionNew
    attr_reader :actionOpen
    attr_reader :actionSave
    attr_reader :actionSave_as
    attr_reader :actionExit
    attr_reader :actionCopy
    attr_reader :actionCut
    attr_reader :actionPaste
    attr_reader :actionDelete
    attr_reader :actionPreview
    attr_reader :actionBrowser_Preview
    attr_reader :actionAbout_Qt
    attr_reader :actionAbout_program
    attr_reader :actionShow_Toolbar
    attr_reader :actionShow_statusbar
    attr_reader :actionNew_tab
    attr_reader :actionOpen_file
    attr_reader :actionSave_file
    attr_reader :actionSettings
    attr_reader :actionUndo
    attr_reader :actionRedo
    attr_reader :actionCut_2
    attr_reader :actionCopy_2
    attr_reader :actionPaste_2
    attr_reader :actionBold
    attr_reader :actionItalic
    attr_reader :actionUnderline
    attr_reader :actionList
    attr_reader :actionImage
    attr_reader :actionHyperlink
    attr_reader :centralwidget
    attr_reader :verticalLayout
    attr_reader :tabWidget
    attr_reader :untitled_tab
    attr_reader :verticalLayout_2
    attr_reader :textBrowser
    attr_reader :label
    attr_reader :textEdit
    attr_reader :add_button
    attr_reader :menubar
    attr_reader :menuFile
    attr_reader :menuEdit
    attr_reader :menuTools
    attr_reader :menuHelp
    attr_reader :menuInsert
    attr_reader :menuView
    attr_reader :statusbar
    attr_reader :toolBar

    def setupUi(editor)
    if editor.objectName.nil?
        editor.objectName = "editor"
    end
    editor.resize(800, 600)
    @actionNew = Qt::Action.new(editor)
    @actionNew.objectName = "actionNew"
    @actionOpen = Qt::Action.new(editor)
    @actionOpen.objectName = "actionOpen"
    @actionSave = Qt::Action.new(editor)
    @actionSave.objectName = "actionSave"
    @actionSave_as = Qt::Action.new(editor)
    @actionSave_as.objectName = "actionSave_as"
    @actionExit = Qt::Action.new(editor)
    @actionExit.objectName = "actionExit"
    @actionCopy = Qt::Action.new(editor)
    @actionCopy.objectName = "actionCopy"
    @actionCut = Qt::Action.new(editor)
    @actionCut.objectName = "actionCut"
    @actionPaste = Qt::Action.new(editor)
    @actionPaste.objectName = "actionPaste"
    @actionDelete = Qt::Action.new(editor)
    @actionDelete.objectName = "actionDelete"
    @actionPreview = Qt::Action.new(editor)
    @actionPreview.objectName = "actionPreview"
    @actionBrowser_Preview = Qt::Action.new(editor)
    @actionBrowser_Preview.objectName = "actionBrowser_Preview"
    @actionAbout_Qt = Qt::Action.new(editor)
    @actionAbout_Qt.objectName = "actionAbout_Qt"
    @actionAbout_program = Qt::Action.new(editor)
    @actionAbout_program.objectName = "actionAbout_program"
    @actionShow_Toolbar = Qt::Action.new(editor)
    @actionShow_Toolbar.objectName = "actionShow_Toolbar"
    @actionShow_Toolbar.checkable = true
    @actionShow_statusbar = Qt::Action.new(editor)
    @actionShow_statusbar.objectName = "actionShow_statusbar"
    @actionShow_statusbar.checkable = true
    @actionNew_tab = Qt::Action.new(editor)
    @actionNew_tab.objectName = "actionNew_tab"
    icon = Qt::Icon.new
    icon.addPixmap(Qt::Pixmap.new("Downloads/mono-general-icons-2-by-custom-icon-design/png/24x24/document.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @actionNew_tab.icon = icon
    @actionOpen_file = Qt::Action.new(editor)
    @actionOpen_file.objectName = "actionOpen_file"
    icon1 = Qt::Icon.new
    icon1.addPixmap(Qt::Pixmap.new("Downloads/mono-general-icons-2-by-custom-icon-design/png/24x24/folder.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @actionOpen_file.icon = icon1
    @actionSave_file = Qt::Action.new(editor)
    @actionSave_file.objectName = "actionSave_file"
    icon2 = Qt::Icon.new
    icon2.addPixmap(Qt::Pixmap.new("Downloads/mono-general-icons-by-custom-icon-design/png/24x24/save.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @actionSave_file.icon = icon2
    @actionSettings = Qt::Action.new(editor)
    @actionSettings.objectName = "actionSettings"
    icon3 = Qt::Icon.new
    icon3.addPixmap(Qt::Pixmap.new("Downloads/mono-general-icons-2-by-custom-icon-design/png/24x24/setting.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @actionSettings.icon = icon3
    @actionUndo = Qt::Action.new(editor)
    @actionUndo.objectName = "actionUndo"
    icon4 = Qt::Icon.new
    icon4.addPixmap(Qt::Pixmap.new("Downloads/mono-general-icons-3-by-custom-icon-design/png/24x24/undo.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @actionUndo.icon = icon4
    @actionRedo = Qt::Action.new(editor)
    @actionRedo.objectName = "actionRedo"
    icon5 = Qt::Icon.new
    icon5.addPixmap(Qt::Pixmap.new("Downloads/mono-general-icons-3-by-custom-icon-design/png/24x24/redo.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @actionRedo.icon = icon5
    @actionCut_2 = Qt::Action.new(editor)
    @actionCut_2.objectName = "actionCut_2"
    icon6 = Qt::Icon.new
    icon6.addPixmap(Qt::Pixmap.new("Downloads/mono-general-icons-2-by-custom-icon-design/png/24x24/cut.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @actionCut_2.icon = icon6
    @actionCopy_2 = Qt::Action.new(editor)
    @actionCopy_2.objectName = "actionCopy_2"
    icon7 = Qt::Icon.new
    icon7.addPixmap(Qt::Pixmap.new("Downloads/mono-general-icons-2-by-custom-icon-design/png/24x24/copy.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @actionCopy_2.icon = icon7
    @actionPaste_2 = Qt::Action.new(editor)
    @actionPaste_2.objectName = "actionPaste_2"
    icon8 = Qt::Icon.new
    icon8.addPixmap(Qt::Pixmap.new("Downloads/mono-general-icons-2-by-custom-icon-design/png/24x24/paste.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @actionPaste_2.icon = icon8
    @actionBold = Qt::Action.new(editor)
    @actionBold.objectName = "actionBold"
    icon9 = Qt::Icon.new
    icon9.addPixmap(Qt::Pixmap.new("Downloads/font_bold.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @actionBold.icon = icon9
    @actionItalic = Qt::Action.new(editor)
    @actionItalic.objectName = "actionItalic"
    icon10 = Qt::Icon.new
    icon10.addPixmap(Qt::Pixmap.new("Downloads/font_italic.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @actionItalic.icon = icon10
    @actionUnderline = Qt::Action.new(editor)
    @actionUnderline.objectName = "actionUnderline"
    icon11 = Qt::Icon.new
    icon11.addPixmap(Qt::Pixmap.new("Downloads/font_underline.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @actionUnderline.icon = icon11
    @actionList = Qt::Action.new(editor)
    @actionList.objectName = "actionList"
    icon12 = Qt::Icon.new
    icon12.addPixmap(Qt::Pixmap.new("Downloads/list_bullets_black.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @actionList.icon = icon12
    @actionImage = Qt::Action.new(editor)
    @actionImage.objectName = "actionImage"
    icon13 = Qt::Icon.new
    icon13.addPixmap(Qt::Pixmap.new("Downloads/image 1.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @actionImage.icon = icon13
    @actionHyperlink = Qt::Action.new(editor)
    @actionHyperlink.objectName = "actionHyperlink"
    icon14 = Qt::Icon.new
    icon14.addPixmap(Qt::Pixmap.new("Downloads/link.png"), Qt::Icon::Normal, Qt::Icon::Off)
    @actionHyperlink.icon = icon14
    @centralwidget = Qt::Widget.new(editor)
    @centralwidget.objectName = "centralwidget"
    @verticalLayout = Qt::VBoxLayout.new(@centralwidget)
    @verticalLayout.objectName = "verticalLayout"
    @tabWidget = Qt::TabWidget.new(@centralwidget)
    @tabWidget.objectName = "tabWidget"
    @sizePolicy = Qt::SizePolicy.new(Qt::SizePolicy::Expanding, Qt::SizePolicy::Expanding)
    @sizePolicy.setHorizontalStretch(0)
    @sizePolicy.setVerticalStretch(0)
    @sizePolicy.heightForWidth = @tabWidget.sizePolicy.hasHeightForWidth
    @tabWidget.sizePolicy = @sizePolicy
    @tabWidget.tabsClosable = true
    @tabWidget.movable = true
    @untitled_tab = Qt::Widget.new()
    @untitled_tab.objectName = "untitled_tab"
    @verticalLayout_2 = Qt::VBoxLayout.new(@untitled_tab)
    @verticalLayout_2.objectName = "verticalLayout_2"
    @textBrowser = Qt::TextBrowser.new(@untitled_tab)
    @textBrowser.objectName = "textBrowser"

    @verticalLayout_2.addWidget(@textBrowser)

    @label = Qt::Label.new(@untitled_tab)
    @label.objectName = "label"

    @verticalLayout_2.addWidget(@label)

    @textEdit = Qt::TextEdit.new(@untitled_tab)
    @textEdit.objectName = "textEdit"

    @verticalLayout_2.addWidget(@textEdit)

    @tabWidget.addTab(@untitled_tab, Qt::Application.translate("Editor", "untitled", nil, Qt::Application::UnicodeUTF8))

    @verticalLayout.addWidget(@tabWidget)

    @add_button = Qt::PushButton.new(@centralwidget)
    @add_button.objectName = "add_button"

    @verticalLayout.addWidget(@add_button)

    editor.centralWidget = @centralwidget
    @menubar = Qt::MenuBar.new(editor)
    @menubar.objectName = "menubar"
    @menubar.geometry = Qt::Rect.new(0, 0, 800, 22)
    @menuFile = Qt::Menu.new(@menubar)
    @menuFile.objectName = "menuFile"
    @menuEdit = Qt::Menu.new(@menubar)
    @menuEdit.objectName = "menuEdit"
    @menuTools = Qt::Menu.new(@menubar)
    @menuTools.objectName = "menuTools"
    @menuHelp = Qt::Menu.new(@menubar)
    @menuHelp.objectName = "menuHelp"
    @menuInsert = Qt::Menu.new(@menubar)
    @menuInsert.objectName = "menuInsert"
    @menuView = Qt::Menu.new(@menubar)
    @menuView.objectName = "menuView"
    editor.setMenuBar(@menubar)
    @statusbar = Qt::StatusBar.new(editor)
    @statusbar.objectName = "statusbar"
    editor.statusBar = @statusbar
    @toolBar = Qt::ToolBar.new(editor)
    @toolBar.objectName = "toolBar"
    editor.addToolBar(Qt::TopToolBarArea, @toolBar)

    @menubar.addAction(@menuFile.menuAction())
    @menubar.addAction(@menuEdit.menuAction())
    @menubar.addAction(@menuTools.menuAction())
    @menubar.addAction(@menuView.menuAction())
    @menubar.addAction(@menuInsert.menuAction())
    @menubar.addAction(@menuHelp.menuAction())
    @menuFile.addAction(@actionNew)
    @menuFile.addAction(@actionOpen)
    @menuFile.addAction(@actionSave)
    @menuFile.addAction(@actionSave_as)
    @menuFile.addSeparator()
    @menuFile.addAction(@actionExit)
    @menuEdit.addAction(@actionCopy)
    @menuEdit.addAction(@actionCut)
    @menuEdit.addAction(@actionPaste)
    @menuEdit.addAction(@actionDelete)
    @menuTools.addAction(@actionPreview)
    @menuTools.addAction(@actionBrowser_Preview)
    @menuHelp.addAction(@actionAbout_Qt)
    @menuHelp.addAction(@actionAbout_program)
    @menuView.addAction(@actionShow_Toolbar)
    @menuView.addAction(@actionShow_statusbar)
    @toolBar.addAction(@actionNew_tab)
    @toolBar.addAction(@actionOpen_file)
    @toolBar.addAction(@actionSave_file)
    @toolBar.addSeparator()
    @toolBar.addAction(@actionUndo)
    @toolBar.addAction(@actionRedo)
    @toolBar.addSeparator()
    @toolBar.addAction(@actionCut_2)
    @toolBar.addAction(@actionCopy_2)
    @toolBar.addAction(@actionPaste_2)
    @toolBar.addSeparator()
    @toolBar.addAction(@actionBold)
    @toolBar.addAction(@actionItalic)
    @toolBar.addAction(@actionUnderline)
    @toolBar.addAction(@actionList)
    @toolBar.addAction(@actionImage)
    @toolBar.addAction(@actionHyperlink)
    @toolBar.addSeparator()
    @toolBar.addAction(@actionSettings)

    retranslateUi(editor)

    Qt::MetaObject.connectSlotsByName(editor)
    end # setupUi

    def setup_ui(editor)
        setupUi(editor)
    end

    def retranslateUi(editor)
    editor.windowTitle = Qt::Application.translate("Editor", "MainWindow", nil, Qt::Application::UnicodeUTF8)
    @actionNew.text = Qt::Application.translate("Editor", "New", nil, Qt::Application::UnicodeUTF8)
    @actionNew.toolTip = Qt::Application.translate("Editor", "New", nil, Qt::Application::UnicodeUTF8)
    @actionNew.shortcut = Qt::Application.translate("Editor", "Ctrl+N", nil, Qt::Application::UnicodeUTF8)
    @actionOpen.text = Qt::Application.translate("Editor", "Open", nil, Qt::Application::UnicodeUTF8)
    @actionSave.text = Qt::Application.translate("Editor", "Save", nil, Qt::Application::UnicodeUTF8)
    @actionSave_as.text = Qt::Application.translate("Editor", "Save as..", nil, Qt::Application::UnicodeUTF8)
    @actionExit.text = Qt::Application.translate("Editor", "Exit", nil, Qt::Application::UnicodeUTF8)
    @actionCopy.text = Qt::Application.translate("Editor", "Copy", nil, Qt::Application::UnicodeUTF8)
    @actionCut.text = Qt::Application.translate("Editor", "Cut", nil, Qt::Application::UnicodeUTF8)
    @actionPaste.text = Qt::Application.translate("Editor", "Paste", nil, Qt::Application::UnicodeUTF8)
    @actionDelete.text = Qt::Application.translate("Editor", "Delete", nil, Qt::Application::UnicodeUTF8)
    @actionPreview.text = Qt::Application.translate("Editor", "Preview", nil, Qt::Application::UnicodeUTF8)
    @actionBrowser_Preview.text = Qt::Application.translate("Editor", "Browser Preview", nil, Qt::Application::UnicodeUTF8)
    @actionAbout_Qt.text = Qt::Application.translate("Editor", "About Qt", nil, Qt::Application::UnicodeUTF8)
    @actionAbout_program.text = Qt::Application.translate("Editor", "About program", nil, Qt::Application::UnicodeUTF8)
    @actionShow_Toolbar.text = Qt::Application.translate("Editor", "Show Toolbar", nil, Qt::Application::UnicodeUTF8)
    @actionShow_statusbar.text = Qt::Application.translate("Editor", "Show statusbar", nil, Qt::Application::UnicodeUTF8)
    @actionNew_tab.text = Qt::Application.translate("Editor", "new_tab", nil, Qt::Application::UnicodeUTF8)
    @actionNew_tab.toolTip = Qt::Application.translate("Editor", "New tab", nil, Qt::Application::UnicodeUTF8)
    @actionNew_tab.shortcut = Qt::Application.translate("Editor", "Ctrl+N", nil, Qt::Application::UnicodeUTF8)
    @actionOpen_file.text = Qt::Application.translate("Editor", "open_file", nil, Qt::Application::UnicodeUTF8)
    @actionOpen_file.toolTip = Qt::Application.translate("Editor", "Open file", nil, Qt::Application::UnicodeUTF8)
    @actionOpen_file.shortcut = Qt::Application.translate("Editor", "Ctrl+O", nil, Qt::Application::UnicodeUTF8)
    @actionSave_file.text = Qt::Application.translate("Editor", "save_file", nil, Qt::Application::UnicodeUTF8)
    @actionSave_file.toolTip = Qt::Application.translate("Editor", "Save file", nil, Qt::Application::UnicodeUTF8)
    @actionSave_file.shortcut = Qt::Application.translate("Editor", "Ctrl+S", nil, Qt::Application::UnicodeUTF8)
    @actionSettings.text = Qt::Application.translate("Editor", "settings", nil, Qt::Application::UnicodeUTF8)
    @actionSettings.toolTip = Qt::Application.translate("Editor", "Settings", nil, Qt::Application::UnicodeUTF8)
    @actionSettings.shortcut = Qt::Application.translate("Editor", "Ctrl+,", nil, Qt::Application::UnicodeUTF8)
    @actionUndo.text = Qt::Application.translate("Editor", "undo", nil, Qt::Application::UnicodeUTF8)
    @actionUndo.toolTip = Qt::Application.translate("Editor", "Undo", nil, Qt::Application::UnicodeUTF8)
    @actionUndo.shortcut = Qt::Application.translate("Editor", "Ctrl+Z", nil, Qt::Application::UnicodeUTF8)
    @actionRedo.text = Qt::Application.translate("Editor", "redo", nil, Qt::Application::UnicodeUTF8)
    @actionRedo.toolTip = Qt::Application.translate("Editor", "Redo", nil, Qt::Application::UnicodeUTF8)
    @actionRedo.shortcut = Qt::Application.translate("Editor", "Ctrl+Y", nil, Qt::Application::UnicodeUTF8)
    @actionCut_2.text = Qt::Application.translate("Editor", "cut", nil, Qt::Application::UnicodeUTF8)
    @actionCut_2.toolTip = Qt::Application.translate("Editor", "Cut", nil, Qt::Application::UnicodeUTF8)
    @actionCut_2.shortcut = Qt::Application.translate("Editor", "Ctrl+X", nil, Qt::Application::UnicodeUTF8)
    @actionCopy_2.text = Qt::Application.translate("Editor", "copy", nil, Qt::Application::UnicodeUTF8)
    @actionCopy_2.toolTip = Qt::Application.translate("Editor", "Copy", nil, Qt::Application::UnicodeUTF8)
    @actionCopy_2.shortcut = Qt::Application.translate("Editor", "Ctrl+C", nil, Qt::Application::UnicodeUTF8)
    @actionPaste_2.text = Qt::Application.translate("Editor", "paste", nil, Qt::Application::UnicodeUTF8)
    @actionPaste_2.toolTip = Qt::Application.translate("Editor", "Paste", nil, Qt::Application::UnicodeUTF8)
    @actionPaste_2.shortcut = Qt::Application.translate("Editor", "Ctrl+V", nil, Qt::Application::UnicodeUTF8)
    @actionBold.text = Qt::Application.translate("Editor", "bold", nil, Qt::Application::UnicodeUTF8)
    @actionBold.toolTip = Qt::Application.translate("Editor", "Bold", nil, Qt::Application::UnicodeUTF8)
    @actionItalic.text = Qt::Application.translate("Editor", "italic", nil, Qt::Application::UnicodeUTF8)
    @actionItalic.toolTip = Qt::Application.translate("Editor", "Italic", nil, Qt::Application::UnicodeUTF8)
    @actionUnderline.text = Qt::Application.translate("Editor", "underline", nil, Qt::Application::UnicodeUTF8)
    @actionUnderline.toolTip = Qt::Application.translate("Editor", "Underline", nil, Qt::Application::UnicodeUTF8)
    @actionList.text = Qt::Application.translate("Editor", "list", nil, Qt::Application::UnicodeUTF8)
    @actionList.toolTip = Qt::Application.translate("Editor", "List", nil, Qt::Application::UnicodeUTF8)
    @actionImage.text = Qt::Application.translate("Editor", "image", nil, Qt::Application::UnicodeUTF8)
    @actionImage.toolTip = Qt::Application.translate("Editor", "Image", nil, Qt::Application::UnicodeUTF8)
    @actionHyperlink.text = Qt::Application.translate("Editor", "hyperlink", nil, Qt::Application::UnicodeUTF8)
    @actionHyperlink.toolTip = Qt::Application.translate("Editor", "Insert hyperlink", nil, Qt::Application::UnicodeUTF8)
    @textBrowser.html = Qt::Application.translate("Editor", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n" \
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n" \
"p, li { white-space: pre-wrap; }\n" \
"</style></head><body style=\" font-family:'.Helvetica Neue DeskInterface'; font-size:13pt; font-weight:400; font-style:normal;\">\n" \
"<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p></body></html>", nil, Qt::Application::UnicodeUTF8)
    @label.text = Qt::Application.translate("Editor", "Enter text below:", nil, Qt::Application::UnicodeUTF8)
    @tabWidget.setTabText(@tabWidget.indexOf(@untitled_tab), Qt::Application.translate("Editor", "untitled", nil, Qt::Application::UnicodeUTF8))
    @add_button.text = Qt::Application.translate("Editor", "Push me!", nil, Qt::Application::UnicodeUTF8)
    @menuFile.title = Qt::Application.translate("Editor", "File", nil, Qt::Application::UnicodeUTF8)
    @menuEdit.title = Qt::Application.translate("Editor", "Edit", nil, Qt::Application::UnicodeUTF8)
    @menuTools.title = Qt::Application.translate("Editor", "Tools", nil, Qt::Application::UnicodeUTF8)
    @menuHelp.title = Qt::Application.translate("Editor", "Help", nil, Qt::Application::UnicodeUTF8)
    @menuInsert.title = Qt::Application.translate("Editor", "Insert", nil, Qt::Application::UnicodeUTF8)
    @menuView.title = Qt::Application.translate("Editor", "View", nil, Qt::Application::UnicodeUTF8)
    @toolBar.windowTitle = Qt::Application.translate("Editor", "toolBar", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(editor)
        retranslateUi(editor)
    end

end

module Ui
    class Editor < Ui_Editor
    end
end  # module Ui

if $0 == __FILE__
    a = Qt::Application.new(ARGV)
    u = Ui_Editor.new
    w = Qt::MainWindow.new
    u.setupUi(w)
    w.show
    a.exec
end
