class About_Program < Qt::Dialog
	def initialize(parent = nil)
		super(parent)
		@horizontal = Qt::HBoxLayout.new
		@logo = Qt::Label.new
		@logo.pixmap = Qt::Pixmap.new("/home/maxi/html-editor-opensource/images/logo.png")
		@horizontal.addWidget(@logo)
		show
	end

	# def show
	# 	@logo.show
	# end
end