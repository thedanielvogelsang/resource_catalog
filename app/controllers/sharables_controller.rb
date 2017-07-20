class SharablesController < ApplicationController
  def new
    @sharable = Sharable.new()
  end

  def index
    @sharables = Sharable.all
    @sharable = Sharable.new()
  end

  def create
  @sharable = Sharable.new(sharable_params)
    if @sharable.save
      flash[:success] = "hey! we could use that for sure!"
      redirect_to sharables_path
    else
      flash[:error] = "no resource given"
      redirect_to sharables_path
    end
  end


  private

    def sharable_params
      params.require(:sharable).permit(:sharable)
    end

end
