class SongsController < ApplicationController
	def index
		@songs = Song.all
	end

	def new
	end

	def create
		@song = Song.create(song_params)
		redirect_to song_path(@song)
	end

	def show
		set_song
	end

	def edit
		set_song
	end

	def update
		set_song
		@song.update(song_params)
		redirect_to song_path(@song)
	end

	def set_song
		@song = Song.find(params[:id])
	end

	def song_params
		params.require(:song).permit(:name, :artist_id, :genre_id)
	end
end