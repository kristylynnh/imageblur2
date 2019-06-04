class Image
	attr_accessor :data

	def initialize(data)
			@data = data
	end

	def output_image
			@data.each do |pixel_row|
					pixel_row.each do |pixel_value|
							print pixel_value
					end

					print "\n"
			end
	end
	
	def blur
			###find the location of "1"#######
			@data.each_with_index do |row, row_position|
					row.each_with_index do |pixel, col_position|
							if pixel == 1
									#left
									@data[row_position][col_position - 1] = 1 if col_position > 0
									# right
									@data[row_position][col_position + 1] = 1 if col_position < @data[row_position].length - 1
									# #above
									@data[row_position - 1][col_position] = 1 if row_position > 0
									# #below
									@data[row_position+1][col_position] = 1 if row_position < @data.length - 1
							end


					end
			end
	end
	
end


image = Image.new([
	[0, 0, 0, 0, 0, 0, 0],
	[0, 0, 0, 1, 0, 0, 0],
	[0, 0, 0, 0, 0, 0, 0],
	[1, 0, 0, 0, 0, 0, 0]
])

image.blur
image.output_image
 