CREATE DATABASE IF NOT EXISTS ChallengeGenerator;


CREATE TABLE Person (
ch_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
ch_name VARCHAR(20),
ch_pic VARCHAR(40),
tainted VARCHAR(1) DEFAULT 0,
info TEXT
);

CREATE TABLE Ending (
ending_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
boss VARCHAR(20),
boss_pic VARCHAR(40)
);

CREATE TABLE Deal (
deal_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
deal VARCHAR(30)
);

CREATE TABLE Shops(
shop_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
allowed VARCHAR(20)
);

CREATE TABLE generation(
generation_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ch_id INT,
boss INT,
ADdeal INT,
shops INT,
FOREIGN KEY (ch_id) REFERENCES person(ch_id),
FOREIGN KEY(boss) REFERENCES ending(ending_id),
FOREIGN KEY(ADdeal) REFERENCES deal(deal_id),
FOREIGN KEY(shops) REFERENCES shops(shop_id)
);

CREATE TABLE Extra (
extra_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
rule TEXT
);

CREATE TABLE EveryItem (
item_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
item VARCHAR(30)
);

CREATE TABLE ItemCombo(
item_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
item VARCHAR(30)
);

INSERT INTO Person (ch_name, ch_pic, info) VALUES("Isaac", "isaac.png", "3 hearts, starts with D6 (Can reroll items)"), 
("Magdalene", "magdalene.png", "4 hearts, starts with a pill and Yum Heart (Heals 1 heart)"), 
("Cain", "cain.png", "2 hearts, starts with the trinket Paper Clip (Opens golden chests for free) and item Lucky Foot (No bad pills, better luck in gambling)"), 
("Judas", "judas.png", "1 heart, starts with The Book of Belial (+2 damage for the current room)"), 
("??? (Blue Baby)", "bluebaby.png", "3 soul hearts, no red health. Starts with The Poop (Spawns poop on use)"), 
("Eve", "eve.png", "2 hearts, starts with Dead Bird (Taking damage spawns a familiar that chases enemies), Whore of Babylon (+1.5 dmg and 0.3 speed when on one heart or less) and Razor Blade (On use, spends 1 heart and gives 1.2 dmg for the room)"), 
("Samson", "samson.png", "3 hearts, starts with the trinket Child's heart (Higher chance for health pickups) and the item Bloody lust (Taking damage increases Samson's damage for the current floor)"), 
("Azael", "azael.png", "3 black hearts, starts with flight and a short ranged Brimstone (Replaces tears with a laser beam)"), ("Lazarus", "lazarus.png", "3 hearts, starts with Anemic (Taking damage makes Lazarus leave creep for the current room) and has an extra life"), 
("Eden", "eden.png", "Random amount of health, random stats. Starts with a random passive and active item"), ("The Lost", "lost.png", "No health. Starts with flight and spectral tears, Eternal D6 (Can reroll items. 30% chance for the item to disappear) and Holy Mantle (Allows one hit without taking damage each room)"), 
("Keeper", "keeper.png", "3 coin hearts, starts with Triple shot and active item Wooden Nickel (50% chance to drop a coin on use)"), 
("Apollyon", "apollyon.png", "2 hearts, starts with The Void (Ability to consume passive items for statboosts. Active items get consumed and get used on every Void use in the future)"), 
("Lilith", "lilith.png", "1 heart, 2 black hearts. Starts with Incubus (A familiar that shoots your tears) and active item Box of Friends (Duplicates your familiars for the current room) but the character itself can't shoot tears"), 
("The Forgotten", "forgotten.png", "2 bone hearts. Can do melee damage and switch to The Soul that has flight and spectral tears, but different health"), 
("Bethany", "bethany.png", "3 hearts, soul hearts get converted to item charges. Starts with Book of Virtues (On use, spawns a familiar that shoots Bethany's tears and can block enemy tears)"), 
("Jacob and Esau", "jacobesau.png", "2 combined characters where Jacob has 3 hearts and Esau has 1 heart and 1 soul heart. Each character has their own items");   

