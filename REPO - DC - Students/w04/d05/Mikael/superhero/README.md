# Superhero Helpers

To begin, run:

```
bundle install
rake db:create
rake db:migrate
rake db:seed
rails server
```

## Missions

1. List all Superheros, with `link_to`.
2. Link back to all heros with `heros_path`.
3. Render Superhero image with `image_tag`.
4. Link to edit form using `edit_hero_path`.
5. Create edit form using `form_for`.
6. Use strong params to update the record.
7. Create delete form using `form_for`, method "delete".
8. Create "Add new hero" link using `edit_hero_path`.
9. Create new-hero form using shared partial.
10. Cleanup controller using `before_action`.
11. Spruce up the layout with a little SASS.