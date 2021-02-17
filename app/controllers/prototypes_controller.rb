class PrototypesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
   if Prototype.create(prototype_params)
    redirect_to root_path
   else
    render :new
   end
  end

  def get
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to prototype_path
    else
      render :edit
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments
  end

  def destroy
    prototype = Prototype.find(params[:id])
      if  prototype.destroy
        redirect_to root_path
      end
  end
  
  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :image, :concept).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    unless current_user.id == Prototype.find(params[:id]).user_id
      redirect_to root_path 
    end
  end

end