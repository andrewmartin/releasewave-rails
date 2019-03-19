json.merge! @review.attributes
json.user do
  json.id @review.user.id
  json.image @review.user.image
  json.email @review.user.email
  json.name @review.user.name
end