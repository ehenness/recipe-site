-- MySQL dump 10.13  Distrib 8.0.45, for macos15 (arm64)
--
-- Host: localhost    Database: recipe_db
-- ------------------------------------------------------
-- Server version	9.6.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'f11f0ac4-1298-11f1-a3c1-f591f723c77e:1-39';

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'Salmon','Rich in omega-3 fatty acids. Cook to 145°F internal temperature.'),(2,'Taco seasoning',''),(3,'Avocado Oil','A highly nutritious, versatile cooking oil.'),(4,'Mango','A sweet, nutrient-dense stone fruit packed with vitamin C and fiber.'),(5,'Cucumber','A low-calorie, high water-content fruit native to Asia.'),(6,'Sweet corn','A low-starch variant of maize.'),(7,'Red Onion','Packed with antioxidants and can help support heart health.'),(8,'Cilantro','Native to southern Europe and Asia, some people have a gene that makes Cilantro taste like soap.'),(9,'Honey','A natural, nutrient-rich sweetener that acts as an antibacterial and anti-inflammatory agent.'),(10,'Lime Juice','Rich in vitamin C and antioxidants.'),(11,'Salt','A vital mineral used for flavoring, preserving food, and maintaining essential human body functions.'),(12,'Corn Tortillas','Gluten-free and a staple of Mexican and Central American cuisine.'),(13,'Gochujang','A Korean fermented chili paste made from red chili powder and soybeans.'),(14,'Tomato Paste','A thick concentrate made by cooking down tomatoes, resulting in a rich, umami-packed ingredient.'),(15,'Peanut Butter','Each tablespoon offers about 100 calories and 4g of protein.'),(16,'Water','You know this one!'),(17,'Brown Sugar','Contains molasses and provides moisture and a caramel-like flavor.'),(18,'Sesame Oil','A nutirent-rich vegetable oil prized for its distinct nutty aroma.'),(19,'Garlic','A bulb vegetable used worldwide for its culinary flavor.'),(20,'Ground Chicken','Mild flavor and absorbs seasonings well.'),(21,'Ground Black Pepper','A universal culinary staple.'),(22,'Stir Fry Noodles',''),(23,'Spinach','A leafy green packd with vitamins A, C, K, iron, and magnesium.'),(24,'Chili Oil','Usually made by infusing hot oil with dried chili peppers and spices.'),(25,'Sesame Seeds','Nutrient-dense, ancient oilseeds packed with healthy fats, protein, and antioxidants.'),(26,'Chili Paste','May be hot, sweet, or a combination of both.'),(27,'Vegetable Oil','A neutral-flavored liquid fat extracted from seeds, nuts, or fuits.'),(28,'Rice','Provides essential carbohydrates, fiberm and minerals.'),(29,'Carrots','A root vegetable packed with Vitamin A, fiber, and potassium.'),(30,'Green Onions','Aka scallions, these are best eaten raw as garnishes or cooked in stir-frys.'),(31,'Rice Vinegar','Made from fermented rice and offers a mild, slightly sweet, and tangy flavor profile.'),(32,'Cornstarch','A fine, white, gluten-free powder often used as a thickening agent.'),(33,'Ginger','Widely used for its potent anti-inflammatory and antioxidant propernameties.'),(34,'Soy Sauce','Traditional East Asian seasoning made from fermented soybeans.'),(35,'Broccoli','High in fiber and vitamin C.'),(36,'Pork Tenderloin','Lean cut of pork best cooked quickly at high heat.'),(37,'Beef Flank Steak','Best sliced thin against the grain for tenderness.');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_ingredients`
--

DROP TABLE IF EXISTS `recipe_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe_ingredients` (
  `recipe_id` int NOT NULL,
  `ingredient_id` int NOT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`recipe_id`,`ingredient_id`),
  KEY `ingredient_id` (`ingredient_id`),
  CONSTRAINT `recipe_ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recipe_ingredients_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingredients`
--

LOCK TABLES `recipe_ingredients` WRITE;
/*!40000 ALTER TABLE `recipe_ingredients` DISABLE KEYS */;
INSERT INTO `recipe_ingredients` VALUES (1,1,'1 lb.'),(1,2,'2-3 tsps'),(1,3,'2 tsps'),(1,4,'1 large, diced'),(1,5,'1, diced'),(1,6,'2 ears, kernels cut off the cob'),(1,7,'1/4 cup, finely chopped'),(1,8,'1/2 cup, finely chopped'),(1,9,'1 tbsp'),(1,10,'from 1 lime'),(1,11,'1/2 tsp'),(1,12,'8'),(2,11,'1 tsp'),(2,13,'2-3 tbsp'),(2,14,'2 tbsp'),(2,15,'2 tbsp'),(2,16,'2 tbsp + 1-2 cups'),(2,17,'1-2 tbsp'),(2,18,'1 tbsp'),(2,19,'1 clove, minced'),(2,20,'1 lb'),(2,21,'to taste'),(2,22,'2 packets'),(2,23,'1-2 cups, fresh'),(2,24,'1 tbsp'),(2,25,'1 tbsp'),(2,30,'1/4 cup'),(2,34,'3 tbsp'),(3,17,'2 tbsp'),(3,19,'1 clove, finely grated'),(3,23,'3 cups, cooked down'),(3,26,'2 tbsp'),(3,27,'2 tbsp'),(3,28,'1 1/2 cups, uncooked'),(3,29,'2, sliced into coins'),(3,30,'2 tbsp, sliced'),(3,33,'1-icnh piece, peeled and finely grated'),(3,34,'2 tbsp'),(3,36,'1 1/2 lb, thinly sliced'),(4,16,'1/4 cup'),(4,17,'1/3 cup'),(4,18,'1 tbsp'),(4,19,'3 cloves, thinly sliced or minced'),(4,26,'1 tbsp'),(4,27,'2 tbsp'),(4,28,'1 1/2 cups uncooked'),(4,30,'thinly sliced, for serving'),(4,31,'1 tbsp'),(4,32,'1 tbsp'),(4,33,'1-inch freshly peeled, grated or sliced'),(4,34,'1/4 cup'),(4,35,'1 head, cut into florets'),(4,37,'1 lb, thinly sliced');
/*!40000 ALTER TABLE `recipe_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `protein_type` varchar(50) NOT NULL,
  `instructions` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'Salmon Tacos with Mango Corn Salsa','Seafood','1. Preheat the oven to 425 degrees. Line a baking sheet with parchment paper. \n\n\n 2. Toss the salmon with the taco seasoning and avocado oil until well-coated – you can do this in a bowl or directly on the baking sheet. If your taco seasoning does not have salt, add some salt to the salmon.\n\n\n 3. Bake the salmon for 8 minutes, close to the top of the oven, or until it slips apart easily when pressed with a fork. \n\n\n 4. While the salmon is baking, chop up your salsa ingredients and toss together in a bowl. Season to taste.\n\n\n 5. To soften the corn tortillas, I usually heat up some oil in a large skillet and then give the tortilla a very quick one-sided dip into the hot oil and transfer to a paper-towel lined plate. I stack them up as I go so the heat and oil kind of distributes between all the tortillas. You can also wrap the tortillas in a few damp paper towels and microwave for 30 seconds to steam them so they become more pliable and yummy to eat. \n\n\n 6. Mash avocado or spread refried beans on the bottom of the tortilla. Add a couple pieces of salmon; press to gently smash them. Top with a big scoop of the salsa. I often finish these with lime squeezes and a drizzle of honey!'),(2,'Saucy Gochujang Noodles with Chicken','Chicken','1. Whisk soy sauce, gochujang, tomato paste, peanut butter, a little water, brown sugar, sesame oil, and garlic in a small bowl. It should form a thick sauce.\n\n\n 2. Cook the chicken in a large skillet over medium high heat. Season generously with salt and pepper. \n\n\n 3. Boil the noodles for just a few minutes to soften. Drain and set aside.\n\n\n 4. When the chicken is done, add spinach, cooked noodles, and sauce to the pan, keeping it over medium high heat. Toss to combine; heat until the spinach is wilted. Add extra water or broth to thin the sauce, a little at a time, to get the sauciness that you like (I usually add about 1 1/2 cups total). \n\n\n 5. Serve topped with fresh herbs, scallions, chili oil, sesame seeds, and whatever else you like.'),(3,'5 Ingredient Spicy Pork','Pork','1. Shake all the sauce ingredients in a jar. Pour the sauce over the pork and allow it to rest for 20 minutes – 1 hour.\n\n\n 2. Heat a good searing skillet (such as cast iron) over high heat. Add just a little bit of vegetable oil.\n\n\n 3. When the oil is hot and shiny, add the pork in a single layer (you may need to do this in batches). Cook, undisturbed, for 1-2 minutes until you are getting that nice caramelized look. Flip and repeat to finish.\n\n\n 4. Serve with rice and veggies.'),(4,'Sesame Beef and Broccoli','Beef','1. Freeze beef for 30 minutes – 1 hour for easier slicing. Slice against the grain, into very thin strips. Toss the beef strips with a generous pinch of coarse salt and let it rest while you prep everything else. (All of this is optional but recommended for flavor and texture.)\n\n\n 2. Whisk soy sauce, water, brown sugar, chili paste, rice vinegar, sesame oil, and cornstarch together.\n\n\n 3. Cook your rice according to package instructions.\n\n\n 4. Heat a large heavy skillet over medium heat. Add a swish of oil. Working in batches, add the beef in a single layer. Let rest, undisturbed, for a minute or two to achieve a nice browning on the meat. Flip each piece over and cook until browned. Remove beef from pan.\n\n\n 5. Add a swish of oil to the same pan. Add the broccoli; stir fry for 2-3 minutes, until bright green. (Sometimes I add a splash of water to steam it a little bit.) Remove broccoli from pan.\n\n\n 6. Turn the heat down and let the pan cool a bit. Add one last swish of oil. Add the ginger and garlic; sauté for 1-2 minutes. Add the sauce; stir until a thickened and sticky sauce forms. Add beef and broccoli back in. Toss gently to coat.\n\n\n 7. Serve with rice, thinly sliced green onions, and sesame seeds.');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-03  0:04:22
