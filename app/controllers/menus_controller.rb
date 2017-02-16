class MenusController < ApplicationController

    def index
        @menus = Menu.all
        
    end

    def new
        @menu = Menu.new
    end

    def show
        @menu = Menu.find( params[:id] )
    end

    def create
        @menu = Menu.new( menu_params )
        if @menu.save
            redirect_to @menu
        else
            render 'new'
        end
    end

    def destroy
        @menu = Menu.find(params[:id])
        @menu.destroy

        redirect_to menus_path
    end

    def makemenu

        @list = Array.new 
        points = Random.new

        IO.foreach( Rails.root.join('app/assets/menus.txt') ) do |line|  
              
            @list.push(line)
            @menu = Menu.new
            @menu.name = line
            @menu.points = points.rand(10..20)
            if @menu.save
                print "Menu:" + line + "Saved"
            else
                print "Menu can't saved"
            end
            print line
        end
        print "Menu Total:" + @list.count.to_s
        @list.push("go final")
    end 

    private 
        def menu_params
            params.require(:menu).permit(:name,:description,:points)
        end

end
