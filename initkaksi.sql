DROP TABLE IF EXISTS drinks CASCADE;
DROP TABLE IF EXISTS drinks_recipes;
DROP TABLE IF EXISTS drinks_ingredients CASCADE;
DROP TABLE IF EXISTS cabinet CASCADE;
DROP TABLE IF EXISTS users;


-- drinkin nimi ja reseptikuvaus.
CREATE TABLE drinks (
                        id SERIAL PRIMARY KEY,
                        drink_name VARCHAR(255) NOT NULL,
                        drink_instructions VARCHAR(255) NOT NULL
);

-- raaka-aineet, jossa aine ja id. Eli vodka id 1, gin id 2, rommi id 3 jne...
CREATE TABLE drinks_ingredients (id SERIAL PRIMARY KEY, ingredient_name VARCHAR(255) NOT NULL);

-- reseptin ainekset, cocktailin nimi on drinks-taulun ID:n lapsi.
-- ainesosan nimi on drinks_ingredients-taulun ID:n lapsi.
CREATE TABLE drinks_recipes (
                                id SERIAL PRIMARY KEY,
                                drinks_id INTEGER NOT NULL,
                                ingredients_id INTEGER NOT NULL,
                                ingredients_amount int,
                                ingredients_unit VARCHAR(255),
                                FOREIGN KEY (drinks_id) REFERENCES drinks(id) ON DELETE CASCADE,
                                FOREIGN KEY (ingredients_id) REFERENCES drinks_ingredients(id) ON DELETE CASCADE
);

CREATE TABLE users (
                       uid SERIAL PRIMARY KEY,
                       user_email VARCHAR(255) NOT NULL
);
CREATE TABLE cabinet (
                        users_id INTEGER NOT NULL,
                        ingredients_id INTEGER NOT NULL,
                        FOREIGN KEY (users_id) REFERENCES users(uid) ON DELETE CASCADE,
                        FOREIGN KEY (ingredients_id) REFERENCES drinks_ingredients(id) ON DELETE CASCADE
);

CREATE TABLE users (
                       uid SERIAL PRIMARY KEY,
                       user_name VARCHAR(255) NOT NULL
);
CREATE TABLE cabinet (
                        cid SERIAL PRIMARY KEY,
                        users_id INTEGER NOT NULL,
                        ingredients_id INTEGER NOT NULL,
                        FOREIGN KEY (users_id) REFERENCES users(uid) ON DELETE CASCADE,
                        FOREIGN KEY (ingredients_id) REFERENCES drinks_ingredients(id) ON DELETE CASCADE
);

-- Tallenna alkoholit yms raaka-aineet.
INSERT INTO drinks_ingredients (ingredient_name) VALUES
('Apricot Brandy'),
('Absinthe'),
('Amaretto liqueur'),
('Anise-flavored liqueur'),
('Anisette'),
('Apple-flavored liqueur'),
('Bacardi'),
('Baileys Irish Cream'),
('Beer'),
('Benedictine D.O.M '),
('Benedictine'),
('Berry liqueur'),
('Bitter'),
('Blue Curacao'),
('Bols Vanilla'),
('Bourbon'),
('Brandy'),
('Buttershots'),
('Cachaca'),
('Calvados'),
('Campari'),
('Cassis De Dijon'),
('Cava'),
('Chambord Royal De France'),
('Champagne'),
('Chartreuse'),
('Chambord liqueur'),
('Cherry Brandy'),
('Chocolate liqueur'),
('Coconut liqueur'),
('Coconut cream'),
('Coffee liqueur'),
('Cognac'),
('Cointreau'),
('Cream liqueur'),
('Creme de banane'),
('Creme de Cassis'),
('Crème de menthe'),
('Creme de Menthe'),
('Creme de Cacao'),
('Crème de Menthe'),
('Crème de Mure'),
('Crème de Violette'),
('Creme liqueur'),
('Dessert wine'),
('Drambuie'),
('Elderflower liqueur'),
('Fernet Branca'),
('Flower liqueur'),
('Fortified wine'),
('Fruit liqueur'),
('Galliano liqueur'),
('Gin'),
('Glogg'),
('Gomme'),
('Grand Marnier'),
('Guiness'),
('Herbal liqueur'),
('Herbsaint'),
('Herbsaint Frappé'),
('Honey liqueur'),
('Jagermaister'),
('Koskenkorva'),
('Lillet'),
('Lillet Blanc'),
('Limoncello'),
('Madeira'),
('Martini'),
('Martini Rosso'),
('Mauresque'),
('Maraschino'),
('Maraschino liqueur'),
('Midori Melon liqueur'),
('Mozart White Chocolate Liqueur'),
('Nut-flavored liqueur'),
('Orange-flavored liqueur'),
('Orange Bitters'),
('Ouzo'),
('Paychards Bitters'),
('Parfait Amour'),
('Pastis'),
('Peach liqueur'),
('Perroquet'),
('Pisco'),
('Port wine'),
('Porto'),
('Prosecco'),
('Red wine'),
('Rhum'),
('Rose wine'),
('Roses Lime cordial'),
('Rourou'),
('Rum'),
('Sake'),
('Schnapps'),
('Sherry'),
('Soju'),
('Sparkling wine'),
('Tequila'),
('Triple Sec'),
('Underberg'),
('Velvet Falernum'),
('Vermouth'),
('Vodka'),
('Whiskey liqueur'),
('Whiskey'),
('Whisky'),
('White wine'),
('Wine');

