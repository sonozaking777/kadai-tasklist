class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Tasks.new(task_params)

    if @tasks.save
      flash[:success] = 'タスク が正常に追加されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'タスク が作成されませんでした'
      render :new
    end
  end

  def edit
    @message = Task.find(params[:id])
  end

  def update
    @message = Task.find(params[:id])

    if @task.update(message_params)
      flash[:success] = 'タスクは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    flash[:success] = 'タスクは正常に削除されました'
    redirect_to tasks_url
  end
  
  private

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content)
  
end
