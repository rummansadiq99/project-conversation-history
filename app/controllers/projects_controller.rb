class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :update_status, :add_comment]

  def index
    @projects = Project.all
  end

  def show
    @comment = Comment.new
    @conversation_items = @project.conversation_items
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    
    if @project.save
      StatusChange.create!(
        project: @project,
        user: current_user,
        old_status: Project::DEFAULT_STATUS,
        new_status: @project.status
      )
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update_status
    old_status = @project.status
    if @project.update(status: params[:status])
      StatusChange.create!(
        project: @project,
        user: current_user,
        old_status: old_status,
        new_status: params[:status]
      )
      redirect_to @project, notice: 'Project status updated successfully.'
    else
      redirect_to @project, alert: 'Unable to update project status.'
    end
  end

  def add_comment
    @comment = @project.comments.build(comment_params)
    @comment.user = current_user
    
    if @comment.save
      redirect_to @project, notice: 'Comment added successfully.'
    else
      redirect_to @project, alert: 'Unable to add comment.'
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name)
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end 