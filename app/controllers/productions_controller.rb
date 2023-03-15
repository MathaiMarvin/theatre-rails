class ProductionsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :rendered_unprocessable_entity
    def index
        render json: Production.all, status: :ok
    end

    def show
       
        production = Production.find_by(id: params[:id])
        if production
            render json: production, only: [:title, :genre,:budget, :director], methods: [:title_director],status: :ok
        else
            render json: {error:"Production not found"}, status: :notfound
        end
    end
    def create
        production = Production.create!(production_params)

        render json: production, status: :created

    # rescue ActiveRecord::RecordInvalid => invalid
    #     render json: {error: invalid.record.errors}, status: :unprocessable_entity
        # if production.valid?
        # render json: production, status: :created
        # else
        #     production.errors.full_messages
        # end

    end
    def destroy
                # Find the production that needs deleting
                production = Production.find_by(id: params[:id])
                if production
                     # delete it
                    production.destroy
                    head :no_content
                else
                    render json: {error:"Production not found"}, status: :notfound
                end

    end
    def update
        # Find the production that needs updating
        production = Production.find_by(id: params[:id])
        if production
             # Update it
            render json: production.update(production_params), status: :accepted
        else
            render json: {error:"Production not found"}, status: :notfound
        end

       
    end
    

    private
    def production_params
        params.permit(:title, :genre, :budget, :image, :director, :ongoing)
    end
    def rendered_unprocessable_entity(invalid)
        render json: {error: invalid.record.errors}, status: :unprocessable_entity

    end
end
