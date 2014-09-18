class TasksController < ApplicationController

    def update_position
      @task = Task.find(params[:id])
      @task.insert_at(params[:position].to_i + 1)

      render nothing: true
    end


  # GET /tasks
  # GET /tasks.json
  def index
    if params[:search]
      @tasks_high = Task.where("title like ?", "%#{params[:search]}%").where('completed != ?', "Yes").where(priority: "High")
      @tasks_medium = Task.where("title like ?", "%#{params[:search]}%").where('completed != ?', "Yes").where(priority: "Medium")
      @tasks_low = Task.where("title like ?", "%#{params[:search]}%").where('completed != ?', "Yes").where(priority: "Low")
      @tasks_completed = Task.where("title like ?", "%#{params[:search]}%").where(completed: "Yes")
      @tasks_today = Task.where('completed != ?', "Yes").where(today_task: "Yes")
    else
      @tasks = Task.all
      @tasks_high = Task.where('completed != ?', "Yes").where(priority: "High")
      @tasks_medium = Task.where('completed != ?', "Yes").where(priority: "Medium")
      @tasks_low = Task.where('completed != ?', "Yes").where(priority: "Low")
      @tasks_today = Task.where('completed != ?', "Yes").where(today_task: "Yes")
      @tasks_completed = Task.where(completed: "Yes")
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
end