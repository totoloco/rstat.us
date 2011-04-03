class Theme
  include MongoMapper::Document

  key :public_style, String
  key :profile_style, String

  belongs_to :user
end
