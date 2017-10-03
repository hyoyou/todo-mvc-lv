# Feature Story:

I want people to be able to create lists. Then they should be able to add items to those lists. They should be able to navigate many lists and see each lists items.

Look for the nouns in the story: lists, items

lists
  has many items

items
  belongs to a list

# Step 1: Integrate Basic Theme to Asset Pipeline

[X] / - Copy CSS from https://github.com/tastejs/todomvc/blob/gh-pages/examples/vanillajs/node_modules/todomvc-app-css/index.css
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
Q: Does it impact the DB? No.
Q: Does it impact my URLS? Yes. '/lists/1'


2 Helpers in Rails:
<%= form_tag(url) do %> / <% end %>
  - naive forms, not attached to objects in model
  - only if we need to manually build the form envelope (custom data)

<%= form_for(instance of activerecord) do |f| %> / <% end %>
  - gives form builder
  - saves us a ton of time

# Step 3: Add Items to a List

# Step Whatever: Fix Down Arrow on Make a List Form
