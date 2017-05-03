json.tag do
  json.name @tag_name
end

  json.notes do
    json.array! @notes, partial: 'api/notes/note', as: :note
end
