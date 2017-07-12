require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
	def setup
		@category=Category.create(nam: "books")
		@category2=Category.create(name: "programming")
	end
	
	test "should show categories listing" do
		get categories_path
		assert_template 'categories/index'
		assert_select "a[herf=?]",category_path(@category), text: @category.name
		assert_select "a[herf=?]", category_path(@category2), text: @category.name
	end
end