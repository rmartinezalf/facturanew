require 'test_helper'

class DetallesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @detalle = detalles(:one)
  end

  test "should get index" do
    get detalles_url, as: :json
    assert_response :success
  end

  test "should create detalle" do
    assert_difference('Detalle.count') do
      post detalles_url, params: { detalle: { cantidad: @detalle.cantidad, codigoprd: @detalle.codigoprd, impuesto: @detalle.impuesto, nofra: @detalle.nofra, precio: @detalle.precio } }, as: :json
    end

    assert_response 201
  end

  test "should show detalle" do
    get detalle_url(@detalle), as: :json
    assert_response :success
  end

  test "should update detalle" do
    patch detalle_url(@detalle), params: { detalle: { cantidad: @detalle.cantidad, codigoprd: @detalle.codigoprd, impuesto: @detalle.impuesto, nofra: @detalle.nofra, precio: @detalle.precio } }, as: :json
    assert_response 200
  end

  test "should destroy detalle" do
    assert_difference('Detalle.count', -1) do
      delete detalle_url(@detalle), as: :json
    end

    assert_response 204
  end
end
