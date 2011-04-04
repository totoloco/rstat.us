class Theme
  include MongoMapper::Document

  key :public_style,  String
  key :profile_style, String
  key :other_style,   String
  key :reset_style,   Boolean, :default => false

  belongs_to :user

  def edit(params)
    self.public_style  = params[:public_style]
    self.profile_style = params[:profile_style]
    self.other_style   = params[:other_style]
    self.reset_style   = !params[:reset_style].nil?
    self.save
  end
end