INSERT INTO drinks_ingredients (ingredient_name) VALUES
('Angostura Bitters'),
('Angostura'),
('Apple fan'),
('Apple juice'),
('Black pepper'),
('Celery stick'),
('Celery'),
('Cherry'),
('Chocolate'),
('club soda'),
('Coffee beans'),
('Coke'),
('Cranberry juice'),
('Cream'),
('Cucumber'),
('Egg white'),
('Egg'),
('Espresso'),
('Fresh mint'),
('Ginger Ale'),
('Grapefruit juice'),
('Grated nutmeg'),
('Grenadine syrup'),
('Grenadine'),
('Lemon juice'),
('Lemon soda'),
('Lemon slice'),
('Lemon twist'),
('Lemon twists'),
('Lemon wedge'),
('Lemon zest'),
('Lemon'),
('Lime juice'),
('Lime slice'),
('Lime wedge'),
('Lime'),
('Maraschino cherry'),
('Melon slice'),
('Milk'),
('Olive'),
('Orange juice'),
('Orange slice'),
('Orange twist'),
('Orange wedge'),
('Orange zest'),
('Passion fruit syrup'),
('Peach pure'),
('Pickled onion'),
('Pineapple juice'),
('Raspberry'),
('Salt'),
('Soda'),
('Strawberry pure'),
('Sugar syrup'),
('Sugar'),
('Tabasco'),
('Tomato juice'),
('Tonic water'),
('Tonic'),
('Worcestershire sauce');

