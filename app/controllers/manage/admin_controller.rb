class Manage::AdminController < Manage::BaseController
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin }
    end
  end

end