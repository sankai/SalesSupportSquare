class CreateAnkens < ActiveRecord::Migration
  def change
    create_table :ankens do |t|
      t.string :status
      t.string :mitmr_no
      t.string :mitmr_eda_no
      t.integer :kkk_id
      t.integer :sk_bmn_id
      t.integer :sk_shain_id
      t.integer :e_bmn_id
      t.integer :e_shain_id
      t.string :mitmr_name
      t.string :jch_name
      t.string :prj_name
      t.string :prj_code
      t.string :hiyo_kbn
      t.integer :uribunya_id
      t.string :shubetsu
      t.string :theme2
      t.integer :enduser_id
      t.string :uri_project
      t.integer :nensho_yosan
      t.integer :kingaku
      t.date :jch_yotei_date
      t.string :jch_no
      t.date :jch_date
      t.date :snksgy_sn_date
      t.string :snksgy_sign
      t.integer :genka_kingaku
      t.integer :jch_arari_kingaku
      t.float :jch_arari_rate
      t.integer :uri_y_zennen
      t.integer :uri_y_jinen
      t.integer :uri_y_final
      t.integer :uri_j_zennen
      t.integer :uri_j_jinen
      t.string :jch_kakudo
      t.string :eigyo_comment
      t.string :jky_memo_comp
      t.string :jky_memo_keyman
      t.string :jky_memo_kadai
      t.date :teian_irai_date
      t.date :teian_date
      t.string :c_hacchusho_no
      t.date :mtmr_irai_date
      t.date :mtmr_kaito_kigen_date
      t.date :mtmr_date
      t.date :anken_chusi_date
      t.date :anken_kanryo_date
      t.date :anken_syukka_date
      t.string :seikyusho
      t.date :seikyusho_date
      t.date :gassan_seikyu_date
      t.string :anken_kbn
      t.integer :e_shain_id
      t.integer :jch_bmn_id
      t.integer :sei_shain_id
      t.integer :sei_bmn_id
      t.string :jch_status
      t.string :seikyu_status
      t.string :sakusei_step
      t.string :renban

      t.timestamps
    end
  end
end