-- Tallenna cocktailien nimi ja ohje.
INSERT INTO drinks (drink_name, drink_instructions)
VALUES
('Vodka Martini', 'Shaken, not stirred. Find your inner Daniel Craig.'),
('Gin Tonic', 'Mix n Match! Hipster points for the innovative use of cucumber, cranberries and other garnish.'),
('Tom Collins', 'Build in glass.Serve chilled! What could go wrong?'),
('Bellini', 'Ruin your champagne or prosecco with a splash of peach pure. Use white ones when available, preferably from Italy.'),
('Screwdriver', 'Take some vodka, mix with orange juice, add some ice, enjoy and think of the 1990s.'),
('Kossu-Kola', 'Mikä voisi mennä pieleen? Nyt erikoismerkkien kanssa!'),
('Vodka-vissy', 'Sekoita ja nauti!'),
('Long Island Iced Tea, so much fun, ka-boom!!!', 'Mix everything. Make a pitcher, once youre at it. Look at the catastrophy unravel before you, with you, by you. Cry cry cry.'),
('Americano', 'Pour over glass into ice.'),
('Apple Blossom', 'Shake hard and fine strain.'),
('Aviation', 'Shake hard, fine strain.'),
('Bacardi Cocktail', 'Shake hard and fine strain.'),
('Between the sheets', 'Shake hard and fine strain.'),
('Black Russian', 'Pour slowly and stir.'),
('Black Velvet', 'Pour slowly and stir.'),
('Blood and Sand', 'Shake and fine strain.'),
('Bloody Mary', 'Roll ingredients, strain into glass'),
('Blue Moon', 'Shake hard, fine strain.'),
('Raspberry Boulevard', 'Stir in mixing glass.'),
('Bobby Burns', 'Shake hard and fine strain.'),
('Bramble', 'Build in glass, drizzle.'),
('Brandy Alexander', 'Shake hard and fine strain.'),
('Brandy Flip', 'Shake hard and fine strain.'),
('Breakfast Martini', 'Stir in mixing glass.'),
('Bronx', 'Shake hard and fine strain.'),
('Brooklyn', 'Stir in mixing glass.'),
('Caipirinha', 'Muddle in glass. Fill with crushed ice.'),
('Cape Codder', 'Build in glass.'),
('Champagne Cocktail', 'Build in glass. Add a sugar cube soaked with Angostura bitters.'),
('Clover Club', 'Dry shake, wet shake, fine strain.'),
('Cobbler', 'Shake hard and strain over crushed ice.'),
('Corpse Reviver', 'Shake hard and fine strain.'),
('Cosmopolitan', 'Shake hard and fine strain.'),
('Crusta', 'Shake hard and strain. Add a crusted caster sugar rim and fruit band in top of glass for decorative purposes.'),
('Cuba Libre', 'Build in a glass.'),
('Daiquiri', 'Shake hard and fine strain.'),
('Dark n Stormy', 'Build in glass.'),
('Diplomat', 'Stir in mixing glass.'),
('East India', 'Shake hard and fine strain.'),
('El Diablo', 'Shake first ingredients then top with ginger beer.'),
('El Floridita', 'Shake hard and fine strain.'),
('El Presidente', 'Shake hard and fine strain.'),
('Espresso Martini', 'Shake hard and fine strain.'),
('Fish House Punch', 'Shake hard and fine strain.'),
('French 75', 'Shake first ingredients, then top with sparkling wine.'),
('Death in the Afternoon', 'Shake first ingredients, top with sparkling wine.'),
('French Connection', 'Build in glass.'),
('French Martini', 'Shake hard and fine strain.'),
('Gimlet', 'Stir in mixing glass.'),
('Gin Cockail', 'Stir in mixing glass.'),
('Gin Rickey', 'Build in glass.'),
('Godfather', 'Build in glass.'),
('Grasshopper', 'Shake hard and fine strain. Garnish with chocolate shavings.'),
('Hanky-Panky Martini', 'Stir in mixing glass.'),
('Harvard', 'Stir in mixing glass.'),
('Harvey Wallbanger', 'Build in glass.'),
('Hurricane', 'Shake hard and strain.'),
('Japanese Slipper', 'Shake hard and fine strain.'),
('June Bug', 'Shake hard and strain.'),
('Kamikaze', 'Shake hard and fine strain.'),
('Kir Royale', 'Build in glass.'),
('The Last Word', 'Shake hard and fine strain.'),
('Lemon Drop', 'Shake hard and fine strain.'),
('Lynchburg Lemonade', 'Build in glass.'),
('Mai Tai', 'Shake hard and strain over crushed ice.'),
('Manhattan', 'Stir in mixing glass and strain. Sweet: use sweet Vermouth. Dry: use Dry Vermouth. Perfect: use half and half Dry/Sweet Vermouth. As for garnish, Sweet: Maraschino cherry Dry: Lemon twist Perfect: Orange twist.'),
('Margarita', 'Shake hard and fine strain.'),
('Martini', 'Dry=Less vermouth, Wet= More vermouth. Stir in mixing glass and strain.'),
('Gibson', 'Stir in mixing glass and strain. Pickled onion as garnish.'),
('Mary Pickford', 'Shake hard and fine strain.'),
('Mint Julep', 'Lightly muddle ingredients except Bourbon in mixing glass. Strain into glass half filled with crushed ice, add Bourbon, churn and refill with ice until full.'),
('Mojito', 'Slap mint, add other ingredients, churn with crushed ice. Many bars use two bar spoons of white or brown sugar rather than sugar syrup.'),
('Moscow Mule', 'Build in glass.'),
('Negroni', 'Stir in mixing glass, strain.'),
('New Yorker', 'Shake hard and fine strain.'),
('Nuclear Daiquiri', 'Shake hard and strain.'),
('Old Fashioned', 'Add ingredients slowly, stiring until ice melts and then adding more ice. Call me old fashioned – sub Bourbon with Cognac. Stir in glass.'),
('Painkiller', 'Shake hard and strain.'),
('Paloma', 'Shake first ingredients.'),
('Paradise', 'Shake and fine strain.'),
('Pegu Club', 'Shake hard and fine strain.'),
('Pina Colada', 'Shake and strain.'),
('Rum Swizzle', 'Fill glass with crushed ice, add ingredients, stir hard with swizzle stick.'),
('Russian Spring Punch', 'Build in glass.'),
('Rusty Nail', 'Stir in glass.'),
('Sazerac', 'Stir in mixing glass, strain into Absinthe rinsed glass (no ice).'),
('Screaming Orgasm', 'Shake and strain.'),
('Sex on the beach', 'Shake and strain.'),
('Sidecar', 'Shake hard and strain.'),
('Tequila Sunrise', 'Build in glass.'),
('Tommys Margarita', 'Shake and fine strain.'),
('Treacle', 'Stir in glass, float apple juice.'),
('Twinkle', 'Build in glass.'),
('Vesper Martini', 'Shake hard and fine strain.'),
('Whisky sour', 'Shake hard and fine strain.'),
('White Lady', 'Shake hard and fine strain.'),
('White Martini', 'Shake hard and fine strain.'),
('White Russian', 'Build in glass.'),
('Zombie', 'Shake hard and strain. Some recipes add Overproof rum and Absinthe – try if you dare!');

