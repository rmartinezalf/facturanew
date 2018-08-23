module Api
    module V1
        class ProductosController <  ApplicationController
            def index
              productos = Producto.order('created_at DESC') ;
              render json:{status: 'Success',message:'load productos',data:productos}, status: :ok
            end
        end
    end
end