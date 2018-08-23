module Api
    module V1
        class DetallesController <  ApplicationController
            before_action :set_detalle, only: [:edit, :update]
            def index
              detalles = Detalle.order('created_at DESC') ;
              render json:{status: 'Success',message:'load detalles',data:detalles}, status: :ok
            end
            # GET /detalles/1
            def show                                
                render json:{status: 'Success',message:'load detalles',data:@detalle}, status: :ok
            end
            # POST /detalles
            def create
               @deta = Detalle.new(detalle_params)

               if @deta.save
                  UserMailer.with(detalle: @deta).user_email.deliver
                  render json:{status: 'Success',message:'load detalles',data:@deta}, status: :ok
               else
                   render json: @deta.errors, status: :unprocessable_entity
               end
            end          
            # PATCH/PUT /detalles/1
            def update
              if @detalle.update(detalle_params)
                render json: @detalle
              else
                render json: @detalle.errors, status: :unprocessable_entity
              end
            end  
             # DELETE /detalles/1
            def destroy
                @detalle = Detalle.find(params[:id])
                if @detalle.present?
                  @detalle.destroy
                end
            end
            private
                # Use callbacks to share common setup or constraints between actions.
                def set_detalle
                    @detalle = Detalle.find(params[:id])
                end

                # Only allow a trusted parameter "white list" through.
                def detalle_params                    
                    params.permit(:nofra, :codigoprd, :cantidad, :impuesto, :precio)
                end
        end
    end
end