      / f.label :categories
      / = f.select :categories, @array, :prompt => 'Select One', :multiple => true, :size => 3

/ Item.new{"title"=>"Another item", "price"=>"2323", "description"=>"23232", "quantity"=>"34", "categories"=>{name:"Deep Web"}}

/ Item.new{title: Another item", price: 2323", description: "23232", "quantity"=>"34", categories: [Category.find_or_create_by("name":"Deep Sea")]}

/ Item.new(categories: [])

      = f.fields_for :category do |ff|
        %div
          = ff.label :name
          = ff.text_field :name


    - for category in @categories
      %div


      
        = check_box_tag "item[categories][]", category.id, @item.categories.include?(category)
        = category.name

    = f.submit "Submit Your Item For Sale", class: "btn btn-primary"
