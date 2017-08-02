REFACTORING
1. Make controllers skinnier

NEXT TO DOS
1. Accounts
- Can get paid out  

2. New campaign page
- Add controller action and logic
- form_for @campaign POST to my database
- Make sure campaign is attached to user (pass current user into the show page)
- Check whether the current_user has a stripe account [MODEL METHOD]
   - YES: Post form information
   - NO: Redirect? to Stripe Connect sign up page and save information in the database
- Save new campaign

3. Delete campaign
- Controller destroy action (@campaign.clear)
- Flash notice that campaign has been destroyed

4. End campaign
- Add ended section to the campaign index page
- Check whether the deadline is before or after today's date
- Add a method that checks

Steven and Jeff Help
- Other ways that I can flex the API more that would be impressive (use developer tools, coupons, etc.)
- The type of feedback I could give them that would resonate
- Steven: Flow of the program and whether I am putting stuff in the right places.


NEED HELP TO DOS
Higher
3. Making the graph render
2. How to do a flash message
1. How to use modules (including use of self) and where you can access methods defined in controller actions
-- How to fix CURRENT_USER issue (not avalable with stripe_oauth)
7. How to pass ruby objects to js (particularly stuff that's in the show page)
Lower
6. How to appropriately link up charge objects (Can't remember what this is)
4. Save stripe API keys appropriately (better understand ENV, etc.)
- How to seed data after it has already been seeded once
- How to do assignment

QUESTIONS
- Better understanding of where I can access methods from (e.g., current user - defined in application helpers)
- Difference between redirect and render

LONG LIST
High
1. Give backers refunds if the campaign fails (https://stripe.com/docs/refunds)
- Need to signal when campaign fails (% complete < 100 when Today = deadline)
- Issue refunds through Stripe

2. Stripe Connect: Give payouts to creators
- On appropriate timeline
- Ideally happens automatically when the $ is raised
a. Register as a platform

3. Integrate some sort of other developer tools (https://stripe.com/works-with)

Medium
1. You can't contribute to your own project.
2. Authentication and access to only your own profile

Low
1. Check if campaign has ended and figure out what to show then
- Show status (ended versus active in your account page)
2. refunds
3. Coupons (rewards area)
4. CSS on contributions page

LESS IMPT QUESTIONS
3. How to do different foreign_keys (e.g., backers vs. users)
SMALLER TO DOS


COMPLETED
A. Update campaign funding information based on charges
- Attribute: Raised, (backers)
B. Contribute to a campaign
1. Click the help launch Button
2. Redirect to charges show page (with params for the user and the campaign)
-- route: /campaigns/1/charges/new
-- create view:
3. Click make payment
-- Popup with Stripe payments option
4. Input payment information
5. Post request with user card information
-- Either: Lookup customer object using customer ID (indication that they're in Stripe's database)
-- OR: Create a new customer object with stripeEmail and stripeToken
-- POST /campaigns/1/charges
5a. Success
-- Redirect to campaign show page
-- Flash "Thank you" notification
-- Update campaign show page to reflect the funding (should happen automatically)
5b. Error
-- Render campaigns/1/charges/new
-- Flash notice with error message
1. Make components of campaign show page dynamic (basic) [DONE]
-- Fix the graphic with the funded amount
-- Update show page for backer versus creator views

2. Make $ update based on whether someone has contributed fundings [DONE]

3. Charges routes and controller actions [DONE]

4. My profile page with info about campaigns I have created and backed

5. Add error to charge create controller action

6. Require login / signup before you can make contribution (or simultaneously)



ROUTES
/
- index
list recently created campaigns
-- Top 10 campaigns

/campaigns/new
- Create a new campaign

/campaigns/1 (show page)
  - show campaign,
    as owner I can see info about this campaign
  - as non owner I can donate to campaign

GET /campaigns/1/charges/new
  - contribution form - payment integration

POST /campaigns/1/charges
  - POSTBACK from stripe to actually create the funding for campaign 1
  - Update the information on the campaign show page to reflect new funding

/login
sign into the site and create a session

/my_account
list my campaigns and campaigns I’ve donated to, aggregate funding data (some sort of cool graph)

Models
- User: Email, token
-- Has many campaigns
- Campaign: Name, description, $ required, $ raised, days left, # backers, user_id
-- Belongs to user
-- has many fundings (campaign + user_id)
-- has many backers, through fundings
- Account

Controllers
- Charges Controller
- Campaigns controller
- Account
