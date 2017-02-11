class MenusController < ApplicationController

    def index
        @menus = Menu.all
        
    end

    def new
    end

    def show
        @menu = Menu.find( params[:id] )
    end

    def create
        @menu = Menu.new( menu_params )
        @menu.save
        redirect_to @menu
    end

    private 
        def menu_params
            params.require(:menu).permit(:name,:description,:points)
        end

end
