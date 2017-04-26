json.extract! note, :id, :title, :body, :created_at, :updated_at
json.url api_note_url(note, format: :json)
