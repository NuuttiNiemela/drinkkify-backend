DROP TABLE IF EXISTS drinks CASCADE;
DROP TABLE IF EXISTS drinks_recipes;
DROP TABLE IF EXISTS drinks_ingredients CASCADE;

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

-- Tallenna alkoholit yms raaka-aineet.
INSERT INTO drinks_ingredients (ingredient_name) VALUES
('Apricot Brandy'),
('Absinthe'),
('Amaretto liqueur'),
('Anise-flavored liqueur'),
('Anisette'),
('Apple-flavored liqueur'),
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
('Creme de Cacao'),
('Crème de Menthe'),
('Crème de Mure'),
('Creme liqueur'),
('Dessert wine'),
('Drambuie'),
('Elderflower liqueur'),
('Fernet Branca'),
('Flower liqueur'),
('Fortified wine'),
('Fruit liqueur'),
('Gin'),
('Glogg'),
('Gomme'),
('Grand Marnier'),
('Herbal liqueur'),
('Herbsaint'),
('Herbsaint Frappé'),
('Honey liqueur'),
('Jagermaister'),
('Lillet'),
('Lillet Blanc'),
('Limoncello'),
('Madeira'),
('Martini'),
('Martini Rosso'),
('Mauresque'),
('Maraschino'),
('Midori Melon liqueur'),
('Mozart White Chocolate Liqueur'),
('Nut-flavored liqueur'),
('Orange-flavored liqueur'),
('Orange Bitters'),
('Ouzo'),
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
('Sugar'), ('Salt'), ('Lime'), ('Lemon'), ('Black pepper'), ('Peach pure'), ('Soda'), ('Coke'), ('Lemon soda'), ('Orange juice'), ('Tonic'),
('Tomato juice'), ('Apple juice'), ('Lime juice'), ('Lemon juice'), ('Cucumber'), ('Strawberry pure'), ('Tonic water'), ('Ginger Ale'),
('Cranberry juice'), ('Grapefruit juice'), ('club soda'), ('Lemon juice'), ('Cucumber'), ('Strawberry pure'), ('Tabasco'),
('Lemon twists'), ('Angostura'), ('Lime wedge'), ('Lemon wedge'), ('Lemon zest'), ('Lemon twist'), ('Orange wedge'), ('Orange slice'), ('Apple fan'),
('Maraschino cherry'), ('Olive'), ('Orange slice'), ('Worcestershire sauce'), ('Celery stick'), ('Egg white'), ('Orange twist'), ('Raspberry'),
('Milk'), ('Cream'), ('Sugar syrup'), ('Egg'), ('Orange zest'), ('Espresso'), ('Coffee beans'), ('Grated nutmeg'), ('Passion fruit syrup'),
('Cherry'), ('Melon slice'), ('Pickled onion'), ('Grenadine syrup'), ('Fresh mint'), ('Chocolate');

