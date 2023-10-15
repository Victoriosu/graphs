class GraphsController < ApplicationController
  before_action :set_graph, only: %i[ show edit update destroy ]

  def refresh_goals_info
    redirect_to root_path
  end

  # GET /graphs or /graphs.json
  def index
    total_sum = 0
    @gpa = GoalProfit.where('goal_id = 6 AND variation != 0' ).pluck(:registered_date, :variation)
    @gpa.each do |as|
      total_sum += as[1]
      as[1] = total_sum
    end 
    @graphs = Graph.all
  end

  # GET /graphs/1 or /graphs/1.json
  def show
  end

  # GET /graphs/new
  def new
    @graph = Graph.new
  end

  # GET /graphs/1/edit
  def edit
  end

  # POST /graphs or /graphs.json
  def create
    @graph = Graph.new(graph_params)

    respond_to do |format|
      if @graph.save
        format.html { redirect_to graph_url(@graph), notice: "Graph was successfully created." }
        format.json { render :show, status: :created, location: @graph }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @graph.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /graphs/1 or /graphs/1.json
  def update
    respond_to do |format|
      if @graph.update(graph_params)
        format.html { redirect_to graph_url(@graph), notice: "Graph was successfully updated." }
        format.json { render :show, status: :ok, location: @graph }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @graph.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graphs/1 or /graphs/1.json
  def destroy
    @graph.destroy!

    respond_to do |format|
      format.html { redirect_to graphs_url, notice: "Graph was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_graph
      @graph = Graph.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def graph_params
      params.require(:graph).permit(:name, :list_order)
    end
end
