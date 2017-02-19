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

    def edit
        @menu = Menu.find( params[:id] ) 
    end

    def update
        @menu = Menu.find( params[:id] )
        if @menu.update( menu_params )
            redirect_to @menu
        else
            render 'edit'
        end
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

        render 'makemenu' and return

    end 

    private 
        def menu_params
            params.require(:menu).permit(:name,:description,:points,:kind,:meat)
        end
    
    private 
        def insert_from_textfile
            # Insert from a text file
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
            end
            print "Menu Total:" + @list.count.to_s
        end

    private 
        def insert_from_csvfile

            # Insert from a cvs file
            
            IO.foreach( Rails.root.join('app/assets/entradas.csv') ) do |line|
                name, type =  line.split(',')
                puts name
                puts type
                puts "-------"

                menu = Menu.new
                menu.name = name
                menu.kind = type

                if menu.save
                    puts 'Menu:' + menu.name + ' saved!'
                end 
                
            end
        end
    
    private
        def remove_duplicatesm 
            #Remove Duplicate 
            ids = Menu.select("MIN(id) as id").group(:name).collect(&:id)
            Menu.where.not(id:ids).destroy_all
        end

end
