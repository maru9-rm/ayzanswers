class LessonAnswersController < ApplicationController
    before_action :authenticate_user!

    def index
        @lesson_answers = LessonAnswer.all
    end

    def show
        @lesson_answer = LessonAnswer.find(params[:id])
    end

    def new
        @lesson_answer = current_user.lesson_answers.build
    end

    def create
        @lesson_answer = current_user.lesson_answers.build(lesson_answer_params)
        if @lesson_answer.save
            redirect_to lesson_answer_path(@lesson_answer), notice: '保存しました。'
        else
            flash.now[:error] = '保存に失敗しました。'
            render :new
        end
    end

    def edit
        @lesson_answer = current_user.lesson_answers.find(params[:id])
    end

    def update
        @lesson_answer = current_user.lesson_answers.find(params[:id])
        if @lesson_answer.update(lesson_answer_params)
            redirect_to lesson_answer_path(@lesson_answer), notice: '更新しました。'
        else
            flash.now[:error] = '更新できませんでした。'
            render :edit
        end
    end

    def destroy
        lesson_answer = current_user.lesson_answers.find(params[:id])
        lesson_answer.destroy!
        redirect_to lesson_answers_path, notice: '削除に成功しました。'
    end

    private

    def lesson_answer_params
        params.require(:lesson_answer).permit(:title, :memo, :student, image: [])
    end


end