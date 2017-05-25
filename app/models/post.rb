class Post < ApplicationRecord
	#attr_accessor :content_type, :original_filename, :image_data
 	#before_save :decode_base64_image

	belongs_to :user

  do_not_validate_attachment_file_type :image

	has_attached_file :image, styles: { large: "280x280>",medium: "140x140>", thumb: "90x90>" }, default_url: "Images/Unknown_Person.png"



  def self.search(params)
      #debugger
      #date = Date.new(params[:post]["requestdate(1i)"].to_i , params[:post]["requestdate(2i)"].to_i , params[:post]["requestdate(3i)"].to_i)
      if params[:post]["requestdate(1i)"] != "" && params[:post]["requestdate(2i)"] == "" && params[:post]["requestdate(3i)"] == ""
        date = Date.parse(params[:post]['requestdate(1i)']+'-01-01')
      elsif params[:post]["requestdate(1i)"] != "" && params[:post]["requestdate(2i)"] != "" && params[:post]["requestdate(3i)"] == ""
        date = Date.parse(params[:post]['requestdate(1i)']+'-'+params[:post]['requestdate(2i)']+'-01')
      elsif params[:post]["requestdate(1i)"] != "" && params[:post]["requestdate(2i)"] != "" && params[:post]["requestdate(3i)"] == ""
        date = Date.parse(params[:post]['requestdate(1i)']+'-'+params[:post]['requestdate(2i)']+'-'+params[:post]['requestdate(3i)'])
      else
        date = "0-0-0"
      end
        
      #debugger
      if params[:status] == ("I Found")
        #debugger
        posts = Post.where(status: 'lost')
        posts = posts.where(name: params[:post][:name] ) if params[:post][:name].present?
        posts = posts.where(fathername: params[:post][:fathername]) if params[:post][:fathername].present?
        posts = posts.where(age: params[:age]) if params[:age].present?
        posts = posts.where(gender: params[:gender]) if params[:gender].present?
        posts = posts.where(mentalstatus: params[:mentalstatus]) if params[:mentalstatus].present?
        posts = posts.where("requestdate = ? or requestdate < ?" ,date , date) if params[:post]["requestdate(1i)"].present?
      elsif params[:status] == ("I Lost")
        #debugger
        posts = Post.where(status: 'found')
        posts = posts.where(name: params[:post][:name]) if params[:post][:name].present?
        posts = posts.where(fathername: params[:post][:fathername]) if params[:post][:fathername].present?
        posts = posts.where(age: params[:age]) if params[:age].present?
        posts = posts.where(gender: params[:gender]) if params[:gender].present?
        posts = posts.where(mentalstatus: params[:mentalstatus]) if params[:mentalstatus].present?
        posts = posts.where("requestdate = ? or requestdate < ?" ,date , date) if params[:post]["requestdate(1i)"].present?
      else
        posts = Post.all
        posts = posts.where(name: params[:post][:name]) if params[:post][:name].present?
        posts = posts.where(fathername: params[:post][:fathername]) if params[:post][:fathername].present?
        posts = posts.where(age: params[:age]) if params[:age].present?
        posts = posts.where(gender: params[:gender]) if params[:gender].present?
        posts = posts.where(mentalstatus: params[:mentalstatus]) if params[:mentalstatus].present?
        posts = posts.where("requestdate > ? or requestdate = ?" ,date , date) if params[:post]["requestdate(1i)"].present?
      end

      return posts
    end
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
