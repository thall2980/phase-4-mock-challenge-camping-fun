class CampersController < ApplicationController

    def index
        render json: Camper.all, status: :ok
    end

    def show
        render json: camper_find, status: :ok, serializer: CamperActivitiesSerializer
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end



    private
    def camper_params
        params.permit(:name, :age)
    end

    def camper_find
        Camper.find(params[:id])
    end
end
