class ReportsController < ApplicationController
  before_action :not_banned, only: [:create, :new, :show]
  before_action -> { correct_user(:moderate) }, only: [:show]
  before_action -> { has_permission(:moderate)}, only: [:index, :respond]

  def index
    if (params[:see_responded]) 
      @reports = Report.all.paginate(page: params[:page], per_page: 30)
    else
      @reports= Report.completed.paginate(page: params[:page], per_page: 30)
    end
  end

  def new
    @report = current_user.reports.build
  end

  def create
    @report = current_user.reports.build(report_params)
    @report.link = params[:link]
    if (@report.save) 
      flash[:secondary] = "Report created. A staff member will respond shortly."
      redirect_to report_path(@report)
    end

  end

  def show
    @report = Report.find(params[:id])
  end

  def respond
    @report = Report.find(params[:id])
    @report.update_attributes(response: params[:response][:response], responder: User.find(params[:user]))
    redirect_to request.referrer
  end

  private 

  def report_params
    params.require(:report).permit(:report, :link, :user_id)
  end


end
