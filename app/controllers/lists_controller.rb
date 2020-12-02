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
        @user = User.find_by_id(params[:id])
      end
    end

    def show
      if params[:user_id]
        @user = User.find_by_id(params[:user_id])
        @list = current_user.lists.find_by_id(id: params[:id])
        if @list.nil?
          redirect_to user_lists_path(@user), alert: "List not found"
        end
      else
       @list = List.find(params[:id])
      end
    end

    def new
        @list = List.new
    end

    def create
      @list = List.new(list_params)
      @list.user_id = current_user.id
      if @list.save
        redirect_to user_lists_path(@user), notice: "List was successfully created"
      else
        render new_list_path
      end
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
