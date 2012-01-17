#class Ckeditor::Picture < Ckeditor::Asset
#  has_attached_file :data,
#                    :url  => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
#                    :path => ":rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension",
#	                  :styles => { :content => '575>', :thumb => '80x80#' }
#
#	validates_attachment_size :data, :less_than=>2.megabytes
#
#	def url_content
#	  url(:content)
#	end
#
#	def url_thumb
#	  url(:thumb)
#	end
#
#	def to_json(options = {})
#	  options[:methods] ||= []
#	  options[:methods] << :url_content
#	  options[:methods] << :url_thumb
#	  super options
#  end
#end

# s3 amazon storage

class Ckeditor::Picture < Ckeditor::Asset

  # === List of columns ===
  # id : integer
  # data_file_name : string
  # data_content_type : string
  # data_file_size : integer
  # assetable_id : integer
  # assetable_type : string
  # type : string
  # locale : integer
  # user_id : integer
  # created_at : datetime
  # updated_at : datetime
  # =======================



  has_attached_file :data,
  :s3_credentials => "#{Rails.root}/config/s3.yml", :bucket => "rails4me",
  :storage => :s3,
  :path => "/images/:id/:style_:basename.:extension",
  :styles => { :content => '666>', :thumb => '100x100' }

  validates_attachment_size :data, :less_than=>2.megabytes

  def url_content
    url(:content)
  end

  def url_thumb
    url(:thumb)
  end

  def to_json(options = {})
    options[:methods] ||= []
    options[:methods] << :url_content
    options[:methods] << :url_thumb
    super options
  end
end


