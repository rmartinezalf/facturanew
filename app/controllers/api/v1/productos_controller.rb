module Api
    module V1
        class productosController <  ApplicationController
            before_action :set_producto, only: [:edit, :update]
            def index
              productos = producto.order('created_at DESC') ;
              render json:{status: 'Success',message:'load productos',data:productos}, status: :ok
            end
            # GET /productos/1
            def show                                
                render json:{status: 'Success',message:'load productos',data:@producto}, status: :ok
            end
            # POST /productos
            def create
               @prod = producto.new(producto_params)

               if @prod.save
                  # UserMailer.with(producto: @prod).user_email.deliver
                  render json:{status: 'Success',message:'load productos',data:@prod}, status: :ok
               else
                   render json: @prod.errors, status: :unprocessable_entity
               end
            end          
            # PATCH/PUT /productos/1
            def update
              if @producto.update(producto_params)
                render json: @producto
              else
                render json: @producto.errors, status: :unprocessable_entity
              end
            end  
             # DELETE /productos/1
            def destroy
                @producto = producto.find(params[:id])
                if @producto.present?
                  @producto.destroy
                end
            end
            private
                # Use callbacks to share common setup or constraints between actions.
                def set_producto
                    @producto = producto.find(params[:id])
                end

                # Only allow a trusted parameter "white list" through.
                def producto_params                    
                    params.permit(:descripcion,      :unidad,      :impuesto,      :precio)
                    codigo
      
            end
        end
    end
end