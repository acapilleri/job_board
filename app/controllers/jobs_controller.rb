class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:create, :edit, :update, :destroy]
#  before_filter :admin!, except: [:index, :show, :perche]

  def index
    @jobs = jobs
  end

  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to fine_job_steps_path, notice: 'Annuncio aggiunto con successo.'
    else
      render 'new'
    end
  end

  def update
    if @job.update(job_params)
      redirect_to fine_job_steps_path, notice: 'Annuncio modificato con successo.'
    else
      render  'edit'
    end
  end

  def destroy
    @job = current_user.jobs.find(params[:id])
    if @job.destroy
      redirect_to jobs_url(my_jobs: :true), notice: 'Annuncio cancellato con successo.'
    else
      redirect_to jobs_url(my_jobs: :true), notice: 'Annuncio non cancellato.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_params
      params.require(:job).permit(:titolo, :sito_web, :email, :descrizione, :nome_azienda)
    end

    def jobs

      if params[:my_jobs] == "true"
        current_user.jobs.search(params)
      else
        Job.search(params)
      end
    end
end
