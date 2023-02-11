class ReadersController < ApplicationController
    def index
        @readers = Reader.all
    end

    def show
        @reader = Reader.find(params[:id])
    end

    def destroy
        @reader = Reader.find(params[:id])
        @reader.destroy
    end
end
