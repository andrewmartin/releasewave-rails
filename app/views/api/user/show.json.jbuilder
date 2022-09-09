json.merge! @user.attributes
json.image do
  json.full @user.image.url(:original)
  json.thumb @user.image.url(:thumb)
  json.square @user.image.url(:square)
  json.large @user.image.url(:large)
end