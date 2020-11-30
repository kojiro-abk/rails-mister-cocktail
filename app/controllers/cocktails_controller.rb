class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :destroy]
  
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail
    else
      render "new"
    end
  end

  def show
  end

  # def edit
  # end

  # def update
  #   if @cocktail.update(cocktail_params)
  #     redirect_to @cocktail
  #   else
  #     render "edit"
  #   end
  # end

  def destroy
    if @cocktail.destroy
      redirect_to cocktails_path
    else
      render "show"
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
