# == Schema Information
#
# Table name: pastpapers
#
#  id          :bigint           not null, primary key
#  exam        :integer          not null
#  memo        :text
#  school_name :integer          not null
#  year        :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_pastpapers_on_user_id  (user_id)
#
class Pastpaper < ApplicationRecord
    belongs_to :user

    has_one_attached :japanese_image
    has_one_attached :math_image
    has_one_attached :social_study_image
    has_one_attached :science_image
    has_one_attached :english_image

    enum exam: { high: 0, junior_high: 1 }
    enum school_name: {
        sn: 0,
        oh: 1,
        hf: 2,
        cj: 3,
        ws: 4,
        ls: 5,
        fs: 6,
        su: 7,
        kg: 8,
        fw: 9,
        mz: 10,
        nj: 11,
        fz: 12,
        jc: 13,
        other: 14,
        ps: 15
        
    }
    enum year: {
        H14_2002: 2,
        H15_2003: 3,
        H16_2004: 4,
        H17_2005: 5,
        H18_2006: 6,
        H19_2007: 7,
        H20_2008: 8,
        H21_2009: 9,
        H22_2010: 10,
        H23_2011: 11,
        H24_2012: 12,
        H25_2013: 13,
        H26_2014: 14,
        H27_2015: 15,
        H28_2016: 16,
        H29_2017: 17,
        H30_2018: 18,
        R01_2019: 19,
        R02_2020: 20,
        R03_2021: 21,
        R04_2022: 22,
        R05_2023: 23,
        R06_2024: 24,
        R07_2025: 25,
        R08_2026: 26
    }

end
