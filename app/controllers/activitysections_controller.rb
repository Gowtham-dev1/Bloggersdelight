class ActivitysectionsController < ApplicationController
  before_action :authenticate_userauthentication!

  def view_activity
    @activity=current_userauthentication.activitysections.order('created_at DESC')
  end
end
