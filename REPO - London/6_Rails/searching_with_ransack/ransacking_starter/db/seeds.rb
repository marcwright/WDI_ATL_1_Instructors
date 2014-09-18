p1 = Person.create name: "michael", title: 'mr', dob: '1972-11-24', account_number: '42412614'
p2 = Person.create name: "jarkyn", title: 'mr', dob: '1988-07-13', account_number: '65482733'
p3 = Person.create name: "geraud", title: 'mr', dob: '1987-01-09', account_number: '89361234'
p4 = Person.create name: "mathilda", title: 'ms', dob: '1992-10-13', account_number: '22193129'

Article.create title: "how the west was won", author_id: p1.id, moderator_id: p2.id, published_at: Time.now.ago(24.days).ago((rand*1000).minutes)
Article.create title: "what's in a name", author_id: p3.id, moderator_id: p2.id, published_at: Time.now.ago(15.days).ago((rand*1000).minutes)
Article.create title: "in the name of the flag", author_id: p1.id, moderator_id: p2.id, published_at: Time.now.ago(12.days).ago((rand*1000).minutes)
Article.create title: "who's afraid of the big, bad Ruby", author_id: p1.id, moderator_id: p4.id, published_at: Time.now.ago(8.days).ago((rand*1000).minutes)
Article.create title: "CSS is The Bomb", author_id: p4.id, moderator_id: p1.id, published_at: Time.now.ago(2.days).ago((rand*1000).minutes)
Article.create title: "CSS sucks The Bowl", author_id: p4.id, moderator_id: p3.id, published_at: Time.now.ago(1.day).ago((rand*1000).minutes)
Article.create title: "Oki ga ii (bigger is better)", author_id: p1.id, moderator_id: p4.id, published_at: Time.now.ago(1.day).ago((rand*10).minutes)
Article.create title: "Love and the single squirrel", author_id: p1.id
Article.create title: "Ashes to Embers", author_id: p4.id
Article.create title: "Ember can kiss my class", author_id: p4.id



