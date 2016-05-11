module ApplicationHelper

def link_to_add_fields(name, f, association, cssClass, title)  
  new_object = f.object.class.reflect_on_association(association).klass.new  
  fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|  
    render(association.to_s.singularize + "_fields", :f => builder)  
  end  
  link_to name, "#", :onclick => h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"), :class => cssClass, :title => title 
end  

  #削除ボタン
  def link_to_remove_fields(name, f, options={})
    # _destroy の hiddenフィールドと削除ボタンを設置
    f.hidden_field(:_destroy) + link_to(name, '#', class: "remove_field")
  end
end
