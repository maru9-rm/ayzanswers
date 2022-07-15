class StoragesController < ApplicationController
    before_action :authenticate_user!

    def index
        @storage_answers = Answer.where(storage: true).order(:grade).order(:subject).order(:textbook).order(:title)
    end

end