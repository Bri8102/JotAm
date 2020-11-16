class ListsController < ApplicationController
    before_action :set_list, only: [:show, :edit,:update, :destroy]

    def index
      redirect_if_not_logged_in
      if params[:user_id]
          @user = User.find_by(id: params[:user_id])
            if @user.nil?
              redirect_to users_path, notice: 'user not found'
            else
              @lists = @user.lists
            end
      else
        @lists = List.all
      end
    end

    def show
        @list = List.find(params[:id])
    end

    def new
        @list = List.new
    end

    def create
      @list = current_user.lists.build(list_params)
      @list.save
      redirect_to @list, notice: "List was successfully created"
    end

    def edit
      @list = List.find(params[:id])
    end

    def update
      @list = List.find(params[:id])
      @list.update(list_params)
      redirect_to @list, notice: "List was successfully updated."
    end

    def destroy
      # binding.pry
      List.find(params[:id]).destroy
      # binding.pry
      redirect_to lists_path
    end

    private

    def set_list
      @list = List.find_by_id(params[:id])
    end

    def list_params
        params.require(:list).permit(:title, :description, :user_id)
    end
end
