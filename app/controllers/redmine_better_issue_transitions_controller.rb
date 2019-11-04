class RedmineBetterIssueTransitionsController < ApplicationController

  before_filter :find_issue
  before_filter :require_login
  accept_api_auth :index

  def index
    respond_to do |format|      
      format.api {
        @issue = Issue.find(params[:issue_id])
        @allowed_statuses = @issue.new_statuses_allowed_to(User.current, true)
      }
    end
  end
  
  def find_issue
    @issue = Issue.find(params[:issue_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

end
