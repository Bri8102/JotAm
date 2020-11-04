class ListsController < ApplicationController

    def index
      @lists = List.all
    end

    def show
        @list = List.find(params[:id])
    end

    def new
        @list = List.new
    end

    def create
     @list = List.create(list_params)
     redirect_to @list
    end

    def edit
      @list = List.find(params[:id])
    end

    def update
      @list = List.find(params[:id])
      @list.update(list_params)
      redirect_to @list
    end

    def destroy
      List.find(params[:id]).destroy
      redirect_to root_path
    end

    private

    def list_params
        params.require(:list).permit(:title, :description)
    end
end
