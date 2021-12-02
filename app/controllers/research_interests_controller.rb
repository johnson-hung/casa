class ResearchInterestsController < ApplicationController
  before_action :set_research_interest, only: [:show, :edit, :update, :destroy]

  # GET /research_interests
  def index
    @research_interests = ResearchInterest.all
  end

  # GET /research_interests/1
  def show
  end

  # GET /research_interests/new
  def new
    @research_interest = ResearchInterest.new
  end

  # GET /research_interests/1/edit
  def edit
  end

  # POST /research_interests
  def create
    @research_interest = ResearchInterest.new(research_interest_params)

    if @research_interest.save
      redirect_to @research_interest, notice: 'Research interest was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /research_interests/1
  def update
    if @research_interest.update(research_interest_params)
      redirect_to @research_interest, notice: 'Research interest was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /research_interests/1
  def destroy
    @research_interest.destroy
    redirect_to research_interests_url, notice: 'Research interest was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_research_interest
      @research_interest = ResearchInterest.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def research_interest_params
      params.require(:research_interest).permit(:field)
    end
end
