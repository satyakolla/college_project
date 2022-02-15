class Api::V1::CollegesController < ActionController::API
   
    def index
    colleges = College.all
    render json: {message: 'OK', colleges: colleges.as_json(only: [:name, :area, :code, :created_at])}.to_json, status: 200
    end
    def show
    college = College.find(params[:id])
    if college
    render json: {message: 'OK', college: college}.to_json, status: 200
    else
    render json: {message: 'Error', error: 'college not found with the given id'}.to_json, status: 404
    end
    rescue => e
    render json: {message: 'Error', error: e.message }.to_json, status: 500
    end
    def create
    college = College.new(college_params)
    if college.save
    render json: {message: 'OK', college: college}.to_json, status: :created 
    else
    render json: {message: 'Error', error: 'college couldnt create'}.to_json, status: 404 
    end
   end
   private
    def college_params
    params.require(:college).permit(:name, :area, :code)
    end
   end