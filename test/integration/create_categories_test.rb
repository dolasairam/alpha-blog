require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
	
	test "get new category fom and create category" do
		get new_category_path
		assert_template 'categories/new'
		assert_difference 'Category.count', 1 do
			post_via_redirect categories_path, category: {name: "sports"}
			
		end
		
		assert_template 'categories/index'
		assert_match "sports", response.body
	
	end
	
	test 'invalid category submission results in failure' do
		get new_category_path
		assert_template 'categories/new'
		assert_difference 'Category.count' do
		post categories_path, category: {name: " "}
			end
		
		assert_template 'categories/index'
		assert_select 'h2.panel-title'
		assert_select 'div.panel-body'	
	end
	
	test "should redirect create when admin not logged in" do
	
		assert_no_difference 'Category.count' do
			post :create, category: {name: "sports")
			end
			assert_redirected_to categories_path
	end
end