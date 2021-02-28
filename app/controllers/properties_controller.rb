class PropertiesController < ApplicationController

    # GET /properties
    def index
        render json: Property.all, :include => :cover
    end

    # GET /properties/{id}
    def show
        @property = Property.find params[:id]
        if @property.save
            render_property_json 200, @property
        else
            render_property_json 500, @property
        end
    end

    # POST /properties/{id}
    def create
        @property = Property.new(property_params)

        if @property.save
            render_property_json 200, @property
        else
            render_property_json 500, @property
        end
    end

    # PUT/PATCH /properties/{id}
    def update
        @property = Property.find params[:id]
        if @property.update_attributes(property_params)
            render_property_json 200, @property
        else
            render_property_json 500, @property
        end
    end

    private

    def property_params
        params.require(:property).permit(:name, photos_attributes: [:id, :name, :url, _destroy])
    end

    def render_property_json status, property
        render json: {
            status: status,
            property: (status != 500 ? property.to_json : property.errors)
        }.to_json
    end
end
