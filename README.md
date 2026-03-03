# recipe-site
Software Dev HW 2: create a website to add and store recipes

## Features
- Home page w/ cooking experience/favorite food
- Recipe listing page categorized by protien type
- Individual recipe pages with ingredient info pop-ups
- Add new recipes using existing ingredients through a form
- Search/filter recipes

## Setup
1. Clone repo
git clone https://github.com/ehenness/recipe-site.git

2. Install dependencies
npm install

3. Create and populate DB
mysql -u root -p < recipe_db.sql

4. Configure DB connection
May need to edit app.js password to match your credentials

5. Start server
node app.js

6. Visit
http://localhost:3000/
