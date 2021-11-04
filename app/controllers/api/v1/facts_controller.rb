class Api::V1::FactsController < ApplicationController
    before_action :find_fact, only: [:show, :update, :destroy]

    def index
        @facts = Fact.all
        render json: @facts
    end

    def show
        render json: @fact

    end
# POST METHOD POST/users
    def create 
        @fact = Fact.new(fact_params)
        if @fact.save
        render json: @fact
        else 
            render error: {error: 'Unable to create fact.', status: 400}

        end
    end

# PUT /users/id

    def update
        @user = User.find(params[:id])
        if @user
            @user.update(user_params)
            render json: {message: 'User successfully updated.'}, status: 200
        else
            render json: {error: 'Unable to update User'}, status: 400
        end
    end

    def destroy
        @user = User.find(params[:id])
        if @user
            @user.destroy(user_params)
            render json: {message: 'User successfully deleted.'}, status: 200
        else
            render json: {error: 'Unable to delete User'}, status: 400
        end
    end

    private

    def user_params
        params.required 
    end

end
