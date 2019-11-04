class RedmineBetterIssueTransitionsController < ApplicationController

  before_filter :find_issue
  before_filter :require_login
  accept_api_auth :index

  def index
    respond_to do |format|      
      format.api {
      	@roles = User.current.roles
        @issue = Issue.find(params[:issue_id])
        @workflow = []
        if @roles
          @workflow = WorkflowTransition.where(:tracker_id => @issue.tracker, :role_id => @roles)
        end
      }
    end
  end
  
  def find_issue
    @issue = Issue.find(params[:issue_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

end
