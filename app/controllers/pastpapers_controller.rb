class PastpapersController < ApplicationController
    before_action :authenticate_user!

    def index
        @pastpapers =Pastpaper.order(:exam).order(:school_name).order(:year)
        @pastpapers_sn =Pastpaper.where(school_name: 0).order(:year)
        @pastpapers_oh =Pastpaper.where(school_name: 2).order(:year)
        @pastpapers_cj =Pastpaper.where(school_name: 3).order(:year)
        @pastpapers_ws =Pastpaper.where(school_name: 4).order(:year)
        @pastpapers_ls =Pastpaper.where(school_name: 5).order(:year)
        @pastpapers_fs =Pastpaper.where(school_name: 6).order(:year)
        @pastpapers_su =Pastpaper.where(school_name: 7).order(:year)
        @pastpapers_kg =Pastpaper.where(school_name: 8).order(:year)
        @pastpapers_fw =Pastpaper.where(school_name: 9).order(:year)
        @pastpapers_mz =Pastpaper.where(school_name: 10).order(:year)
        @pastpapers_nj =Pastpaper.where(school_name: 11).order(:year)
        @pastpapers_fz =Pastpaper.where(school_name: 12).order(:year)
        @pastpapers_jc =Pastpaper.where(school_name: 13).order(:year)
        @pastpapers_other =Pastpaper.where(school_name: 14).order(:year)

        @q = Pastpaper.ransack(params[:q])
        @limited_pastpapers = @q.result.order(:exam).order(:school_name).order(:year)
    end

    def show
        @pastpaper = Pastpaper.find(params[:id])
    end

    def new
        @pastpaper = current_user.pastpapers.build
    end

    def create
        @pastpaper = current_user.pastpapers.build(pastpaper_params)
        if @pastpaper.save
            redirect_to pastpaper_path(@pastpaper), notice: '保存しました。'
        else
            flash.now[:error] = '保存に失敗しました。'
            render :new
        end
    end

    def edit
        @pastpaper = current_user.pastpapers.find(params[:id])
    end

    def update
        @pastpaper = current_user.pastpapers.find(params[:id])
        if @pastpaper.update(pastpaper_params)
            redirect_to pastpaper_path(@pastpaper), notice: '更新しました。'
        else
            flash.now[:error] = '更新できませんでした。'
            render :edit
        end
    end

    def destroy
        pastpaper = current_user.pastpapers.find(params[:id])
        pastpaper.destroy!
        redirect_to pastpapers_path, notice: '削除に成功しました。'
    end

    private

    def pastpaper_params
        params.require(:pastpaper).permit(
            :school_name,
            :year,
            :memo,
            :exam,
            :japanese_image,
            :math_image,
            :social_study_image,
            :science_image,
            :english_image
            )
    end


end


