# Even though methods here are under ItemsHelper, it is merely a namespace and is accessible anywhere in the app

module ItemsHelper
  def li_class_for_item(item)
    "completed" if item.complete?
  end

  def li_for_item(item)
    content_tag_for :li, item, :class => li_class_for_item(item) do
      yield # can only refactor like this if the first level accepts a block
    end
  end

  def form_for_item_status(item)
    form_for([@list, item]) do |f|
      f.check_box :status, :class => "toggle", :checked => item.complete?
    end
  end
end
