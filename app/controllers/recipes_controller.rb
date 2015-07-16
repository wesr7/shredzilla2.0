class RecipesController < ApplicationController

    def index
        # @results = Yummly.search(search_params)
        uri = HTTParty.get(search)
        @response = JSON.parse(uri.body)
        @getRecipeUrl = "#{get}"
        if params[:q]
            @result = HTTParty.get(search + "&q=#{params[:q]}")
        end

    end
    private

    def search
        search = "http://api.yummly.com/v1/api/recipes?_app_id=feb369ae&_app_key=c334314ca3ca7eb5cf42f1df657c1182"
    end

    def get
        get = "http://api.yummly.com/v1/api/recipe/%?_app_id=feb369ae&_app_key=c334314ca3ca7eb5cf42f1df657c1182"
    end

end
