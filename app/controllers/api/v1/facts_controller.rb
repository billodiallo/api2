class Api::V1::FactsController < ApplicationController
    before_action :find_fact, only: [:show, :update, :destroy]

    def index
        @fact = Fact.all
        render json: @facts
    end
end
