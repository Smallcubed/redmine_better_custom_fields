class RedmineBetterIssueTransitionsController < ApplicationController

  before_filter :require_login
  accept_api_auth :index

  def index
    respond_to do |format|      
      format.api {
      	roles = User.current.roles
        @issue = Issue.find?(params[:issue_id])
        @allowed_transitions = []
        if @issue && roles
          workflow = WorkflowTransition.where(:tracker_id => @issue.tracker, :role_id => roles)
          workflow.each do |transition|
          	if transition.old_status_id == @issue.status_id
          	  @allowed_transitions.push(transition.new_status_id)
          	end
          end
        end
      }
    end
  end
  
end
