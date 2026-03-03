const express = require('express');
const path = require('path');
const mysql = require('mysql2/promise');
const app = express();

app.use(express.urlencoded({ extended: true}));
app.use(express.json());

/*
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Emma2005',
    database: 'recipe_db'
});*/
const db = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'Emma2005',
    database: 'recipe_db',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});
/*
db.connect((err) => {
    if (err) {
        console.error('Database connection failed:', err);
        return;
    }
    console.log('Connected to MySQL database');
});*/

app.set('view engine', 'ejs');

app.use(express.static(path.join(__dirname, 'public')));

//////////////////// HOME ///////////////////////////
app.get('/', (req, res) => {
    res.render('home');
});

////////////////// RECIPE LISTINGS /////////////////
app.get('/recipes', async (req, res) => {
    try {
        const sql = 'SELECT * FROM recipes ORDER BY protein_type';
        const [recipes] = await db.query(sql);

        res.render('recipes', { recipes, currentPage: 'recipes' });
    } catch (err) {
        console.error(err);
        res.send("Database error");
    }
});

////////////// INDIVIDUAL RECIPES ///////////////////
app.get('/recipes/:id', async (req, res) => {
    try {
        const recipeId = req.params.id;

        const [recipeResults] = await db.query(
            'SELECT * FROM recipes WHERE id = ?',
            [recipeId]
        );

        const [ingredientResults] = await db.query(`
            SELECT ingredients.name, 
                   ingredients.info AS description,
                   recipe_ingredients.quantity
            FROM recipe_ingredients
            JOIN ingredients ON recipe_ingredients.ingredient_id = ingredients.id
            WHERE recipe_ingredients.recipe_id = ?
        `, [recipeId]);

        res.render('recipe-detail', {
            recipe: recipeResults[0],
            ingredients: ingredientResults
        });

    } catch (err) {
        console.error(err);
        res.send("Database error");
    }
});

////////////////////// RECIPE ADD ////////////////////
app.get('/add-recipe', async (req, res) => {
    try {
        const [ingredients] = await db.query('SELECT * FROM ingredients ORDER BY name');
        res.render('add-recipe', { ingredients });
    } catch (err) {
        console.error(err);
        res.send('Error loading add recipe page');
    }
});

app.post('/add-recipe', async (req, res) => {
    try {
        const { name, protein_type, instructions, ingredient_ids, quantities } = req.body;

        const [result] = await db.query(
            'INSERT INTO recipes (name, protein_type, instructions) VALUES (?, ?, ?)',
            [name, protein_type, instructions]
        );

        const recipeId = result.insertId;

        if (ingredient_ids && quantities) {
            for (let i = 0; i < ingredient_ids.length; i++) {
                if (ingredient_ids[i] && quantities[i]) {
                    await db.query(
                        'INSERT INTO recipe_ingredients (recipe_id, ingredient_id, quantity) VALUES (?, ?, ?)',
                        [recipeId, ingredient_ids[i], quantities[i]]
                    );
                }
            }
        }

        res.redirect('/recipes');

    } catch (err) {
        console.error(err);
        res.send("Error saving recipe");
    }
});

app.listen(3000, () => {
    console.log('Server running on http://localhost:3000');
});