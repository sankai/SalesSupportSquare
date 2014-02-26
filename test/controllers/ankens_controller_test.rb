require 'test_helper'

class AnkensControllerTest < ActionController::TestCase
  setup do
    @anken = ankens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ankens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anken" do
    assert_difference('Anken.count') do
      post :create, anken: { anken_chusi_date: @anken.anken_chusi_date, anken_kanryo_date: @anken.anken_kanryo_date, anken_kbn: @anken.anken_kbn, anken_syukka_date: @anken.anken_syukka_date, c_hacchusho_no: @anken.c_hacchusho_no, e_bmn_id: @anken.e_bmn_id, e_shain_id: @anken.e_shain_id, e_shain_id: @anken.e_shain_id, eigyo_comment: @anken.eigyo_comment, enduser_id: @anken.enduser_id, gassan_seikyu_date: @anken.gassan_seikyu_date, genka_kingaku: @anken.genka_kingaku, hiyo_kbn: @anken.hiyo_kbn, jch_arari_kingaku: @anken.jch_arari_kingaku, jch_arari_rate: @anken.jch_arari_rate, jch_bmn_id: @anken.jch_bmn_id, jch_date: @anken.jch_date, jch_kakudo: @anken.jch_kakudo, jch_name: @anken.jch_name, jch_no: @anken.jch_no, jch_status: @anken.jch_status, jch_yotei_date: @anken.jch_yotei_date, jky_memo_comp: @anken.jky_memo_comp, jky_memo_kadai: @anken.jky_memo_kadai, jky_memo_keyman: @anken.jky_memo_keyman, kingaku: @anken.kingaku, kkk_id: @anken.kkk_id, mitmr_eda_no: @anken.mitmr_eda_no, mitmr_name: @anken.mitmr_name, mitmr_no: @anken.mitmr_no, mtmr_date: @anken.mtmr_date, mtmr_irai_date: @anken.mtmr_irai_date, mtmr_kaito_kigen_date: @anken.mtmr_kaito_kigen_date, nensho_yosan: @anken.nensho_yosan, prj_code: @anken.prj_code, prj_name: @anken.prj_name, renban: @anken.renban, sakusei_step: @anken.sakusei_step, sei_shain_id: @anken.sei_shain_id, sei_‚‚‚‚Ž_id: @anken.sei_‚‚‚‚Ž_id, seikyu_status: @anken.seikyu_status, seikyusho: @anken.seikyusho, seikyusho_date: @anken.seikyusho_date, shubetsu: @anken.shubetsu, sk_bmn_id: @anken.sk_bmn_id, sk_shain_id: @anken.sk_shain_id, snksgy_sign: @anken.snksgy_sign, snksgy_sn_date: @anken.snksgy_sn_date, status: @anken.status, teian_date: @anken.teian_date, teian_irai_date: @anken.teian_irai_date, theme2: @anken.theme2, uri_j_jinen: @anken.uri_j_jinen, uri_j_zennen: @anken.uri_j_zennen, uri_project: @anken.uri_project, uri_y_final: @anken.uri_y_final, uri_y_jinen: @anken.uri_y_jinen, uri_y_zennen: @anken.uri_y_zennen, uribunya_id: @anken.uribunya_id }
    end

    assert_redirected_to anken_path(assigns(:anken))
  end

  test "should show anken" do
    get :show, id: @anken
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @anken
    assert_response :success
  end

  test "should update anken" do
    patch :update, id: @anken, anken: { anken_chusi_date: @anken.anken_chusi_date, anken_kanryo_date: @anken.anken_kanryo_date, anken_kbn: @anken.anken_kbn, anken_syukka_date: @anken.anken_syukka_date, c_hacchusho_no: @anken.c_hacchusho_no, e_bmn_id: @anken.e_bmn_id, e_shain_id: @anken.e_shain_id, e_shain_id: @anken.e_shain_id, eigyo_comment: @anken.eigyo_comment, enduser_id: @anken.enduser_id, gassan_seikyu_date: @anken.gassan_seikyu_date, genka_kingaku: @anken.genka_kingaku, hiyo_kbn: @anken.hiyo_kbn, jch_arari_kingaku: @anken.jch_arari_kingaku, jch_arari_rate: @anken.jch_arari_rate, jch_bmn_id: @anken.jch_bmn_id, jch_date: @anken.jch_date, jch_kakudo: @anken.jch_kakudo, jch_name: @anken.jch_name, jch_no: @anken.jch_no, jch_status: @anken.jch_status, jch_yotei_date: @anken.jch_yotei_date, jky_memo_comp: @anken.jky_memo_comp, jky_memo_kadai: @anken.jky_memo_kadai, jky_memo_keyman: @anken.jky_memo_keyman, kingaku: @anken.kingaku, kkk_id: @anken.kkk_id, mitmr_eda_no: @anken.mitmr_eda_no, mitmr_name: @anken.mitmr_name, mitmr_no: @anken.mitmr_no, mtmr_date: @anken.mtmr_date, mtmr_irai_date: @anken.mtmr_irai_date, mtmr_kaito_kigen_date: @anken.mtmr_kaito_kigen_date, nensho_yosan: @anken.nensho_yosan, prj_code: @anken.prj_code, prj_name: @anken.prj_name, renban: @anken.renban, sakusei_step: @anken.sakusei_step, sei_shain_id: @anken.sei_shain_id, sei_‚‚‚‚Ž_id: @anken.sei_‚‚‚‚Ž_id, seikyu_status: @anken.seikyu_status, seikyusho: @anken.seikyusho, seikyusho_date: @anken.seikyusho_date, shubetsu: @anken.shubetsu, sk_bmn_id: @anken.sk_bmn_id, sk_shain_id: @anken.sk_shain_id, snksgy_sign: @anken.snksgy_sign, snksgy_sn_date: @anken.snksgy_sn_date, status: @anken.status, teian_date: @anken.teian_date, teian_irai_date: @anken.teian_irai_date, theme2: @anken.theme2, uri_j_jinen: @anken.uri_j_jinen, uri_j_zennen: @anken.uri_j_zennen, uri_project: @anken.uri_project, uri_y_final: @anken.uri_y_final, uri_y_jinen: @anken.uri_y_jinen, uri_y_zennen: @anken.uri_y_zennen, uribunya_id: @anken.uribunya_id }
    assert_redirected_to anken_path(assigns(:anken))
  end

  test "should destroy anken" do
    assert_difference('Anken.count', -1) do
      delete :destroy, id: @anken
    end

    assert_redirected_to ankens_path
  end
end
