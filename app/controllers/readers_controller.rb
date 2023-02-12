class ReadersController < ApplicationController
    before_action :authenticate_admin!

    def index
        @readers = Reader.all
    end

    def show
        @reader = Reader.find(params[:id])
    end

    def new
        @reader = Reader.new
    end

    def create
        @reader = Reader.new(reader_params)   
        if @reader.save   
            flash[:notice] = 'Reader added!'
            puts 'da tao thanh cong'   
            redirect_to readers_path   
        else   
            flash[:error] = 'Failed to create reader!'   
            render :new   
        end   
    end

    def edit
        @reader = Reader.find(params[:id])
    end

    def update
        @reader = Reader.find(params[:id])   
        if @reader.update(reader_params)   
            flash[:notice] = 'Reader updated!'   
            redirect_to readers_path   
        else   
            flash[:error] = 'Failed to edit reader!'   
            render :edit   
        end  
    end

    def destroy
        @reader = Reader.find(params[:id])
        @reader.destroy
    end

    def reader_params   
        params.require(:reader).permit(:name, :address, :email, :password, :library_card_id)   
    end  
end
