class Post < ApplicationRecord
	#attr_accessor :content_type, :original_filename, :image_data
 	#before_save :decode_base64_image

	belongs_to :user

  do_not_validate_attachment_file_type :image

	has_attached_file :image, styles: { large: "280x280>",medium: "140x140>", thumb: "90x90>" }, default_url: "Images/Unknown_Person.png"
  #validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	#protected
    #def decode_base64_image
      #if image_data && content_type && original_filename
        #decoded_data = Base64.decode64(image_data)

        #data = StringIO.new(decoded_data)
        #data.class_eval do
          #attr_accessor :content_type, :original_filename
        #end

        #data.content_type = content_type
        #data.original_filename = File.basename(original_filename)

        #self.image = data
      #end
    #end
end