-- Tallenna reseptit.
INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Vodka Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Vodka Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 4, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Gin Tonic'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Gin Tonic'), (SELECT id from drinks_ingredients WHERE ingredient_name='Tonic'), 12, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Tom Collins'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Tom Collins'), (SELECT id from drinks_ingredients WHERE ingredient_name='Sugar'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Tom Collins'), (SELECT id from drinks_ingredients WHERE ingredient_name='Tonic'), 12, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Bellini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Champagne'), 12, 'cl'),
((SELECT id from drinks WHERE drink_name='Bellini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Peach pure'), 4, 'spoonfuls');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Screwdriver'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Screwdriver'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange juice'), 10, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Kossu-Kola'), (SELECT id from drinks_ingredients WHERE ingredient_name='Koskenkorva'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Kossu-Kola'), (SELECT id from drinks_ingredients WHERE ingredient_name='Soda'), 20, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Vodka-vissy'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Vodka-vissy'), (SELECT id from drinks_ingredients WHERE ingredient_name='Soda'), 10, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Long Island Iced Tea, so much fun, ka-boom!!!'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Long Island Iced Tea, so much fun, ka-boom!!!'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Long Island Iced Tea, so much fun, ka-boom!!!'), (SELECT id from drinks_ingredients WHERE ingredient_name='Tequila'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Long Island Iced Tea, so much fun, ka-boom!!!'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Long Island Iced Tea, so much fun, ka-boom!!!'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon'), 2, 'pieces'),
((SELECT id from drinks WHERE drink_name='Long Island Iced Tea, so much fun, ka-boom!!!'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime'), 3, 'pieces, cut to pretty shapes.'),
((SELECT id from drinks WHERE drink_name='Long Island Iced Tea, so much fun, ka-boom!!!'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coke'), 2, 'dl, or according to taste.');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Americano'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Americano'), (SELECT id from drinks_ingredients WHERE ingredient_name='Campari'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Americano'), (SELECT id from drinks_ingredients WHERE ingredient_name='Soda'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Americano'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon zest'), 1, 'piece'),
((SELECT id from drinks WHERE drink_name='Americano'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange slice'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Apple Blossom'), (SELECT id from drinks_ingredients WHERE ingredient_name='Calvados'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Apple Blossom'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Apple Blossom'), (SELECT id from drinks_ingredients WHERE ingredient_name='Apple fan'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Aviation'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Aviation'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Aviation'), (SELECT id from drinks_ingredients WHERE ingredient_name='Maraschino'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Aviation'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon zest'), 1, 'serving'),
((SELECT id from drinks WHERE drink_name='Aviation'), (SELECT id from drinks_ingredients WHERE ingredient_name='Crème de Violette'), 2, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Bacardi Cocktail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Bacardi'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Bacardi Cocktail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Bacardi Cocktail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grenadine'), 1, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Bellini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Peach pure'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Bellini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Prosecco'), 1, 'top with');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Between the sheets'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Between the sheets'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cointreau'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Between the sheets'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cognac'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Between the sheets'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 0.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Between the sheets'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Black Russian'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Black Russian'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coffee liqueur'), 2.5, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Black Velvet'), (SELECT id from drinks_ingredients WHERE ingredient_name='Guiness'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Black Velvet'), (SELECT id from drinks_ingredients WHERE ingredient_name='Champagne'), 1, 'top with');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Blood and Sand'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whisky'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Blood and Sand'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cherry Brandy'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Blood and Sand'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Blood and Sand'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange juice'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Blood and Sand'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange zest'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Bloody Mary'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Bloody Mary'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Bloody Mary'), (SELECT id from drinks_ingredients WHERE ingredient_name='Black pepper'), 1, 'pinch'),
((SELECT id from drinks WHERE drink_name='Bloody Mary'), (SELECT id from drinks_ingredients WHERE ingredient_name='Celery'), 1, 'stick'),
((SELECT id from drinks WHERE drink_name='Bloody Mary'), (SELECT id from drinks_ingredients WHERE ingredient_name='Salt'), 1, 'pinch'),
((SELECT id from drinks WHERE drink_name='Bloody Mary'), (SELECT id from drinks_ingredients WHERE ingredient_name='Tabasco'), 1, 'splash'),
((SELECT id from drinks WHERE drink_name='Bloody Mary'), (SELECT id from drinks_ingredients WHERE ingredient_name='Worcestershire sauce'), 1, 'splash'),
((SELECT id from drinks WHERE drink_name='Bloody Mary'), (SELECT id from drinks_ingredients WHERE ingredient_name='Tomato juice'), 1, 'serving, according to your taste');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Blue Moon'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Blue Moon'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Blue Moon'), (SELECT id from drinks_ingredients WHERE ingredient_name='Egg white'), 1, 'splash');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Raspberry Boulevard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whisky'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Raspberry Boulevard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Raspberry Boulevard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grand Marnier'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Raspberry Boulevard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange Bitters'), 2, 'dashes'),
((SELECT id from drinks WHERE drink_name='Raspberry Boulevard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist'), 1, 'piece'),
((SELECT id from drinks WHERE drink_name='Raspberry Boulevard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cherry'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Bobby Burns'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whisky'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Bobby Burns'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Bobby Burns'), (SELECT id from drinks_ingredients WHERE ingredient_name='Benedictine D.O.M '), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Bobby Burns'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Bramble'), (SELECT id from drinks_ingredients WHERE ingredient_name='Crème de Mure'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Bramble'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Bramble'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Bramble'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Bramble'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon wedge'), 1, 'piece'),
((SELECT id from drinks WHERE drink_name='Bramble'), (SELECT id from drinks_ingredients WHERE ingredient_name='Raspberry'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Brandy Alexander'), (SELECT id from drinks_ingredients WHERE ingredient_name='Brandy'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Brandy Alexander'), (SELECT id from drinks_ingredients WHERE ingredient_name='Creme de Cacao'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Brandy Alexander'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cream'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Brandy Alexander'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grated nutmeg'), 5, 'shavings');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Brandy Flip'), (SELECT id from drinks_ingredients WHERE ingredient_name='Brandy'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Brandy Flip'), (SELECT id from drinks_ingredients WHERE ingredient_name='Sugar syrup'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Brandy Flip'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cream'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Brandy Flip'), (SELECT id from drinks_ingredients WHERE ingredient_name='Egg'), 1, 'according to taste'),
((SELECT id from drinks WHERE drink_name='Brandy Flip'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grated nutmeg'), 5, 'shavings');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Breakfast Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Breakfast Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Breakfast Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Breakfast Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Bronx'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Bronx'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Bronx'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange juice'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Bronx'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Brooklyn'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whisky'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Brooklyn'), (SELECT id from drinks_ingredients WHERE ingredient_name='Maraschino'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Brooklyn'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Brooklyn'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist'), 1, 'piece'),
((SELECT id from drinks WHERE drink_name='Brooklyn'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura'), 1, 'dash'),
((SELECT id from drinks WHERE drink_name='Brooklyn'), (SELECT id from drinks_ingredients WHERE ingredient_name='Maraschino cherry'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Caipirinha'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cachaca'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Caipirinha'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 4, 'pieces'),
((SELECT id from drinks WHERE drink_name='Caipirinha'), (SELECT id from drinks_ingredients WHERE ingredient_name='Sugar syrup'), 1.5, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Cape Codder'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Cape Codder'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Cape Codder'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cranberry juice'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Cape Codder'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Champagne Cocktail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cognac'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Champagne Cocktail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Champagne'), 1, 'top with'),
((SELECT id from drinks WHERE drink_name='Champagne Cocktail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange zest'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Clover Club'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Clover Club'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Clover Club'), (SELECT id from drinks_ingredients WHERE ingredient_name='Egg white'), 1, 'according to taste');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Cobbler'), (SELECT id from drinks_ingredients WHERE ingredient_name='Brandy'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Cobbler'), (SELECT id from drinks_ingredients WHERE ingredient_name='Sugar syrup'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Cobbler'), (SELECT id from drinks_ingredients WHERE ingredient_name='Red wine'), 7, 'cl'),
((SELECT id from drinks WHERE drink_name='Cobbler'), (SELECT id from drinks_ingredients WHERE ingredient_name='Fresh mint'), 1, 'according to taste');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Corpse Reviver'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Corpse Reviver'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Corpse Reviver'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Corpse Reviver'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Corpse Reviver'), (SELECT id from drinks_ingredients WHERE ingredient_name='Absinthe'), 0.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Corpse Reviver'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon zest'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Cosmopolitan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Cosmopolitan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Cosmopolitan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Cosmopolitan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cranberry juice'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Cosmopolitan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange Bitters'), 1, 'dash'),
((SELECT id from drinks WHERE drink_name='Cosmopolitan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange zest'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Crusta'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Crusta'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Crusta'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 12.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Crusta'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 0.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Crusta'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura Bitters'), 1, 'dash'),
((SELECT id from drinks WHERE drink_name='Crusta'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange zest'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Cuba Libre'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Cuba Libre'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Cuba Libre'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coke'), 1, 'top with'),
((SELECT id from drinks WHERE drink_name='Cuba Libre'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Daiquiri'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Daiquiri'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Daiquiri'), (SELECT id from drinks_ingredients WHERE ingredient_name='Sugar syrup'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Daiquiri'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2.5, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Dark n Stormy'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Dark n Stormy'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Dark n Stormy'), (SELECT id from drinks_ingredients WHERE ingredient_name='Ginger Ale'), 1, 'top with'),
((SELECT id from drinks WHERE drink_name='Dark n Stormy'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Diplomat'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Diplomat'), (SELECT id from drinks_ingredients WHERE ingredient_name='Maraschino'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Diplomat'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange Bitters'), 1, 'dash'),
((SELECT id from drinks WHERE drink_name='Diplomat'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='East India'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cognac'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='East India'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grand Marnier'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='East India'), (SELECT id from drinks_ingredients WHERE ingredient_name='Maraschino'), 1, 'dash'),
((SELECT id from drinks WHERE drink_name='East India'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grenadine'), 1, 'dash'),
((SELECT id from drinks WHERE drink_name='East India'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura Bitters'), 1, 'dash'),
((SELECT id from drinks WHERE drink_name='East India'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='El Diablo'), (SELECT id from drinks_ingredients WHERE ingredient_name='Tequila'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='El Diablo'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='El Diablo'), (SELECT id from drinks_ingredients WHERE ingredient_name='Creme de Cassis'), 1, 'dash'),
((SELECT id from drinks WHERE drink_name='El Diablo'), (SELECT id from drinks_ingredients WHERE ingredient_name='Ginger Ale'), 1, 'top with'),
((SELECT id from drinks WHERE drink_name='El Diablo'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='El Floridita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='El Floridita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='El Floridita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='El Floridita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Maraschino liqueur'), 1, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='El Presidente'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='El Presidente'), (SELECT id from drinks_ingredients WHERE ingredient_name='Pineapple juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='El Presidente'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='El Presidente'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grenadine'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='El Presidente'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Espresso Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Espresso Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coffee liqueur'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Espresso Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Espresso'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Espresso Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coffee beans'), 3, 'pieces');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Fish House Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Brandy'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Fish House Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Fish House Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Peach liqueur'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Fish House Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Fish House Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Fish House Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Soda'), 1, 'top with'),
((SELECT id from drinks WHERE drink_name='Fish House Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grated nutmeg'), 1, 'shaving'),
((SELECT id from drinks WHERE drink_name='Fish House Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon wedge'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='French 75'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 3.5, 'cl'),
((SELECT id from drinks WHERE drink_name='French 75'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='French 75'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 0.5, 'cl'),
((SELECT id from drinks WHERE drink_name='French 75'), (SELECT id from drinks_ingredients WHERE ingredient_name='Prosecco'), 1, 'top with'),
((SELECT id from drinks WHERE drink_name='French 75'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon zest'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Death in the Afternoon'), (SELECT id from drinks_ingredients WHERE ingredient_name='Absinthe'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Death in the Afternoon'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Death in the Afternoon'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 0.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Death in the Afternoon'), (SELECT id from drinks_ingredients WHERE ingredient_name='Prosecco'), 1, 'top with'),
((SELECT id from drinks WHERE drink_name='Death in the Afternoon'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon zest'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='French Connection'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cognac'), 3.5, 'cl'),
((SELECT id from drinks WHERE drink_name='French Connection'), (SELECT id from drinks_ingredients WHERE ingredient_name='Amaretto liqueur'), 3.5, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='French Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='French Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Chambord liqueur'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='French Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Pineapple juice'), 5, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Gimlet'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Gimlet'), (SELECT id from drinks_ingredients WHERE ingredient_name='Roses Lime cordial'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Gimlet'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Gin Cockail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Gin Cockail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Gin Cockail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Gin Cockail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura Bitters'), 1, 'dash'),
((SELECT id from drinks WHERE drink_name='Gin Cockail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon zest'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Gin Rickey'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Gin Rickey'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Gin Rickey'), (SELECT id from drinks_ingredients WHERE ingredient_name='Soda'), 1, 'top with'),
((SELECT id from drinks WHERE drink_name='Gin Rickey'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Godfather'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cognac'), 3.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Godfather'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whisky'), 3.5, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Grasshopper'), (SELECT id from drinks_ingredients WHERE ingredient_name='Creme de Cacao'), 3.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Grasshopper'), (SELECT id from drinks_ingredients WHERE ingredient_name='Creme de Menthe'), 3.5, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Hanky-Panky Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Hanky-Panky Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Hanky-Panky Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Fernet Branca'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Hanky-Panky Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange juice'), 25, 'cl'),
((SELECT id from drinks WHERE drink_name='Hanky-Panky Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange zest'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Harvard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cognac'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Harvard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Harvard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange Bitters'), 1, 'dash'),
((SELECT id from drinks WHERE drink_name='Harvard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Soda'), 1, 'top with'),
((SELECT id from drinks WHERE drink_name='Harvard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Harvey Wallbanger'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Harvey Wallbanger'), (SELECT id from drinks_ingredients WHERE ingredient_name='Galliano liqueur'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Harvey Wallbanger'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange juice'), 1, 'top with'),
((SELECT id from drinks WHERE drink_name='Harvey Wallbanger'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange slice'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Hurricane'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Hurricane'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Hurricane'), (SELECT id from drinks_ingredients WHERE ingredient_name='Pineapple juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Hurricane'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Hurricane'), (SELECT id from drinks_ingredients WHERE ingredient_name='Roses Lime cordial'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Hurricane'), (SELECT id from drinks_ingredients WHERE ingredient_name='Passion fruit syrup'), 1, 'to taste'),
((SELECT id from drinks WHERE drink_name='Hurricane'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'piece'),
((SELECT id from drinks WHERE drink_name='Hurricane'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cherry'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Japanese Slipper'), (SELECT id from drinks_ingredients WHERE ingredient_name='Midori Melon liqueur'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Japanese Slipper'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cointreau'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Japanese Slipper'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Japanese Slipper'), (SELECT id from drinks_ingredients WHERE ingredient_name='Melon slice'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='June Bug'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='June Bug'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='June Bug'), (SELECT id from drinks_ingredients WHERE ingredient_name='Midori Melon liqueur'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='June Bug'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='June Bug'), (SELECT id from drinks_ingredients WHERE ingredient_name='Creme de banane'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='June Bug'), (SELECT id from drinks_ingredients WHERE ingredient_name='Pineapple juice'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='June Bug'), (SELECT id from drinks_ingredients WHERE ingredient_name='Melon slice'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Kamikaze'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Kamikaze'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cointreau'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Kamikaze'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Kamikaze'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime slice'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Kir Royale'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cassis De Dijon'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Kir Royale'), (SELECT id from drinks_ingredients WHERE ingredient_name='Champagne'), 1, 'top with');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='The Last Word'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='The Last Word'), (SELECT id from drinks_ingredients WHERE ingredient_name='Chartreuse'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='The Last Word'), (SELECT id from drinks_ingredients WHERE ingredient_name='Maraschino'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='The Last Word'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='The Last Word'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Lemon Drop'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Lemon Drop'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Lemon Drop'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Lemon Drop'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Lynchburg Lemonade'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whisky'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Lynchburg Lemonade'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Lynchburg Lemonade'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Lynchburg Lemonade'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon wedge'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Mai Tai'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Mai Tai'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Mai Tai'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Mai Tai'), (SELECT id from drinks_ingredients WHERE ingredient_name='Sugar syrup'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Mai Tai'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'piece'),
((SELECT id from drinks WHERE drink_name='Mai Tai'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cherry'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Manhattan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whiskey'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Manhattan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Manhattan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'), 1, 'optional, for garnish'),
((SELECT id from drinks WHERE drink_name='Manhattan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist'), 1, 'optional, for garnish'),
((SELECT id from drinks WHERE drink_name='Manhattan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cherry'), 1, 'optional, for garnish');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Margarita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Tequila'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Margarita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Margarita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 1, 'top with'),
((SELECT id from drinks WHERE drink_name='Margarita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Olive'), 1, 'for garnish');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Gibson'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Gibson'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Gibson'), (SELECT id from drinks_ingredients WHERE ingredient_name='Pickled onion'), 1, 'for garnish');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Mary Pickford'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Mary Pickford'), (SELECT id from drinks_ingredients WHERE ingredient_name='Pineapple juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Mary Pickford'), (SELECT id from drinks_ingredients WHERE ingredient_name='Maraschino'), 0.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Mary Pickford'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grenadine syrup'), 1, 'for garnish');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Mint Julep'), (SELECT id from drinks_ingredients WHERE ingredient_name='Bourbon'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Mint Julep'), (SELECT id from drinks_ingredients WHERE ingredient_name='Fresh mint'), 12, 'leaves'),
((SELECT id from drinks WHERE drink_name='Mint Julep'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Mint Julep'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura Bitters'), 3, 'dashes'),
((SELECT id from drinks WHERE drink_name='Mint Julep'), (SELECT id from drinks_ingredients WHERE ingredient_name='Fresh mint'), 1, 'for garnish');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Mojito'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Mojito'), (SELECT id from drinks_ingredients WHERE ingredient_name='Fresh mint'), 12, 'leaves'),
((SELECT id from drinks WHERE drink_name='Mojito'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Mojito'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Mojito'), (SELECT id from drinks_ingredients WHERE ingredient_name='Soda'), 1, 'top with'),
((SELECT id from drinks WHERE drink_name='Mojito'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'for garnish'),
((SELECT id from drinks WHERE drink_name='Mojito'), (SELECT id from drinks_ingredients WHERE ingredient_name='Fresh mint'), 1, 'for garnish');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Moscow Mule'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Moscow Mule'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Moscow Mule'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'for garnish'),
((SELECT id from drinks WHERE drink_name='Moscow Mule'), (SELECT id from drinks_ingredients WHERE ingredient_name='Ginger Ale'), 1, 'to top with');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Negroni'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Negroni'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Negroni'), (SELECT id from drinks_ingredients WHERE ingredient_name='Campari'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Negroni'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange wedge'), 1, 'for garnish');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='New Yorker'), (SELECT id from drinks_ingredients WHERE ingredient_name='Bourbon'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='New Yorker'), (SELECT id from drinks_ingredients WHERE ingredient_name='Red wine'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='New Yorker'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='New Yorker'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='New Yorker'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grated nutmeg'), 1, 'shaving');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Nuclear Daiquiri'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Nuclear Daiquiri'), (SELECT id from drinks_ingredients WHERE ingredient_name='Chartreuse'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Nuclear Daiquiri'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Nuclear Daiquiri'), (SELECT id from drinks_ingredients WHERE ingredient_name='Velvet Falernum'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Nuclear Daiquiri'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Old Fashioned'), (SELECT id from drinks_ingredients WHERE ingredient_name='Bourbon'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Old Fashioned'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 0.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Old Fashioned'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura Bitters'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Old Fashioned'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Painkiller'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Painkiller'), (SELECT id from drinks_ingredients WHERE ingredient_name='Pineapple juice'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Painkiller'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Painkiller'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coconut cream'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Painkiller'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grated nutmeg'), 1, 'shaving');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Paloma'), (SELECT id from drinks_ingredients WHERE ingredient_name='Tequila'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Paloma'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Paloma'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grapefruit juice'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Paloma'), (SELECT id from drinks_ingredients WHERE ingredient_name='Soda'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Paloma'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Paradise'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 3.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Paradise'), (SELECT id from drinks_ingredients WHERE ingredient_name='Apricot Brandy'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Paradise'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange juice'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Paradise'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 1.5, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Pegu Club'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 3.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Pegu Club'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Pegu Club'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Pegu Club'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura Bitters'), 1, 'dash'),
((SELECT id from drinks WHERE drink_name='Pegu Club'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange Bitters'), 1, 'dash');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Pina Colada'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 3.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Pina Colada'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coconut cream'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Pina Colada'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Pina Colada'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cream'), 1, 'dash of'),
((SELECT id from drinks WHERE drink_name='Pina Colada'), (SELECT id from drinks_ingredients WHERE ingredient_name='Pineapple juice'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Pina Colada'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Rum Swizzle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Rum Swizzle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 3.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Rum Swizzle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Rum Swizzle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'piece'),
((SELECT id from drinks WHERE drink_name='Rum Swizzle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Fresh mint'), 1, 'small bunch');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Russian Spring Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Russian Spring Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 3.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Russian Spring Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Russian Spring Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Creme de Cassis'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Russian Spring Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Prosecco'), 1, 'top with'),
((SELECT id from drinks WHERE drink_name='Russian Spring Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon wedge'), 1, 'piece'),
((SELECT id from drinks WHERE drink_name='Russian Spring Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Raspberry'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Rusty Nail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whisky'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Rusty Nail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Drambuie'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Rusty Nail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Sazerac'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whisky'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sazerac'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Sazerac'), (SELECT id from drinks_ingredients WHERE ingredient_name='Paychards Bitters'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Sazerac'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Sazerac'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whisky'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sazerac'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Sazerac'), (SELECT id from drinks_ingredients WHERE ingredient_name='Paychards Bitters'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Sazerac'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Screaming Orgasm'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Screaming Orgasm'), (SELECT id from drinks_ingredients WHERE ingredient_name='Baileys Irish Cream'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Screaming Orgasm'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coffee liqueur'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Screaming Orgasm'), (SELECT id from drinks_ingredients WHERE ingredient_name='Amaretto liqueur'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Screaming Orgasm'), (SELECT id from drinks_ingredients WHERE ingredient_name='Milk'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Screaming Orgasm'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange slice'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Sex on the beach'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sex on the beach'), (SELECT id from drinks_ingredients WHERE ingredient_name='Peach liqueur'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sex on the beach'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange juice'),  5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sex on the beach'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cranberry juice'),  5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sex on the beach'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange slice'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Sidecar'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cognac'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sidecar'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sidecar'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'),  5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sidecar'), (SELECT id from drinks_ingredients WHERE ingredient_name='Sugar'),  0.5, 'tbsp for the rim');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Sidecar'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cognac'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sidecar'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sidecar'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'),  5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sidecar'), (SELECT id from drinks_ingredients WHERE ingredient_name='Sugar'),  0.5, 'tbsp for the rim');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Tequila Sunrise'), (SELECT id from drinks_ingredients WHERE ingredient_name='Tequila'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Tequila Sunrise'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange juice'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Tequila Sunrise'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grenadine'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Tequila Sunrise'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Tommys Margarita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Tequila'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Tommys Margarita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Tommys Margarita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Sugar syrup'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Tommys Margarita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Treacle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Treacle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura'), 1, 'dash'),
((SELECT id from drinks WHERE drink_name='Treacle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Apple juice'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Treacle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Twinkle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Twinkle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Elderflower liqueur'), 1, 'dash'),
((SELECT id from drinks WHERE drink_name='Twinkle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Sparkling wine'), 1, 'top with'),
((SELECT id from drinks WHERE drink_name='Twinkle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Vesper Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Vesper Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Vesper Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lillet'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Vesper Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Whisky sour'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whisky'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Whisky sour'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Whisky sour'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Whisky sour'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura'), 1, 'dash'),
((SELECT id from drinks WHERE drink_name='Whisky sour'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='White Lady'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='White Lady'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='White Lady'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='White Lady'), (SELECT id from drinks_ingredients WHERE ingredient_name='Egg white'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='White Lady'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='White Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='White Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Mozart White Chocolate Liqueur'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='White Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Milk'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='White Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Chocolate'), 1, 'piece, grated, to garnish');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='White Russian'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='White Russian'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coffee liqueur'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='White Russian'), (SELECT id from drinks_ingredients WHERE ingredient_name='Milk'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='White Russian'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coffee beans'), 3, 'to garnish');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Zombie'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Zombie'), (SELECT id from drinks_ingredients WHERE ingredient_name='Apricot Brandy'), 12.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Zombie'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 15, 'cl'),
((SELECT id from drinks WHERE drink_name='Zombie'), (SELECT id from drinks_ingredients WHERE ingredient_name='Pineapple juice'), 25, 'cl'),
((SELECT id from drinks WHERE drink_name='Zombie'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grenadine syrup'), 0.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Zombie'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura'), 1, 'dash'),
((SELECT id from drinks WHERE drink_name='Zombie'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'piece');