INSERT INTO Person (ch_name, ch_pic, tainted, info) VALUES("Tainted Isaac", "ta_isaac.png", 1, "3 hearts, can only hold 8 passive items at a time. All item rerollable item pedeatals cycle between 2 items to choose from"),
("Tainted Magdalene", "ta_magdalene.png", 1, "5 hearts, starts with Yum Heart (Heals two heart on use). Loses half a heart per 10 seconds, recieves double healing from all resources"),
("Tainted Judas", "ta_judas.png", 1, "2 black hearts, starts with Dark Arts (Turns Judas invisible and gives him +1.0 speed. Walking through enemies damages them when Judas turns back to normal)"),
("Tainted ???", "ta_bluebaby.png", 1, "3 soul hearts. Bombs are replaced by poop pickups that have different effects and can be thrown at enemies"),
("Tainted Eve", "ta_eve.png", 1, "2 hearts. Shooting turns Eve's hearts into familiars that shoot Eve's tears but deal 1/3 Eve's damage"),
("Tainted Samson", "ta_samson.png", 1, "3 hearts. Taking or dealing damage grows the Bezerk meter. When it's full, Samson gains melee weapon and a damage up for a short while"),
("Tainted Azael", "ta_azael.png", 1, "3 black hearts. Starts with a lower damage Brimstone (Replaces tears with a laser beam) and Hemoptysis (Double tapping fire causes a short-range knockback attack)"),
("Tainted Lazarus", "ta_lazarus.png", 1, "3 hearts. Switches between Lazarus and Dead Lazarus every room. Both characters have their own items, health and stats"),
("Tainted Lost", "ta_lost.png", 1, "No health. Tainted Lost has flight and spectral tears."),
("Tainted Lilith", "ta_lilith.png", 1, "1 heart, 2 black hearts. Instead of tears, fires a familiar that fires tears"),
("Tainted Keeper", "ta_keeper.png", 1, "2 coin hearts. Every enemy defeated drops a coin, that disappeas quickly. Better items in shops. Starts with Quad shot"),
("Tainted Apollyon", "ta_apollyon.png", 1, "2 hearts, starts with Abyss (Consumes an item and grants a locust familiar)"),
("Tainted Forgotten", "ta_forgotten.png", 1, "3 soul hearts. Tainted Forgotten can only do damage by throwing a pile of bones at enemies that can do melee damage"),
("Tainted Bethany", "ta_bethany.png", 1, "3 soul hearts. Can't have red health, but it can be used to charge her active item Lemegeton (On use grants a random passive item as an orbital wisp familiar)");

INSERT INTO Ending (boss, boss_pic) VALUES("The Hush", "hush.png"), ("Mother", "mother.png"), ("Dogma", "dogma.png"), ("??? (The Chest)", "bluebabyboss.png"), ("Isaac", "isaacboss.png"),
("Satan", "satan.png"), ("Mega Satan", "megasatan.png"), ("The Lamb (Dark Chest)", "lamb.png"), ("Delirium", "delirium.png"), ("Ultra Greed", "ultragreed.png"), ("Mom's heart", "momsheart.png");

INSERT INTO Deal (deal) VALUES ("Devil deals"), ("Angel deals"), ("No devil or angel deals");

INSERT INTO Shops (allowed) VALUES ("Yes"), ("No"), ("Only on alt-floors");

INSERT INTO EveryItem (item) VALUES ("Freezer baby"), ("Psy Fly"), ("Alabaster Box"), ("Death Certificate"), ("Rotten Baby"), ("Daddy Longlegs"), ("Gemini"), ("Leech"), ("Lil Haunt"), ("7 Seals"), ("Bird Cage"), 
("Ball of Bandages"), ("Cube of Meat"), ("Distant Admiration"), ("Demon Baby"), ("Rainbow Baby"), ("Incubus"), ("Buddy in a Box"), ("Lil Monstro"), ("Lil Dumpy"), ("The Peeper"), ("Succubus"), ("Fruity Plum"), 
("Multidimensional baby"), ("???'s Only Friend"), ("Lil Delirium"), ("Mystery Egg"), ("Cube Baby"), ("Lost Soul"), ("Worm Friend"), ("Mom's knife"), ("Finger!"), ("Guppy's hairball"), ("20/20"), ("Dr Fetus"), 
("Technology"), ("Ludovico"), ("Wiz shot"), ("God Head"), ("Tiny Planet"), ("Magic Mushroom"), ("The Pact"), ("Epic Fetus"), ("Capricorn"), ("Binky"), ("Pointy Rib"), ("Mystery Gift"), ("Lead Pencil"), ("Lil Portal"); 

