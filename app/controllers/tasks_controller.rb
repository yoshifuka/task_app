class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @counts = Task.count
    date
  end

  def new
    @task = Task.new
    date
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :start_at, :end_at, :allday, :memo))
    if @task.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to tasks_path
    else
      flash[:notice] = "スケジュールを登録できませんでした"
      render "new"
    end
  end

  def show
    @task = Task.find(params[:id])
    date
  end

  def edit
    @task = Task.find(params[:id])
    date
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(:title, :start_at, :end_at, :allday, :memo))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to tasks_path
    else
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to tasks_path
  end

  private

  def date
    @date = Date.current.strftime("%Y年 %-m月 %-d日")
  end

end
