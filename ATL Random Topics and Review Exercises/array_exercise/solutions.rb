# 1. Create an array of the days of the week:
days_of_the_week = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']

# 2. My calendar says the first day is Sunday... Remove Sunday from the last postion moving it to the first position.  Use array methods.
sunday = days_of_the_week.pop
days_of_the_week.unshift(sunday)

# 3. Create an array of the days of the week:
days_of_the_week_02 = [
  ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'], ['Saturday', 'Sunday']
]

#4. Remove either the weekdays or the weekends.  Your choice...
days_of_the_week_02.pop

#5. Sort the remaining days
days_of_the_week_02[0].sort