NEXT TO DOS
1. Make graph

LONG LIST
High
1. Give backers refunds if the campaign fails
- Need to signal when campaign fails (% complete < 100 when Today = deadline)
- Issue refunds through Stripe

Medium
1. You can't contribute to your own project.

Low
1. Check if campaign has ended and figure out what to show then
- Show status (ended versus active in your account page)

NEED HELP TO DOS
1. Make the correct dates for the campaigns (how to convert date time to MJD)
      - Date.today.mjd - Campaign.all.find(1).date_goal.mjd

2. CSS: Image adjust along with the main campaign information

3. How to do different foreign_keys (e.g., backers vs. users)
4. Save stripe API keys appropriately (better understand ENV, etc.)
5. How to use modules (including use of self) and where you can access methods defined in controller actions
6. How to appropriately link up charge objects.

SMALLER TO DOS
1. Make components of campaign show page dynamic (basic)
-- Fix the graphic with the funded amount
-- Update show page for backer versus creator views

2. Make $ update based on whether someone has contributed fundings

3. Charges routes and controller actions

4. My profile page with info about campaigns I have created and backed

5. Add error to charge create controller action

6. Require login / signup before you can make contribution (or simultaneously)



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
