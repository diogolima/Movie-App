module ApplicationHelper

  def owner(user, path, notice)
    if user != current_user
      respond_to do |format|
        format.html { redirect_to path, notice: notice}
        format.json { head :no_content }
      end
    end
  end
end
