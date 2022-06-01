class AnswersController < ApplicationController
    before_action :authenticate_user!

    def index
        @grade1_answer = Answer.where(grade: 1)
        @grade2_answer = Answer.where(grade: 2)
        @grade3_answer = Answer.where(grade: 3)
        @answers = Answer.all
    end

    def show
        @answer = Answer.find(params[:id])
    end

    def new
        @answer = current_user.answers.build
    end

    def create
        @answer = current_user.answers.build(answer_params)
        if @answer.save
            redirect_to answer_path(@answer), notice: '保存できたよ'
        else
            flash.now[:error] = '保存に失敗しました'
            render :new
        end
    end

    def edit
        @answer = current_user.answers.find(params[:id])
    end

    def update
        @answer = current_user.answers.find(params[:id])
        if @answer.update(answer_params)
            redirect_to answer_path(@answer), notice: '更新しました。'
        else
            flash.now[:error] = '更新できませんでした。'
            render :edit
        end
    end

    def destroy
        answer = current_user.answers.find(params[:id])
        answer.destroy!
        redirect_to root_path, notice: '削除に成功しました。'
    end

    private

    def answer_params
        params.require(:answer).permit(:title, :memo, :grade, :subject, image: [])
    end

end
