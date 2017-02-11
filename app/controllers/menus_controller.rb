class MenusController < ApplicationController
    def new
    end

    def create
        render plain: params[:menu].inspect
    end
end
