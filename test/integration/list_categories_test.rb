require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

    def setup
        @category = Category.create(name: "sports")
        @category2 = Category.create(name: "programming")
    end

    test "should show categories listing" do
        get categories_path
        assert_template 'categories/index'
        #selecting a link and esuring that it redirects to the given path
        assert_select "a[href=?]", category_path(@category), text: @category.name
        assert_select "a[href=?]", category_path(@category2), text: @category2.name
    end

end