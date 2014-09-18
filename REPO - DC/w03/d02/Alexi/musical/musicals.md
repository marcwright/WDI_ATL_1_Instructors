Return all musicals
  * Musical.all
Find the first musical in the table
 * Musical.first
Find a musical by its title
  * Musical.find_by(title: "Oklahoma")
Find all musicals composed by Richard Rodgers
  * Musical.where(composer: "Richard Rodgers")
Order the musicals by year
  * Musical.order(:year)
Final all musicals more recent than 1980
  * Musical.where("year > 1980")
