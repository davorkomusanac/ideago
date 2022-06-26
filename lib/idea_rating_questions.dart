import 'data/models/idea_rating_question/idea_rating_question.dart';

List<IdeaRatingQuestion> initialIdeaRatingQuestions = [
  const IdeaRatingQuestion(
    rating: 5,
    title: 'Urgency',
    description:
        'How badly do people want or need this right now? (Renting an old movie is typically low urgency; seeing a new movie on opening night is high urgency, since it only happens once.)',
  ),
  const IdeaRatingQuestion(
    rating: 5,
    title: 'Market Size',
    description:
        'How many people are actively purchasing things like this? (The market for scuba diving equipment is very small; the market for cancer cures is massive.)',
  ),
  const IdeaRatingQuestion(
    rating: 5,
    title: 'Pricing Potential',
    description:
        'What is the highest average price a purchaser would be willing to spend for a solution? (Lollipops sell for \$0.05; cruiser ships sell for billions.)',
  ),
  const IdeaRatingQuestion(
    rating: 5,
    title: 'Customer Acquisition Cost',
    description:
        'How easy is it to acquire a new customer? On average, how much will it cost to generate a sale, both in money and effort? (Restaurants located next to stadiums spend little to bring in new customers. Biotech companies can spend billions in research before getting a product.)',
  ),
  const IdeaRatingQuestion(
    rating: 5,
    title: 'Distribution Cost',
    description:
        'How much would it cost to create and deliver the value offered, both in money and effort? (Delivering files via the Internet is almost free; inventing a product and building a factory costs millions.)',
  ),
  const IdeaRatingQuestion(
    rating: 5,
    title: 'Uniqueness of Offer',
    description:
        'How unique is your offer versus competing offerings in the market, and how easy is it for potential competitors to copy you? (There are many hair salons, but very few companies that offer private space travel.)',
  ),
  const IdeaRatingQuestion(
    rating: 5,
    title: 'Speed to Market',
    description:
        'How quickly can you create something to sell? (You can offer to mow a neighbor’s lawn in minutes; opening a bank can take years.)',
  ),
  const IdeaRatingQuestion(
    rating: 5,
    title: 'Up-Front Investment',
    description:
        'How much will you have to invest before you’re ready to sell? (To be a housekeeper, all you need is a set of inexpensive cleaning products. To mine for gold, you need millions to purchase land and excavating equipment.)',
  ),
  const IdeaRatingQuestion(
    rating: 5,
    title: 'Up-Sell Potential',
    description:
        'Are there related secondary offers that you could also present to purchasing customers? (Customers who purchase razors need shaving cream and extra blades as well; buy a Frisbee, and you won’t need another unless you lose it.)',
  ),
  const IdeaRatingQuestion(
    rating: 5,
    title: 'Evergreen Potential',
    description:
        'Once the initial offer has been created, how much additional work will you have to put into it in order to continue selling? (Business consulting requires ongoing work to get paid; a book can be produced once, then sold over and over as-is.',
  ),
];
