class RoomController < ApplicationController
    def index 
        render json: Room.all 
    end

    def show
        render json: Room.find(params[:id])
    end

    def create
        room = Room.new(room_params)
        if room.save
            render json: room, status: :created
        else
            render json: room.errors, status: :unprocessable_entity
        end
    end

    def update
        room = Room.find(params[:id])
        if room.update(room_params)
            render json: room
        else
            render json: room.errors, status: :unprocessable_entity
        end
    end

    def destroy
       room = Room.find(params[:id])
       room.destroy
       render json: "berhasil di hapus"
    end

    private

    def room_params
       params.permit(:nama, :deskripsi, :tipe)
    end
end
