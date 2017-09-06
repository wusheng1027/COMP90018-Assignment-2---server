class Api::BuildingsController < ApplicationController

    def show
        building = Building.find params[:id]

        render_response building, displayable_keys
    end

    def update
        building = Building.find params[:id]
        building.assign_attributes building_params

        building.save ?
            render_204
            : render_error(building)
    end

    def destroy
        Building.find(params[:id]).destroy

        render_204
    end

    def create
        building = Building.new building_params

        building.save ?
            render_response(building, displayable_keys)
            : render_error(building)
    end

    private
        def building_params
            params.require(:building).permit :address
        end

        def displayable_keys
            %w(address)
        end
end