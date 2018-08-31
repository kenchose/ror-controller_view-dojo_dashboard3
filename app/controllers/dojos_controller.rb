class DojosController < ApplicationController
    def index
      @count = Dojo.all.count
      @dojo = Dojo.all
    end
  
    def new
      @dojo = Dojo.new
    end
  
    # def create
    #   @dojo = Dojo.create (dojo_params)
    #   if @dojo.save
    #     flash[:success] = "You have successfully created a new Dojo!"
    #     redirect_to '/dojos'
    #   else
    #     flash[:errors] = @dojo.errors.full_messages
    #     render :new
    #   end
    # end
    # refactoring
    def create 
      @dojo = Dojo.create (dojo_params)
      if @dojo.save
        redirect_to '/dojos' #or if id is needed '/dojos/#{dojo.id}'
      else
        flash[:errors] = @dojo.errors.full_messages instead of using this, we put it in the render page
        render :new
      end
    end

    def show
      @dojo = Dojo.find(params[:id])
    end

    def edit
      @dojo = Dojo.find(params[:id])
    end

    def update
      @dojo = Dojo.find(params[:id])
      if @dojo.update( dojo_params )
        flash[:success] = "You have successfully updated the Dojo!"
        redirect_to '/dojos'
      else
        flash[:errors] = @dojo.errors.full_messages
        redirect_to :back
      end
    end

    def destroy
      @dojo = Dojo.find(params[:id]).destroy
      redirect_to "/dojos"
    end
  
    private 
      def dojo_params
        params.require(:dojo).permit(:branch, :street, :city, :state)
      end
    end 
  