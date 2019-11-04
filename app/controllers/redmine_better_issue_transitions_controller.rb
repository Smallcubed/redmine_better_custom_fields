class RedmineBetterIssueTransitionsController < ApplicationController

  before_filter :require_login
  accept_api_auth :index

  def index
    respond_to do |format|      
      format.api {
      	begin
          @issue = Issue.find(params[:issue_id])
          roles = roles_for_project(@issue.project)
    	rescue
    	  @issue = nil
    	  roles = nil
    	end
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
