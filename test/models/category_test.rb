require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

    # runs before all of your tests
    # everything remains only in your test database
    def setup
        @category = Category.new(name: "sports")
    end

    test "category should be valid" do
        assert @category.valid?
    end

    test "name should be present" do
        @category.name = " "
        assert_not @category.valid?
    end

    test "name should be unique" do
        #hitting the test database to save the value which was set using 'setup' method
        @category.save
        category2 = Category.new(name: "sports")
        assert_not category2.valid?
    end

    test "name should not be too long do" do
        # maximum of 25 characters
        @category.name = "a" * 26
        assert_not @category.valid?
    end

    test "name should not be too short" do
        # minimum of 3 characters
        @category.name = "aa"
        assert_not @category.valid?
    end
    
end