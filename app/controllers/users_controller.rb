class UsersController < ApplicationController
    # skip_before_action :verify_authenticity_token
    # before_action :authorize_request, except: %i[create confirm_email index destroy]
    before_action :find_user, except: %i[create index confirm_email]

    def index 
        render json: User.all 
    end

    def show
        render json: User.find(params[:id])
    end

    def create
        user = User.new(user_params)
        if user.save
            UserMailer.registration_confirmation(user).deliver_now
            render json: user, status: :created
        else
            render json: user.errors, status: :unprocessable_entity
        end
    end

    def confirm_email
        user = User.find_by_confirm_token(params[:id])
        if user
          user.email_activate
          render json: "Email TerVerifikasi"
        else
          render json: { errors: "Email tidak Terverifikasi" }, status: :bad_request
        end
    end
  

    def update
        user = User.find(params[:id])
        if user.update(user_params)
            render json: user
        else
            render json: user.errors, status: :unprocessable_entity
        end
    end

    def destroy
       user = User.find(params[:id])
       user.destroy
       render json: "berhasil di hapus", status: :ok
    end

    private

    def find_user
        @user = User.find(params[:id])
        rescue ActiveRecord::RecordNotFound
          render json: { errors: 'User not found' }, status: :not_found
      end

    def user_params
       params.require(:user).permit(
        :nama, :email, :password, :password_confirmation)
    end

end
