class CategoriesController < ApplicationController

  #     1. Psychological: <i class="las la-brain"></i>
  #     2. Nutrition: <i class="las la-apple-alt"></i>
  #     3. Exercise: <i class="las la-running"></i>
  #     4. Social Support: <i class="las la-users"></i>
  #     5. Academic Well-Being: <i class="las la-school"></i>
  #     6. Stress Management: <i class="las la-heartbeat"></i>

  CATEGORY_ICON_MAP = {
    'Psychological' => 'las la-brain',
    'Nutrition' => 'las la-apple-alt',
    'Exercise' => 'las la-running',
    'Social Support' => 'las la-users',
    'Academic Well-Being' => 'las la-school',
    'Stress Management' => 'las la-heartbeat',
  }.freeze

  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = Category.joins(:posts)
                          .select('categories.id, categories.name, count(posts.id) as posts_count')
                          .group('categories.id')
  end

  # GET /categories/1 or /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy!

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :description)
    end
end
