json.extract! note, :title, :body, :created_at, :updated_at
api_note_url(note, format: :json)
json.tags note.tags, :name