INSERT INTO ItemCombo (item) VALUES ("Freezer baby"), ("Psy Fly"), ("Alabaster Box"), ("Death Certificate"), ("Rotten Baby"), ("Daddy Longlegs"), ("Gemini"), ("Leech"), ("Lil Haunt"), ("7 Seals"), ("Bird Cage"), 
("Ball of Bandages"), ("Cube of Meat"), ("Distant Admiration"), ("Demon Baby"), ("Rainbow Baby"), ("Incubus"), ("Buddy in a Box"), ("Lil Monstro"), ("Lil Dumpy"), ("The Peeper"), ("Succubus"), ("Fruity Plum"), 
("Multidimensional baby"), ("???'s Only Friend"), ("Lil Delirium"), ("Mystery Egg"), ("Cube Baby"), ("Lost Soul"), ("Worm Friend"), ("Mom's knife"), ("Finger!"), ("Guppy's hairball"), ("20/20"), ("Dr Fetus"), 
("Technology"), ("Ludovico"), ("Wiz shot"), ("God Head"), ("Tiny Planet"), ("Magic Mushroom"), ("The Pact"), ("Epic Fetus"), ("Capricorn"), ("Binky"), ("Pointy Rib"), ("Mystery Gift"), ("Lead Pencil"), ("Sacred Heart"), 
("Spoon Bender"), ("Host Hat"), ("Stop Watch"), ("Polyphemus"), ("BFF"), ("Rubber Cement"), ("Isaac's heart"), ("Lost Contact"), ("Tech 5"), ("Technology 2"), ("Proptosis"), ("The Parasite"), ("Ipecac"), ("Steam Sale"), 
("Scorpio"), ("Soy Milk"), ("Almond Milk"), ("Holy Mantle"), ("Big Fan"), ("Synthoil"), ("Cursed Eye"), ("Trinity Shield"), ("Mutant Spider"), ("Tech X"), ("Apple!"), ("Lachryphagy"), ("Pop!"), ("Eye Sore"),
("Bird's Eye"), ("C-Section"), ("Spirit Sword"), ("Rock Bottom"), ("Terra"), ("Mars"), ("Venus"), ("Neptunus"), ("Candy Heart"), ("Echo Chamber"), ("Eye of Occult"), ("Immaculate Heart"), ("The Intruder"), 
("Brimstone Bombs"), ("Dark Arts"), ("Mega Mush"), ("Knockout Drops"), ("Birthright");

INSERT INTO Extra (rule) VALUES ("Take all pills"), ("Go to all curse rooms"), ("Take all deals with the Angel/Devil but take all health up items"), ("Bomb every beggar"), ("Switch trinkets every time a new one appears"), ("Only open gold chests"), 
("Give item Clicker and change character every time it's active"), ("Play all beggars"), ("Buy everything you can from shops"), ("Give yourself 20 Shotspeed Up -pills at the start"), ("Use the Sacrifice room on every floor"),
("No black heart pick-ups"), ("Go to alternative path"), ("Give yourself Blood Oath and Holy Mantle. No health pick-ups allowed"), ("Give yourself 5 experimental pills at the start of each floor"), 
("Give yourself the Meat Cleaver and infinite charges(debug 8). Use in every room"), ("Play on Hard mode"), ("Play on the seed M0DE SEVN (permanent retrovision effect)"), ("Play on the seed SVPE RH0T (Time moves when you do)"), 
("Play on the seed CVRS ED (Permanent Curse of the Cursed)"), ("Play on the seed CHAM P10N (All enemies turn into champion versions)");

INSERT INTO generation (ch_id, boss, ADdeal, shops) VALUES (1,1,1,1);