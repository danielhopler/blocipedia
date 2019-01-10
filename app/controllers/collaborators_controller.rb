class CollaboratorsController < ApplicationController
  def create
     @wiki = Wiki.find(params[:wiki_id])
     @collaborator = current_user.collaborators.build(wiki: @wiki)

     if @collaborator.save
       flash[:notice] = "Collaborator was added"
     else
       flash[:alert] = "Collaborator couldn't be added."
     end

     redirect_to @wiki
   end


  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = current_user.collaborators.find(params:id)

    if @collaborator.destroy
      flash[:notice] = "Collaborator was removed"
    else
      flash[:alert] = "Collaborator couldn't be deleted."
    end

    redirect_to @wiki
  end
end
