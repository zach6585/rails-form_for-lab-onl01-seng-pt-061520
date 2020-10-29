require "pry"
class SchoolClassesController < ApplicationController
    def index 
        @school_classes = SchoolClass.all 
    end 

    def show 
        @school_class = SchoolClass.find_by_id(params[:id])
    end 

    def new 
        @school_class = SchoolClass.new
    end 

    def create
        
        @school_class = SchoolClass.new(school_classes_params) 
        @school_class.title = params[:school_class][:title]
        @school_class.room_number = params[:school_class][:room_number]
        @school_class.save
        redirect_to school_class_path(@school_class)
    end 

    def edit
        @school_class = SchoolClass.find_by_id(params[:id])
    end 

    def update 
        @school_class = SchoolClass.find_by_id(params[:id])
        @school_class.update(school_classes_params)
        redirect_to school_class_path(@school_class)
    end 

    private 

    def school_classes_params
        params.require(:school_class).permit(:title, :room_number)
    end 
end 