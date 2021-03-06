class Api::BeaconsController < ApplicationController

    def index
        beacons = Beacon.all

        render_records beacons
    end

    def show
        beacon = Beacon.find params[:id]

        render_response beacon, displayable_keys
    end

    def update
        beacon = Beacon.find params[:id]
        beacon.assign_attributes beacon_params

        beacon.save ?
            render_204
            : render_error(beacon)
    end

    def destroy
        Beacon.find(params[:id]).destroy

        render_204
    end

    def create
        beacon = Beacon.new beacon_params

        beacon.save ?
            render_response(beacon, displayable_keys)
            : render_error(beacon)
    end

    private
        def beacon_params
            params.require(:beacon).permit :lot_id, :manufacturer_uuid,
                {coordinates: [:x, :y]}, :major, :minor
        end

        def displayable_keys
            %w(id lot_id manufacturer_uuid major minor coordinates last_activity)
        end

end
