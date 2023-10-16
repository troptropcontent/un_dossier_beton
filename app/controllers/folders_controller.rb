class FoldersController < ApplicationController
  def index
    @folders = Folder.holded_by_project
  end
end
