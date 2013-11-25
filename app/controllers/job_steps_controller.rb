class JobStepsController < ApplicationController
  before_filter :authenticate_user!, only: :fine

  def new
    @job = Job.new
  end

  def edit
    @job = if job.present?
      Job.new job
    else
      current_user.jobs.find(params[:id])
    end
  end

  def preview
    @job = Job.new job_params
    @job.user_id = SecureRandom.random_number(100)
    if @job.valid?
      add_job_cookie
    else
      render 'new'
    end
  end

  def fine
    @job = current_user.jobs.build job
    if @job.save
      flash[:notice] = "operazione eseguita con successo"
      delete_job
    else
      redirect_to new_job_step_path
    end
  end

  private

    def job_params
      params.require(:job).permit(:titolo, :sito_web, :email, :descrizione, :nome_azienda)
    end

    def delete_job
      cookies.delete(:job)
    end

    def add_job_cookie
      cookies[:job] = @job.to_json
    end

    def job
      JSON.parse(cookies[:job] || "{}")
    end
end
