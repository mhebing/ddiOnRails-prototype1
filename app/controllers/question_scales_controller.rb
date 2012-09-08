class QuestionScalesController < ApplicationController
  # GET /question_scales
  # GET /question_scales.json
  def index
    @question_scales = QuestionScale.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @question_scales }
    end
  end

  # GET /question_scales/1
  # GET /question_scales/1.json
  def show
    @question_scale = QuestionScale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question_scale }
    end
  end

  # GET /question_scales/new
  # GET /question_scales/new.json
  def new
    @question_scale = QuestionScale.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question_scale }
    end
  end

  # GET /question_scales/1/edit
  def edit
    @question_scale = QuestionScale.find(params[:id])
  end

  # POST /question_scales
  # POST /question_scales.json
  def create
    @question_scale = QuestionScale.new(params[:question_scale])

    respond_to do |format|
      if @question_scale.save
        format.html { redirect_to @question_scale, notice: 'Question scale was successfully created.' }
        format.json { render json: @question_scale, status: :created, location: @question_scale }
      else
        format.html { render action: "new" }
        format.json { render json: @question_scale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /question_scales/1
  # PUT /question_scales/1.json
  def update
    @question_scale = QuestionScale.find(params[:id])

    respond_to do |format|
      if @question_scale.update_attributes(params[:question_scale])
        format.html { redirect_to @question_scale, notice: 'Question scale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @question_scale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_scales/1
  # DELETE /question_scales/1.json
  def destroy
    @question_scale = QuestionScale.find(params[:id])
    @question_scale.destroy

    respond_to do |format|
      format.html { redirect_to question_scales_url }
      format.json { head :no_content }
    end
  end
end
