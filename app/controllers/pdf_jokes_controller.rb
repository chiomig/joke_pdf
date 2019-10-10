class PdfJokesController < ApplicationController
  def create
    name = params[:name]
    pdf_handler = PdfHandler.new(name)
    begin
      pdf_response = pdf_handler.build_pdf
      render json: pdf_response
    rescue StandardError => e
      render json: { errors: e.to_s }
    end

  end
end
