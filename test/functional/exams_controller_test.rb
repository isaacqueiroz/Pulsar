require 'test_helper'

class ExamsControllerTest < ActionController::TestCase
  setup do
    @exam = exams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exam" do
    assert_difference('Exam.count') do
      post :create, exam: { acidourico: @exam.acidourico, androst: @exam.androst, bilirrubina: @exam.bilirrubina, catomico: @exam.catomico, cknac: @exam.cknac, cortisol: @exam.cortisol, creatina: @exam.creatina, cristais: @exam.cristais, densidade: @exam.densidade, estradiol: @exam.estradiol, fosfatase: @exam.fosfatase, fsh: @exam.fsh, ggt: @exam.ggt, glicose: @exam.glicose, hdl: @exam.hdl, hemoglobina: @exam.hemoglobina, homocist: @exam.homocist, insulina: @exam.insulina, ldl: @exam.ldl, lh: @exam.lh, lipoprot: @exam.lipoprot, lpo: @exam.lpo, ph: @exam.ph, prolactina: @exam.prolactina, sedimento: @exam.sedimento, shbg: @exam.shbg, soridutoras: @exam.soridutoras, t3: @exam.t3, t4: @exam.t4, teslivre: @exam.teslivre, testosterona: @exam.testosterona, tgo: @exam.tgo, tgp: @exam.tgp, tsh: @exam.tsh, ureia: @exam.ureia, vldl: @exam.vldl }
    end

    assert_redirected_to exam_path(assigns(:exam))
  end

  test "should show exam" do
    get :show, id: @exam
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exam
    assert_response :success
  end

  test "should update exam" do
    put :update, id: @exam, exam: { acidourico: @exam.acidourico, androst: @exam.androst, bilirrubina: @exam.bilirrubina, catomico: @exam.catomico, cknac: @exam.cknac, cortisol: @exam.cortisol, creatina: @exam.creatina, cristais: @exam.cristais, densidade: @exam.densidade, estradiol: @exam.estradiol, fosfatase: @exam.fosfatase, fsh: @exam.fsh, ggt: @exam.ggt, glicose: @exam.glicose, hdl: @exam.hdl, hemoglobina: @exam.hemoglobina, homocist: @exam.homocist, insulina: @exam.insulina, ldl: @exam.ldl, lh: @exam.lh, lipoprot: @exam.lipoprot, lpo: @exam.lpo, ph: @exam.ph, prolactina: @exam.prolactina, sedimento: @exam.sedimento, shbg: @exam.shbg, soridutoras: @exam.soridutoras, t3: @exam.t3, t4: @exam.t4, teslivre: @exam.teslivre, testosterona: @exam.testosterona, tgo: @exam.tgo, tgp: @exam.tgp, tsh: @exam.tsh, ureia: @exam.ureia, vldl: @exam.vldl }
    assert_redirected_to exam_path(assigns(:exam))
  end

  test "should destroy exam" do
    assert_difference('Exam.count', -1) do
      delete :destroy, id: @exam
    end

    assert_redirected_to exams_path
  end
end
