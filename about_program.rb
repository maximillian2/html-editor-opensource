class About_Program < Qt::Dialog
	def initialize(parent = nil)
		super(parent)
		@logo = Qt::Label.new(self)
		# @image = Qt::Image.new(":/images/logo.png")
		# puts @image.nil?
		# @logo.setText("wow")
		@pix = Qt::Pixmap.new(":/images/logo.png")
		@logo.setPixmap(@pix)
		# @vert = Qt::VBoxLayout.new(self)
		# @vert.addWidget(@logo)

		# self.setLayout(@vert)
	end
end