class MessagesController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        render json: Message.all
    end

    def show
      message = Message.where(user_id: params[:id])
      render json: message
    end

        def create 
            msg = Message.new(message_params)
            if msg.save
              render json: msg, status: :created
            else
              render json: msg.errors, status: :unprocessable_entity
            end
        end

        def update
          msg = Message.find(params[:id])
          if msg.update(message_params)
            render json: ["berhasil di edit", msg]
          else
            render json: msg.errors, status: :unprocessable_entity
          end
        end

        def destroy
          msg = Message.find(params[:id])
          msg.destroy
          render json: "berhasil di hapus"
        end
          
          private 
          
          def message_params
            params.permit(:chat, :user_id, :image)
          end

end
