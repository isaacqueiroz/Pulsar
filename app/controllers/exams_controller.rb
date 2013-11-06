class ExamsController < ApplicationController
  # GET /exams
  # GET /exams.json
  def index
    @user = current_user
    @exams = @user.exams.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exams }
    end
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
    @user = current_user
    
    @exam = @user.exams.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exam }
    end
  end

  # GET /exams/new
  # GET /exams/new.json
  def new
    @user = current_user
    
    @exam = Exam.new

    @exam.build_user

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exam }
    end
  end

  # GET /exams/1/edit
  def edit
    @user = current_user
    
    @exam = @user.exams.find(params[:id])
  end

  # POST /exams
  # POST /exams.json
  def create
    @user = current_user
    
    @exam = @user.exams.new(params[:exam])

    respond_to do |format|
      if @exam.save
        format.html { redirect_to [@user,@exam], notice: 'Exame criado com sucesso!' }
        format.json { render json: [@user,@exam], status: :created, location: @exam }
      else
        format.html { render action: "new" }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exams/1
  # PUT /exams/1.json
  def update
    @user = current_user
    
    @exam = @user.exams.find(params[:id])

    respond_to do |format|
      if @exam.update_attributes(params[:exam])
        format.html { redirect_to [@user,@exam], notice: 'Exame modificado com sucesso!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @user = current_user
    
    @exam = @user.exams.find(params[:id])
    @exam.destroy

    respond_to do |format|
      format.html { redirect_to exams_url }
      format.json { head :no_content }
    end
  end
end
