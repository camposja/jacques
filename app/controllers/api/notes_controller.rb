module Api
  class NotesController < ApplicationController

    # GET /notes
    # GET /notes.json
    def index
      @notes = Note.all
    end

    # GET /notes/1
    # GET /notes/1.json
    def show
      @note = Note.find(params[:id])
    end

    # POST /notes
    # POST /notes.json
    def create
      @note = Note.new(note_params)
      tags = params[:tags]
      tag_names = tags.split(',')
      tag_objects = tag_names.map { |tag_name| Tag.find_or_create_by(name: tag_name) }

      @note.tags = tag_objects

      if @note.save
        render :show, status: :created, location: @note
      else
        render json: @note.errors, status: 400
      end
    end

    # PATCH/PUT /notes/1
    # PATCH/PUT /notes/1.json
    def update
      @note = Note.find(params[:id])
      if @note.update(note_params)
        render :show, status: :ok, location: @note
      else
        render json: @note.errors, status: :unprocessable_entity
      end
    end

    # DELETE /notes/1
    # DELETE /notes/1.json
    def destroy
      @note = Note.find(params[:id])
      @note.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_note
        @note = Note.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def note_params
        params.permit(:title, :body)
      end
  end
end
