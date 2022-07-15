class AnswersController < ApplicationController
    before_action :authenticate_user!

    def index
        listed_answers = Answer.where(storage: false)

        grade1_answers = listed_answers.where(grade: 1).order(:title)
        grade2_answers = listed_answers.where(grade: 2).order(:title)
        grade3_answers = listed_answers.where(grade: 3).order(:title)
        grade4_answers = listed_answers.where(grade: 4).order(:title)
        grade5_answers = listed_answers.where(grade: 5).order(:title)
        grade6_answers = listed_answers.where(grade: 6).order(:title)
        jh_answers = listed_answers.where(grade: 7).order(:title)
        el_answers = listed_answers.where(grade: 8).order(:title)

        @grade1_answers_japanese = grade1_answers.where(subject: 1)
        @grade1_answers_math = grade1_answers.where(subject: 2)
        @grade1_answers_science = grade1_answers.where(subject: 3)
        @grade1_answers_english = grade1_answers.where(subject: 4)
        @grade1_answers_history = grade1_answers.where(subject: 5)
        @grade1_answers_geography = grade1_answers.where(subject: 6)
        @grade1_answers_civics = grade1_answers.where(subject: 7)

        @grade2_answers_japanese = grade2_answers.where(subject: 1)
        @grade2_answers_math = grade2_answers.where(subject: 2)
        @grade2_answers_science = grade2_answers.where(subject: 3)
        @grade2_answers_english = grade2_answers.where(subject: 4)
        @grade2_answers_history = grade2_answers.where(subject: 5)
        @grade2_answers_geography = grade2_answers.where(subject: 6)
        @grade2_answers_civics = grade2_answers.where(subject: 7)

        @grade3_answers_japanese = grade3_answers.where(subject: 1)
        @grade3_answers_math = grade3_answers.where(subject: 2)
        @grade3_answers_science = grade3_answers.where(subject: 3)
        @grade3_answers_english = grade3_answers.where(subject: 4)
        @grade3_answers_history = grade3_answers.where(subject: 5)
        @grade3_answers_geography = grade3_answers.where(subject: 6)
        @grade3_answers_civics = grade3_answers.where(subject: 7)

        @grade4_answers_japanese = grade4_answers.where(subject: 1)
        @grade4_answers_math = grade4_answers.where(subject: 2)
        @grade4_answers_science = grade4_answers.where(subject: 3)
        @grade4_answers_english = grade4_answers.where(subject: 4)
        @grade4_answers_history = grade4_answers.where(subject: 5)
        @grade4_answers_geography = grade4_answers.where(subject: 6)
        @grade4_answers_civics = grade4_answers.where(subject: 7)

        @grade5_answers_japanese = grade5_answers.where(subject: 1)
        @grade5_answers_math = grade5_answers.where(subject: 2)
        @grade5_answers_science = grade5_answers.where(subject: 3)
        @grade5_answers_english = grade5_answers.where(subject: 4)
        @grade5_answers_history = grade5_answers.where(subject: 5)
        @grade5_answers_geography = grade5_answers.where(subject: 6)
        @grade5_answers_civics = grade5_answers.where(subject: 7)

        @grade6_answers_japanese = grade6_answers.where(subject: 1)
        @grade6_answers_math = grade6_answers.where(subject: 2)
        @grade6_answers_science = grade6_answers.where(subject: 3)
        @grade6_answers_english = grade6_answers.where(subject: 4)
        @grade6_answers_history = grade6_answers.where(subject: 5)
        @grade6_answers_geography = grade6_answers.where(subject: 6)
        @grade6_answers_civics = grade6_answers.where(subject: 7)

        @jh_answers_japanese = jh_answers.where(subject: 1)
        @jh_answers_math = jh_answers.where(subject: 2)
        @jh_answers_science = jh_answers.where(subject: 3)
        @jh_answers_english = jh_answers.where(subject: 4)
        @jh_answers_history = jh_answers.where(subject: 5)
        @jh_answers_geography = jh_answers.where(subject: 6)
        @jh_answers_civics = jh_answers.where(subject: 7)

        @el_answers_japanese = el_answers.where(subject: 1)
        @el_answers_math = el_answers.where(subject: 2)
        @el_answers_science = el_answers.where(subject: 3)
        @el_answers_english = el_answers.where(subject: 4)
        @el_answers_history = el_answers.where(subject: 5)
        @el_answers_geography = el_answers.where(subject: 6)
        @el_answers_civics = el_answers.where(subject: 7)

        @q = Answer.ransack(params[:q])
        @answers = @q.result.order(:subject)
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
            redirect_to answer_path(@answer), notice: '保存しました。'
        else
            flash.now[:error] = '保存に失敗しました。'
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
        params.require(:answer).permit(:title, :memo, :textbook, :grade, :subject, :storage, image: [])
    end

end
