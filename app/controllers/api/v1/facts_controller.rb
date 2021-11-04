class Api::V1::FactsController < ApplicationController
    before_action :find_fact, only: [:show, :update, :destroy]

    def index
        @facts = Fact.all
        render json: @facts
    end

    def show
        render json: @fact

    end

    def create 
        @fact = Fact.new(fact_params)
        if @fact.save
        render json: @fact
        else 
            render error: {error: 'Unable to create fact.', status: 400}

        end
    end

    

end
