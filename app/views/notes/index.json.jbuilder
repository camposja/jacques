json.chimichanga do
  json.array! @notes, partial: 'api/notes/note', as: :note
end
