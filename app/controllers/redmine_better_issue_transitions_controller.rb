class RedmineBetterIssueTransitionsController < ApplicationController

  before_filter :find_issue
  before_filter :require_login
  accept_api_auth :index

  def index
    respond_to do |format|      
      format.api {
      	roles = User.current.roles.to_a
        @issue = Issue.find(params[:issue_id])
        find_tracker
        if roles && @trackers
          @workflow = WorkflowTransition.where(:tracker_id => @tracker, :role_id => @roles)
        end
      }
    end
  end
  
  def find_issue
    @issue = Issue.find(params[:issue_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def find_tracker
    @tracker = @issue.tracker
    @tracker = nil if @tracker.blank?
  end

end
