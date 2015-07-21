class InboundsController < ApplicationController
  def index
    respond_to do |format|
      format.xml { "index.xml" }
    end
  end
end
