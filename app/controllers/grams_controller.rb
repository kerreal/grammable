class GramsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @gram = @gram = Gram.find_by_id(params[:id])
    if @gram.blank?
      render plain: 'Not Found :(', status: :not_found
    end
  end

  def create
    @gram = current_user.grams.create(gram_params)
    if @gram.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def gram_params
    params.require(:gram).permit(:message)
  end
end
