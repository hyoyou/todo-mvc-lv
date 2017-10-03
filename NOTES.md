# Feature Story:

I want people to be able to create lists. Then they should be able to add items to those lists. They should be able to navigate many lists and see each lists items.

Look for the nouns in the story: lists, items

  lists
    has many items

  items
    belongs to a list

# Step 1: Integrate Basic Theme to Asset Pipeline

[X] / - Copy CSS from         https://github.com/tastejs/todomvc/blob/gh-pages/examples/vanillajs/node_modules/todomvc-app-css/index.css
& drop into app/assets/stylesheets/todomvc-base.css
[X] / - Order of css matters in application.css
[X] / - And see a stubbed out, non-dynamic, page with the theme.

# Step 2: Allow people to CRUD lists

  - i need a model
  - i need a controller
  - i should generate a resource (both model and controller at once)
  -> rails generate resource list name

[X] / - ListsController
      #index
      - see all their lists
      - doubling as my #new action in that it is presenting the person with a form to create a new list
[X] / - index all the lists...
[X] / - create a list
[X] / - show a list

  Want to make each list on the index page a link.
  Q: Does it impact the DB?
  A: No.

  Q: Does it impact my URLS?
  A: Yes. '/lists/1'


2 Helpers in Rails:
  <%= form_tag(url) do %> / <% end %>
    - naive forms, not attached to objects in model
      - only if we need to manually build the form envelope (custom data)

  <%= form_for(instance of activerecord) do |f| %> / <% end %>
    - gives form builder
    - saves us a ton of time

# Step 3: Add Items to a List

[X] / - Want to make each item in our list real.
      - A list has many items, and every item belongs to a list

      lists
      id      name
      2       Shopping List

      items
      id      description     list_id
      1       Milk              2
      2       Cookies           2

      -> rails generate model item description

    Q: Does it impact the DB?
    A: Yes. I probably need an items table - associated with a list
      When setting up db, think about 2 things:
      # Wiring the schema -- The database - FK (foreign key)
      # Wiring my model with the association

    Q: Does it impact my URLS?
    A: No. Will be build directly on list show page

    CREATE ACTION for an ITEM in a LIST - What is the URL / HTTP method for that?
    - The form is already present in the list show page
    - What URL does this form imply?
      POST /items #=> Doesn't describe which list we're adding an item to.
    - An item doesn't exist in our application outside of the context of the list it belongs to => Nested Resource
      POST /lists/:id/items
      items are nested under URLS of their parent list

# Step 4: Add Validations

[X] / - Add validations to models
[X] / - Error messages
      - Rails gives us <div class="field_with_errors">
        - in console, errors.local_methods shows we have a #full_messages_for(:attribute)
      - Add some styling in /assets/stylesheets/lists.scss (also need to require in application.css)

# Step 5: Add Status (Complete/Incomplete) to Items in a List

[X] / - Add status

  Want to give checkbox for complete and incomplete items.
    Q: Does it impact the DB?
    A: Yes. The idea of an item being complete or incomplete require data.
      Add an integer column called status:
      0 = incomplete
      1 = complete

    Q: Does it impact my URLS?
    A: Yes. New forms for updating the status of an item, which means new URL
    /lists/1/items
      PUT/PATCH to /lists/1/items/1

[X] / - Add checkbox, take from TodoMVC, add to view
      <input class="toggle" type="checkbox">

[X] / - Add JS function to submit the form when you click the checkbox
      $(function(){
        $("input.toggle").on("change", function(){
          $(this).parents("form").trigger("submit")
        })
      });

# Step 6: Refactor lists/show View

[X] / - Add partials to handle the logic

# Step 7: Deleting Items for a List

# Step Whatever: Fix Down Arrow on Make a List Form
