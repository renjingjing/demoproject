class ProducersController < ApplicationController
  def index
    @producers=Producer.all
  end
end
