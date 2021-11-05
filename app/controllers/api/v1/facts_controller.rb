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
        @user = Fact.find(params[:id])
        if @fact
            @fact.update(facts_params)
            render json: {message: 'Fact successfully updated.'}, status: 200
        else
            render json: {error: 'Unable to update Fact'}, status: 400
        end
    end

    def destroy
        # @user = Fact.find(params[:id])
        if @fact
            @fact.destroy
            render json: {message: 'Fact successfully deleted.'}, status: 200
        else
            render json: {error: 'Unable to delete fact'}, status: 400
        end
    end

    private

    def fact_params
        params.required(:fact).permit(:fact, :like, :user_id)
    end
    def find_fact
        @fact =  Fact.find(params[:id])
    end

end
