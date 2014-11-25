=begin
** Form generated from reading ui file 'webpage.ui'
**
** Created: Tue Nov 25 19:05:17 2014
**      by: Qt User Interface Compiler version 4.8.1
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

require 'Qt4'

class Ui_WebPage
    attr_reader :verticalLayout
    attr_reader :label
    attr_reader :webView

    def setupUi(webPage)
    if webPage.objectName.nil?
        webPage.objectName = "webPage"
    end
    webPage.resize(400, 300)
    @verticalLayout = Qt::VBoxLayout.new(webPage)
    @verticalLayout.objectName = "verticalLayout"
    @label = Qt::Label.new(webPage)
    @label.objectName = "label"
    @label.alignment = Qt::AlignCenter

    @verticalLayout.addWidget(@label)

    @webView = Qt::WebView.new(webPage)
    @webView.objectName = "webView"
    @webView.url = Qt::Url.new("about:blank")

    @verticalLayout.addWidget(@webView)


    retranslateUi(webPage)

    Qt::MetaObject.connectSlotsByName(webPage)
    end # setupUi

    def setup_ui(webPage)
        setupUi(webPage)
    end

    def retranslateUi(webPage)
    webPage.windowTitle = Qt::Application.translate("WebPage", "Web Page Preview", nil, Qt::Application::UnicodeUTF8)
    @label.text = Qt::Application.translate("WebPage", "TextLabel", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(webPage)
        retranslateUi(webPage)
    end

end

module Ui
    class WebPage < Ui_WebPage
    end
end  # module Ui

if $0 == __FILE__
    a = Qt::Application.new(ARGV)
    u = Ui_WebPage.new
    w = Qt::Widget.new
    u.setupUi(w)
    w.show
    a.exec
end
