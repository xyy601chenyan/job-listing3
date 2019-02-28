class JobsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]

  def index
    @jobs = Job.find_each(batch_size:500)
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to jobs_path,notice: "成功发布职位"
    else
      render action: :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to jobs_path,notice: "已成功更新职位"
    else
      render action: :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path,alert: "已删除该职位"
  end

  private
  def job_params
    params.require(:job).permit(:title,:description)
  end
end
