class CollegesController < ApplicationController
    before_action :filters_load, only: ['edit','update','show','destroy','download_pdf']
    
    def index
        @colleges = if params[:q] && !params[:q].blank?
        College.where(name: params[:q])
        else
        College.all
        end
        end
        def show
        
        end
        def new
        @college=College.new
        end
        def create
        @college = College.new(college_params)
        if @college.save
            CollegeMailer.notify_college_creation(@college.id).deliver_now
            redirect_to colleges_path
        else
        render :new
        end
        end
        def edit
        
        end
        def update
        
        if @college.update(college_params)
        redirect_to colleges_path
        else
        render :edit
        end
        end
        def download_pdf
        
        send_file("#{Rails.root}/public/sample.pdf",
        filename: "sample.pdf",
        type: "application/pdf")
        end
        def destroy
        
        @college.destroy
        redirect_to colleges_path
        end
        private
        def college_params
        params.require(:college).permit(:name, :area, :code, :main_image)
        end
        def filters_load
            @college = College.find(params[:id])
        end

        end
