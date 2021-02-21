class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  
  def categories_attributes=(categories_attributes) #categories_attributes = {"0"=>{"name"=>"Humor"}}
    categories_attributes.values.each do |category_attribute|  #categories_attributes.values = [{"name"=>"Humor"}]
      unless category_attribute[:name].empty? #category_attribute = {"name"=>"Humor"}
        category = Category.find_or_create_by(category_attribute) 
        self.post_categories.build(category: category)
      end
    end
  end
end
