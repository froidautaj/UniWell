class SupportsController < AuthController
  load_and_authorize_resource

  before_action :set_support, only: %i[ destroy ]

  # GET /supports or /supports.json
  def index
    @supports = Support.all.order(created_at: :desc).page(params[:page]).per(10)
    @supports_count = Support.all.count
  end

  # POST /supports or /supports.json
  def create
    @support = Support.new(support_params)

    respond_to do |format|
      if @support.save
        format.html { redirect_to support_page_path, notice: "Thank You! Your message has been sent." }
      else
        format.html { render 'pages/support_page', status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supports/1 or /supports/1.json
  def destroy
    @support.destroy!

    respond_to do |format|
      format.html { redirect_to supports_url, notice: "Support was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  def set_support
    @support = Support.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def support_params
    params.require(:support).permit(:name, :email, :phone_number, :message)
  end
end
