# {
#   "errors": [
#      { error: "Title can't be blank "}
#   ]
# }

json.errors do
  json.array! @note.errors do |field|
    json.error "#{field.capitalize} #{@note.errors[field].to_sentence}"
  end
end