-- Tallenna cocktailien nimi ja ohje.
INSERT INTO drinks (drink_name, drink_instructions)
VALUES
('Vodka Martini', 'Shaken, not stirred. Find your inner Daniel Craig.'),
('Gin Tonic', 'Mix n Match! Hipster points for the innovative use of cucumber, cranberries and other garnish.'),
('Tom Collins', 'Serve chilled! What could go wrong?'),
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
('Blood and Sand', 'Shake and fine strain.'),
('Aviation', 'Shake hard, fine strain.'),
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
('Martini (Dry)', 'Dry=Less vermouth, Wet= More vermouth. Stir in mixing glass and strain.'),
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
('Screwdriver', 'Build in glass.'),
('Sex on the beach', 'Shake and strain.'),
('Sidecar', 'Shake hard and strain.'),
('Singapore Sling', 'Shake first ingredients, top with soda, drizzle Cherry Brandy on top.'),
('Tequila Sunrise', 'Build in glass.'),
('Tom Collins', 'Build in glass.'),
('Tommys Margarita', 'Shake and fine strain.'),
('Treacle', 'Stir in glass, float apple juice.'),
('Twinkle', 'Build in glass.'),
('Vesper Martini', 'Shake hard and fine strain.'),
('Whisk(e)y sour.', 'Shake hard and fine strain.'),
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
((SELECT id from drinks WHERE drink_name='Vodka-vissy'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Vodka-vissy'), (SELECT id from drinks_ingredients WHERE ingredient_name='Soda'), 10, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Americano'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Americano'), (SELECT id from drinks_ingredients WHERE ingredient_name='Campari'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Americano'), (SELECT id from drinks_ingredients WHERE ingredient_name='Soda'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Americano'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon zest')),
((SELECT id from drinks WHERE drink_name='Americano'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange slice'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Apple Blossom'), (SELECT id from drinks_ingredients WHERE ingredient_name='Calvados'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Apple Blossom'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Apple Blossom'), (SELECT id from drinks_ingredients WHERE ingredient_name='Apple fan'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Aviation'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Aviation'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Aviation'), (SELECT id from drinks_ingredients WHERE ingredient_name='Maraschino'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Aviation'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon zest')),
((SELECT id from drinks WHERE drink_name='Aviation'), (SELECT id from drinks_ingredients WHERE ingredient_name='Crème de Violette'), 2, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Bacardi Cocktail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Bacardi'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Bacardi Cocktail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Bacardi Cocktail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grenadine'), 1, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Bellini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Peach pure'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Bellini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Prosecco'), 'top with');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Between the sheets'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Between the sheets'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cointreau'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Between the sheets'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cognac'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Between the sheets'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 0.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Between the sheets'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Black Russian'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Black Russian'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coffee liqueur'), 2.5, 'cl');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Black Velvet'), (SELECT id from drinks_ingredients WHERE ingredient_name='Guiness'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Black Velvet'), (SELECT id from drinks_ingredients WHERE ingredient_name='Champagne'), 'top with');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Blood and Sand'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whisky'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Blood and Sand'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cherry Brandy'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Blood and Sand'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Blood and Sand'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange juice'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Blood and Sand'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange zest'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Bloody Mary'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Bloody Mary'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Bloody Mary'), (SELECT id from drinks_ingredients WHERE ingredient_name='Black pepper')),
((SELECT id from drinks WHERE drink_name='Bloody Mary'), (SELECT id from drinks_ingredients WHERE ingredient_name='Celery')),
((SELECT id from drinks WHERE drink_name='Bloody Mary'), (SELECT id from drinks_ingredients WHERE ingredient_name='Salt')),
((SELECT id from drinks WHERE drink_name='Bloody Mary'), (SELECT id from drinks_ingredients WHERE ingredient_name='Tabasco')),
((SELECT id from drinks WHERE drink_name='Bloody Mary'), (SELECT id from drinks_ingredients WHERE ingredient_name='Worcestershire sauce')),
((SELECT id from drinks WHERE drink_name='Bloody Mary'), (SELECT id from drinks_ingredients WHERE ingredient_name='Tomato juice')),
((SELECT id from drinks WHERE drink_name='Bloody Mary'), (SELECT id from drinks_ingredients WHERE ingredient_name='Celery stick'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Blue Moon'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Blue Moon'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Blue Moon'), (SELECT id from drinks_ingredients WHERE ingredient_name='Egg white'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Raspberry Boulevard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whisky'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Raspberry Boulevard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Raspberry Boulevard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grand Marnier'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Raspberry Boulevard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange Bitters '), 2, 'dashes'),
((SELECT id from drinks WHERE drink_name='Raspberry Boulevard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist')),
((SELECT id from drinks WHERE drink_name='Raspberry Boulevard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cherry'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Bobby Burns'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whisky'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Bobby Burns'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Bobby Burns'), (SELECT id from drinks_ingredients WHERE ingredient_name='Benedictine D.O.M '), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Bobby Burns'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Bramble'), (SELECT id from drinks_ingredients WHERE ingredient_name='Crème de Mure'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Bramble'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Bramble'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Bramble'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Bramble'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon slice')),
((SELECT id from drinks WHERE drink_name='Bramble'), (SELECT id from drinks_ingredients WHERE ingredient_name='Raspberry'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Brandy Alexander'), (SELECT id from drinks_ingredients WHERE ingredient_name='Brandy'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Brandy Alexander'), (SELECT id from drinks_ingredients WHERE ingredient_name='Creme de cacao'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Brandy Alexander'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cream'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Brandy Alexander'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grated nutmeg'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Brandy Flip'), (SELECT id from drinks_ingredients WHERE ingredient_name='Brandy'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Brandy Flip'), (SELECT id from drinks_ingredients WHERE ingredient_name='Sugar syrup'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Brandy Flip'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cream'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Brandy Flip'), (SELECT id from drinks_ingredients WHERE ingredient_name='Egg')),
((SELECT id from drinks WHERE drink_name='Brandy Flip'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grated nutmeg'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Breakfast Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Breakfast Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Breakfast Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Breakfast Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Bronx'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Bronx'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Bronx'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange juice'), 10, 'cl'),
((SELECT id from drinks WHERE drink_name='Bronx'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Brooklyn'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whisky'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Brooklyn'), (SELECT id from drinks_ingredients WHERE ingredient_name='Maraschino liqueur'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Brooklyn'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Brooklyn'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist')),
((SELECT id from drinks WHERE drink_name='Brooklyn'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura Bitters')),
((SELECT id from drinks WHERE drink_name='Brooklyn'), (SELECT id from drinks_ingredients WHERE ingredient_name='Maraschino cherry'));


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
((SELECT id from drinks WHERE drink_name='Caipirinha'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 1, 'piece');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Champagne Cocktail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cognac'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Champagne Cocktail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Champagne'), 'top with'),
((SELECT id from drinks WHERE drink_name='Champagne Cocktail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange zest'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Clover Club'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Clover Club'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Clover Club'), (SELECT id from drinks_ingredients WHERE ingredient_name='Egg white'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Cobbler'), (SELECT id from drinks_ingredients WHERE ingredient_name='Brandy'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Cobbler'), (SELECT id from drinks_ingredients WHERE ingredient_name='Sugar syrup'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Cobbler'), (SELECT id from drinks_ingredients WHERE ingredient_name='Red wine'), 7, 'cl'),
((SELECT id from drinks WHERE drink_name='Cobbler'), (SELECT id from drinks_ingredients WHERE ingredient_name='Mint'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Corpse Reviver'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Corpse Reviver'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Corpse Reviver'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Corpse Reviver'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Corpse Reviver'), (SELECT id from drinks_ingredients WHERE ingredient_name='Absinthe'), 0.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Corpse Reviver'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon zest'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Cosmopolitan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Cosmopolitan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Cosmopolitan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Cosmopolitan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cranberry juice'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Cosmopolitan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange Bitters'), 'dash'),
((SELECT id from drinks WHERE drink_name='Cosmopolitan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange zest'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Crusta'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Crusta'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Crusta'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 12.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Crusta'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 0.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Crusta'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura Bitters'), 'dash'),
((SELECT id from drinks WHERE drink_name='Crusta'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange zest'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Cuba Libre'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Cuba Libre'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Cuba Libre'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coke'), 'top with'),
((SELECT id from drinks WHERE drink_name='Cuba Libre'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'));

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
((SELECT id from drinks WHERE drink_name='Dark n Stormy'), (SELECT id from drinks_ingredients WHERE ingredient_name='Ginger Ale'), 'top with'),
((SELECT id from drinks WHERE drink_name='Dark n Stormy'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Diplomat'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Diplomat'), (SELECT id from drinks_ingredients WHERE ingredient_name='Maraschino liqueur'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Diplomat'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange Bitters'), 'dash'),
((SELECT id from drinks WHERE drink_name='Diplomat'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='East India'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cognac'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='East India'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grand Marnier'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='East India'), (SELECT id from drinks_ingredients WHERE ingredient_name='Maraschino liqueur'), 'dash'),
((SELECT id from drinks WHERE drink_name='East India'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grenadine'), 'dash'),
((SELECT id from drinks WHERE drink_name='East India'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura Bitters'), 'dash'),
((SELECT id from drinks WHERE drink_name='East India'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='El Diablo'), (SELECT id from drinks_ingredients WHERE ingredient_name='Tequila'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='El Diablo'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='El Diablo'), (SELECT id from drinks_ingredients WHERE ingredient_name='Creme de Cassis'), 'dash'),
((SELECT id from drinks WHERE drink_name='El Diablo'), (SELECT id from drinks_ingredients WHERE ingredient_name='Ginger Beer'), 'top with'),
((SELECT id from drinks WHERE drink_name='El Diablo'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'));

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
((SELECT id from drinks WHERE drink_name='El Presidente'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Espresso Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Espresso Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coffee Liqueur'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Espresso Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Espresso'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Espresso Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coffee beans'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Fish House Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Brandy'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Fish House Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Fish House Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Peach liqueur'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Fish House Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Fish House Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Fish House Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Soda'), 'top with'),
((SELECT id from drinks WHERE drink_name='Fish House Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grated nutmeg')),
((SELECT id from drinks WHERE drink_name='Fish House Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon wedge'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='French 75'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 3.5, 'cl'),
((SELECT id from drinks WHERE drink_name='French 75'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='French 75'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 0.5, 'cl'),
((SELECT id from drinks WHERE drink_name='French 75'), (SELECT id from drinks_ingredients WHERE ingredient_name='Prosecco'), 'top with'),
((SELECT id from drinks WHERE drink_name='French 75'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon zest'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Death in the Afternoon'), (SELECT id from drinks_ingredients WHERE ingredient_name='Absinthe'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Death in the Afternoon'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Death in the Afternoon'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 0.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Death in the Afternoon'), (SELECT id from drinks_ingredients WHERE ingredient_name='Prosecco'), 'top with'),
((SELECT id from drinks WHERE drink_name='Death in the Afternoon'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon zest'));

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
((SELECT id from drinks WHERE drink_name='Gimlet'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Gin Cockail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Gin Cockail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Gin Cockail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Gin Cockail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura Bitters'), 'dash'),
((SELECT id from drinks WHERE drink_name='Gin Cockail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon zest'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Gin Rickey'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Gin Rickey'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Gin Rickey'), (SELECT id from drinks_ingredients WHERE ingredient_name='Soda'), 'top with'),
((SELECT id from drinks WHERE drink_name='Gin Rickey'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'));

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
((SELECT id from drinks WHERE drink_name='Hanky-Panky Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange zest'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Harvard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cognac'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Harvard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Harvard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange Bitters'), 'dash'),
((SELECT id from drinks WHERE drink_name='Harvard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Soda'), 'top with'),
((SELECT id from drinks WHERE drink_name='Harvard'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Harvey Wallbanger'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Harvey Wallbanger'), (SELECT id from drinks_ingredients WHERE ingredient_name='Galliano liqueur'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Harvey Wallbanger'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange juice'), 'top with'),
((SELECT id from drinks WHERE drink_name='Harvey Wallbanger'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange slice'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Hurricane'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Hurricane'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Hurricane'), (SELECT id from drinks_ingredients WHERE ingredient_name='Pineapple juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Hurricane'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Hurricane'), (SELECT id from drinks_ingredients WHERE ingredient_name='Roses Lime cordial'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Hurricane'), (SELECT id from drinks_ingredients WHERE ingredient_name='Passion fruit syrup'), 'to taste'),
((SELECT id from drinks WHERE drink_name='Hurricane'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge')),
((SELECT id from drinks WHERE drink_name='Hurricane'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cherry'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Japanese Slipper'), (SELECT id from drinks_ingredients WHERE ingredient_name='Midori Melon liqueur'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Japanese Slipper'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cointreau'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Japanese Slipper'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Japanese Slipper'), (SELECT id from drinks_ingredients WHERE ingredient_name='Melon slice'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='June Bug'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='June Bug'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='June Bug'), (SELECT id from drinks_ingredients WHERE ingredient_name='Midori Melon liqueur'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='June Bug'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='June Bug'), (SELECT id from drinks_ingredients WHERE ingredient_name='Creme de banane'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='June Bug'), (SELECT id from drinks_ingredients WHERE ingredient_name='Pineapple juice'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='June Bug'), (SELECT id from drinks_ingredients WHERE ingredient_name='Melon slice'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Kamikaze'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Kamikaze'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cointreau'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Kamikaze'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Kamikaze'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime slice'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Kir Royal'), (SELECT id from drinks_ingredients WHERE ingredient_name='Creme de Cassis'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Kir Royal'), (SELECT id from drinks_ingredients WHERE ingredient_name='Champagne'), 'top with');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='The Last Word'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='The Last Word'), (SELECT id from drinks_ingredients WHERE ingredient_name='Chartreuse'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='The Last Word'), (SELECT id from drinks_ingredients WHERE ingredient_name='Maraschino'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='The Last Word'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='The Last Word'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Lemon Drop'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Lemon Drop'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Lemon Drop'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Lemon Drop'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Lynchburg Lemonade'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whisky'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Lynchburg Lemonade'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Lynchburg Lemonade'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Lynchburg Lemonade'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon wedge'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Mai Tai'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Mai Tai'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Mai Tai'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Mai Tai'), (SELECT id from drinks_ingredients WHERE ingredient_name='Sugar syrup'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Mai Tai'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge')),
((SELECT id from drinks WHERE drink_name='Mai Tai'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cherry'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Manhattan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whiskey'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Manhattan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angustora Bitters'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Manhattan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'), 'optional, for garnish'),
((SELECT id from drinks WHERE drink_name='Manhattan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist'), 'optional, for garnish'),
((SELECT id from drinks WHERE drink_name='Manhattan'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cherry'), 'optional, for garnish');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Margarita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Tequila'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='Margarita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Margarita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 'top with'),
((SELECT id from drinks WHERE drink_name='Margarita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Olive'), 'for garnish');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Gibson'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Gibson'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Gibson'), (SELECT id from drinks_ingredients WHERE ingredient_name='Pickled onion'), 'for garnish');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Mary Pickford'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Mary Pickford'), (SELECT id from drinks_ingredients WHERE ingredient_name='Pineapple juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Mary Pickford'), (SELECT id from drinks_ingredients WHERE ingredient_name='Maraschino'), 0.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Mary Pickford'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grenadine syrup'), 'for garnish');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Mint Julep'), (SELECT id from drinks_ingredients WHERE ingredient_name='Bourbon'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Mint Julep'), (SELECT id from drinks_ingredients WHERE ingredient_name='Fresh mint'), 12, 'leaves'),
((SELECT id from drinks WHERE drink_name='Mint Julep'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Mint Julep'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura Bitters'), 3, 'dashes'),
((SELECT id from drinks WHERE drink_name='Mint Julep'), (SELECT id from drinks_ingredients WHERE ingredient_name='Fresh mint'), 'for garnish');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Mojito'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Mojito'), (SELECT id from drinks_ingredients WHERE ingredient_name='Fresh mint'), 12, 'leaves'),
((SELECT id from drinks WHERE drink_name='Mojito'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Mojito'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Mojito'), (SELECT id from drinks_ingredients WHERE ingredient_name='Soda'), 'top with'),
((SELECT id from drinks WHERE drink_name='Mojito'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 'for garnish'),
((SELECT id from drinks WHERE drink_name='Mojito'), (SELECT id from drinks_ingredients WHERE ingredient_name='Fresh mint'), 'for garnish');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Moscow Mule'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Moscow Mule'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Moscow Mule'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'), 'for garnish'),
((SELECT id from drinks WHERE drink_name='Moscow Mule'), (SELECT id from drinks_ingredients WHERE ingredient_name='Ginger Ale'), 'top with');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Negroni'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Negroni'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vermouth'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Negroni'), (SELECT id from drinks_ingredients WHERE ingredient_name='Campari'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Negroni'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange wedge'), 'for garnish');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='New Yorker'), (SELECT id from drinks_ingredients WHERE ingredient_name='Bourbon'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='New Yorker'), (SELECT id from drinks_ingredients WHERE ingredient_name='Red wine'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='New Yorker'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='New Yorker'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='New Yorker'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grated nutmeg'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Nuclear Daiquiri'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Nuclear Daiquiri'), (SELECT id from drinks_ingredients WHERE ingredient_name='Chartreuse'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Nuclear Daiquiri'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Nuclear Daiquiri'), (SELECT id from drinks_ingredients WHERE ingredient_name='Velvet Falernum'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Nuclear Daiquiri'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'));


INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Old Fashioned'), (SELECT id from drinks_ingredients WHERE ingredient_name='Bourbon'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Old Fashioned'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 0.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Old Fashioned'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura Bitters'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Old Fashioned'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Painkiller'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Painkiller'), (SELECT id from drinks_ingredients WHERE ingredient_name='Pineapple juice'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Painkiller'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Painkiller'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coconut cream'), 2, 'cl'),
((SELECT id from drinks WHERE drink_name='Painkiller'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grated nutmeg'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Paloma'), (SELECT id from drinks_ingredients WHERE ingredient_name='Tequila'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Paloma'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Paloma'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grapefruit juice'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Paloma'), (SELECT id from drinks_ingredients WHERE ingredient_name='Soda'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Paloma'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'));

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
((SELECT id from drinks WHERE drink_name='Pegu Club'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura Bitters'), 'dash of'),
((SELECT id from drinks WHERE drink_name='Pegu Club'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange Bitters'), 'dash of');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Pina Colada'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 3.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Pina Colada'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coconut cream'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Pina Colada'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Pina Colada'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cream'), 'dash of'),
((SELECT id from drinks WHERE drink_name='Pina Colada'), (SELECT id from drinks_ingredients WHERE ingredient_name='Pineapple juice'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Pina Colada'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Rum Swizzle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Rum Swizzle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 3.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Rum Swizzle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Rum Swizzle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge')),
((SELECT id from drinks WHERE drink_name='Rum Swizzle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Mint leaf'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Russian Spring Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Russian Spring Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 3.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Russian Spring Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Russian Spring Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Creme de Cassis'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Russian Spring Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Prosecco'), 'top with'),
((SELECT id from drinks WHERE drink_name='Russian Spring Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon wedge')),
((SELECT id from drinks WHERE drink_name='Russian Spring Punch'), (SELECT id from drinks_ingredients WHERE ingredient_name='Raspberry'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Rusty Nail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whisky'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Rusty Nail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Drambuie'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Rusty Nail'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Sazerac'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whisky'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sazerac'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Sazerac'), (SELECT id from drinks_ingredients WHERE ingredient_name='Paychards Bitters'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Sazerac'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Sazerac'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whisky'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sazerac'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Sazerac'), (SELECT id from drinks_ingredients WHERE ingredient_name='Paychards Bitters'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Sazerac'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Screaming Orgasm'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 3, 'cl'),
((SELECT id from drinks WHERE drink_name='Screaming Orgasm'), (SELECT id from drinks_ingredients WHERE ingredient_name='Baileys Irish Cream'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Screaming Orgasm'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coffee liqueur '), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Screaming Orgasm'), (SELECT id from drinks_ingredients WHERE ingredient_name='Amaretto liqueur'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Screaming Orgasm'), (SELECT id from drinks_ingredients WHERE ingredient_name='Milk'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Screaming Orgasm'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange slice'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Sex on the beach'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sex on the beach'), (SELECT id from drinks_ingredients WHERE ingredient_name='Peach liqueur'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sex on the beach'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange juice'),  5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sex on the beach'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cranberry juice'),  5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sex on the beach'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange slice'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Sidecar'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cognac'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sidecar'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sidecar'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'),  5, 'cl'),
((SELECT id from drinks WHERE drink_name='Sidecar'), (SELECT id from drinks_ingredients WHERE ingredient_name='Sugar'),  0.5, 'tbsp for the rim');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Singapore Sling'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Singapore Sling'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Singapore Sling'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'),  2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Singapore Sling'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cherry brandy'),  1, 'cl'),
((SELECT id from drinks WHERE drink_name='Singapore Sling'), (SELECT id from drinks_ingredients WHERE ingredient_name='Benedictine'),  1, 'cl'),
((SELECT id from drinks WHERE drink_name='Singapore Sling'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'),  2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Singapore Sling'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura'),  'dash'),
((SELECT id from drinks WHERE drink_name='Singapore Sling'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon slice')),
((SELECT id from drinks WHERE drink_name='Singapore Sling'), (SELECT id from drinks_ingredients WHERE ingredient_name='Cherry'));

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
((SELECT id from drinks WHERE drink_name='Tequila Sunrise'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grenadine'),  1, 'cl'),
((SELECT id from drinks WHERE drink_name='Tequila Sunrise'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Tommys Margarita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Tequila'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Tommys Margarita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Tommys Margarita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Sugar syrup'),  1, 'cl'),
((SELECT id from drinks WHERE drink_name='Tommys Margarita'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Treacle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Treacle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura'), 'dash'),
((SELECT id from drinks WHERE drink_name='Treacle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Apple juice'),  1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Treacle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Twinkle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Twinkle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Elderflower liqueur'), 'dash'),
((SELECT id from drinks WHERE drink_name='Twinkle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Sparkling wine'),  'top with'),
((SELECT id from drinks WHERE drink_name='Twinkle'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Vesper Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Vesper Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Vesper Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lillet'), 1.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Vesper Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Whisky sour'), (SELECT id from drinks_ingredients WHERE ingredient_name='Whisky'), 5, 'cl'),
((SELECT id from drinks WHERE drink_name='Whisky sour'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Whisky sour'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gomme'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='Whisky sour'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura'), 'dash'),
((SELECT id from drinks WHERE drink_name='Whisky sour'), (SELECT id from drinks_ingredients WHERE ingredient_name='Orange twist'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='White Lady'), (SELECT id from drinks_ingredients WHERE ingredient_name='Gin'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='White Lady'), (SELECT id from drinks_ingredients WHERE ingredient_name='Triple Sec'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='White Lady'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon juice'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='White Lady'), (SELECT id from drinks_ingredients WHERE ingredient_name='Egg white'), 1, 'cl'),
((SELECT id from drinks WHERE drink_name='White Lady'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lemon twist'));

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='White Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 4, 'cl'),
((SELECT id from drinks WHERE drink_name='White Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Mozart White Chocolate Liqueur'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='White Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Milk'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='White Martini'), (SELECT id from drinks_ingredients WHERE ingredient_name='Chocolate'), 'grated, to garnish');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='White Russian'), (SELECT id from drinks_ingredients WHERE ingredient_name='Vodka'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='White Russian'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coffee liqueur'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='White Russian'), (SELECT id from drinks_ingredients WHERE ingredient_name='Milk'), 2.5, 'cl'),
((SELECT id from drinks WHERE drink_name='White Russian'), (SELECT id from drinks_ingredients WHERE ingredient_name='Coffee beans'), 'to garnish');

INSERT INTO drinks_recipes (drinks_id, ingredients_id, ingredients_amount, ingredients_unit)
VALUES
((SELECT id from drinks WHERE drink_name='Zombie'), (SELECT id from drinks_ingredients WHERE ingredient_name='Rum'), 7.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Zombie'), (SELECT id from drinks_ingredients WHERE ingredient_name='Apricot Brandy'), 12.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Zombie'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime juice'), 15, 'cl'),
((SELECT id from drinks WHERE drink_name='Zombie'), (SELECT id from drinks_ingredients WHERE ingredient_name='Pineapple juice'), 25, 'cl'),
((SELECT id from drinks WHERE drink_name='Zombie'), (SELECT id from drinks_ingredients WHERE ingredient_name='Grenadine syrup'), 0.5, 'cl'),
((SELECT id from drinks WHERE drink_name='Zombie'), (SELECT id from drinks_ingredients WHERE ingredient_name='Angostura'), 'dash'),
((SELECT id from drinks WHERE drink_name='Zombie'), (SELECT id from drinks_ingredients WHERE ingredient_name='Lime wedge'));
