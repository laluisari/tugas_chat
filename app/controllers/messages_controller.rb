class MessagesController < ApplicationController
    # skip_before_action :verify_authenticity_token
    def index
        render json: Message.all
    end


        def create 
            msg = Message.new(message_params)
            if msg.save
              render json: msg, status: :created
            else
              render json: msg.errors, status: :unprocessable_entity
            end
        end
          
          private 
          
          def message_params
            params.permit(:chat, :user_id, :image)
          end

end
