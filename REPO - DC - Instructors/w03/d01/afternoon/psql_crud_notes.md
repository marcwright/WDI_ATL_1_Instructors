## psql CRUD Notes

- Write the CRUD actions on the board:

__Framing:__ we've touched on creating (INSERT INTO), reading (SELECT), and destroying (DELETE FROM), but we haven't talked about updating. To illustrate the point, we return to jedi academy. Things in the galaxy are changing. There's much political discord, and rumors begin to fly that red lightsabers implicitly align you with the dark side of the force.

__STUDENT QUESTION: I need a single padawan volunteer to publicly renounce their red lightsaber and take on a color more aligned with the fight for good. What color do you want?__

```SQL
UPDATE padawans SET lightsaber='new_color' WHERE name='whoever_volunteers';
```

Okay, now let's update all the padawans who have a red lightsaber to `tempted_by_the_dark_side: true`.

```SQL
UPDATE padawans SET tempted_by_dark_side='true' WHERE lightsaber='red';
```

Yoda tossed all the bunks at Jedi Academy, and found 'Palpatine for Emperor' propaganda under the mattresses of several padawans. He noticed a pattern: all the padawans who had the propaganda had already been marked as tempted by the dark side and all of them had more than 6 years of training.

__STUDENT QUESTION: How would we set palpatine supporter to true for any Padawans who have over 6 years of training and are tempted by the dark side???__

```SQL
UPDATE padawans SET palpatine_supporter='true' WHERE tempted_by_dark_side = 'true' AND years_training > 6;
```

Oh oh. We have a lot of padawans who are tempted by the dark side. We can't have that at jedi academy. We must expel them.
```SQL
DELETE FROM padawans WHERE tempted_by_dark_side ='true';
```

## Students Do the PSQL crud exercise


