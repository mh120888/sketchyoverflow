joe = User.create(name: "Joe Schmo", password: "password")

joe.questions << Question.create(title: "Good place to buy boomers?", content: "Does anyone know a good source? I'm in the East Bay.")
joe.questions << Question.create(title: "Should I be worried about this rash?", content: "I have weird rash on my butt. It appeared last week after I went hiking. I'm too embarrassed to go to a doctor...")
joe.questions << Question.create(title: "How many beers are too many?", content: "Let's just say I drink a lot, and I'm a little worried about the habit. How many beers a week would you say is 'normal?' I drink like 25.")
joe.questions << Question.create(title: "Why is Bob such a jerk?", content: "People who know Bob will understand this question. Seriously, does he ever have anything nice to say? I feel weird asking this question because he's our boss.")
joe.questions << Question.create(title: "Does Canada have an extradition treaty?", content: "Let's say that this guy I know has committed a serious crime, I mean really serious, and needs to get out of the country really fast. Is Canada a safe bet? Do they have an extradition treaty with the US?")