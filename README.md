# Mc-Donalds-Analytics

This is a mini-analysis for the McDonalds Menu Dataset on Kaggle.
The link for the dataset: [Link](https://www.kaggle.com/datasets/mcdonalds/nutrition-facts) 

# Table of Contents
- [Table Creation Commands](#table-creation-commands)
- [Analytics](#analytics)

# Table Creation Commands
````sql
CREATE TABLE mc_donalds_menu(
category varchar(100),
item varchar(100),
serving_size varchar(100),
	calories numeric,
	calories_from_fat numeric, 
	total_fat numeric,
	total_fat_daily numeric,
	saturated_fat numeric, 
	saturated_fat_daily numeric,
	trans_fat numeric,
	cholesterol numeric,
	cholesterol_daily numeric,
	sodium numeric,
	sodium_daily numeric,
	carbohydrates numeric,
	carbohydrates_daily numeric,
	dietary_fiber numeric,
	dietary_fiber_daily numeric,
	sugars numeric,
	protein numeric,
	vitamin_a_daily numeric,
	vitamin_c_daily numeric,
	calcium_daily numeric,
	iron_daily numeric
);

````

# Analytics

1. What is the average calorie content of items on the menu?
Query: 
````sql
SELECT round(avg(calories),2) from mc_donalds_menu;
````
Result:
| round | 
| --- |
| 368. 27 | 

2. Which category has the highest average calorie content?
Query:
````sql
SELECT category, calories from mc_donalds_menu where 
calories = (select max(calories) from mc_donalds_menu);
````
Result:
| category | calories |
| --- | --- |
| Chicken & Fish | 1880 |

3. What is the distribution of total fat content across different categories?
````sql
SELECT category, sum(total_fat) as total_fat_content from mc_donalds_menu 
group by category;
````
Result:
| category | total_fat_content |
| --- | --- |
| Salads | 70.5 |
| Breakfast | 1163 |
| Beef & Pork | 373 |
| Smoothies & Shakes | 395.5 |
| Desserts | 51.5 |
| Coffee & Tea | 762.0 |
| Beverages | 2.5 |
| Snacks & Sides | 137 |
| Chicken & Fish | 728 |

4. Are there any items with trans fat content? If yes, which items and what are their levels?
````sql
SELECT item, trans_fat from mc_donalds_menu
where trans_fat>0;
````
Result:
| item | trans_fat|
| --- | --- |
| Steak and Egg McMuffin | 1 |
| Steak and Egg Biscuit (Regular Biscuit) | 1 |
| Bacon, Egg and Cheese Bagel | 0.5 | 
| Bacon, Egg and Cheese Bagel with Egg Whites | 0.5 |
| Steak, Egg and Cheese Bagel | 1.5 |
| Big Mac | 1 |
| Quarter Pounder with Cheese | 1.5 |
| Quarter Pounder with Bacon and Cheese | 1.5 |
| Quarter Pounder with Bacon Habanero Ranch | 1.5 |
| Quarter Pounder Deluxe | 1.5 | 
| Double Quarter Pounder with Cheese | 2.5 |
| Cheeseburger | 0.5 |
| Double Cheseburger | 1 |
| Bacon Clubhouse Burger | 1.5 |
| McDouble | 1 |
| Bacon McDouble | 1.5 |
| Daily Double | 1 |
| Jalapeno Double | 1 |
| Bacon Clubhouse Crispy Chicken Sandwich | 0.5 |
| Premium McWrap Chicken and Bacon (Crispy Chicken | 0.5 | 
| Premium McWrap Chicken and Ranch (Crispy Chicken) | 0.5 |
| Premium McWrap Chicken & Ranch (Grilled Chicken) | 0.5 |
| Premium McWrap Southwest Chicken (Crispy Chicken) | 0.5 | 
| Chicken McNuggets (40 piece) | 1 |
| Mocha (Large) | 0.5 |
| Caramel Mocha (Medium) | 0.5 |
| Caramel Mocha (Large) | 0.5 |
| Hot Chocolate (Medium) | 0.5 |
| Hot Chocolate (Large) | 0.5 |
| Iced Mocha (Large) | 0.5 |
| Iced Caramel Mocha (Large) | 0.5 |
| Frappe Mocha (Small) | 1 |
| Frappe Mocha (Medium) | 1 |
| Frappe Mocha (Large) | 1 |
| Frappe Caramel (Small) | 1 |
| Frappe Caramel (Medium) | 1 |
| Frappe Caramel (Large) | 1 |
| Frappe Chocolate Chip (Small) | 1 |
| Frappe Chocolate Chip (Medium) | 1 |
| Frappe Chocolate Chip (Large) | 1 |
| Vanilla Shake (Small) | 1 |
| Vanilla Shake (Medium) | 1 |
| Vanilla Shake (Large) | 1 |
| Strawberry Shake (Small) | 1 |
| Strawberry Shake (Medium) | 1 |
| Strawberry Shake (Large) | 1 |
| Chocolate Shake (Small) | 1 |
| Chocolate Shake (Medium) | 1 |
| Chocolate Shake (Large) | 1 |
| Shamrock Shake (Medium) | 1 |
| Shamrock Shake (Large) | 1 |
| McFlurry with M&M's Candies (Small) | 0.5 |
| McFlurry with M&M's Candies (Medium) | 1 |
| McFlurry with Oreo Cookies (Small) | 0.5 |
| McFlurry with Oreo Cookies (Medium) | 1 |
| McFlurry with Reese's Peanut Butter Cups (Medium) | 1 | 

5. How does the sodium content vary across different categories?
````sql
SELECT category, round(avg(sodium),2) as avg_sodium from mc_donalds_menu
group by category;
````
Result:
| category | avg_sodium |
| Salads | 588.33 |
| Breakfast | 1211.07 |
| Beef and Pork | 1020.67 |
| Smoothies and Shakes | 183.57 |
| Desserts | 117.14 |
| Coffee and Tea | 136.89 |
| Beverages | 41.48 |
| Snacks and Sides | 395.77 |
| Chicken and Fish | 1257.78 |

6. Which item has the highest cholesterol content?
````sql
SELECT item, cholesterol from mc_donalds_menu 
where (cholesterol =(select max(cholesterol) from mc_donalds_menu));
````
Result:
| item | cholesterol |
| --- | --- |
| Big Breakfast with Hotcakes (Regular Biscuit) | 575 |
| Big Breakfast with Hotcakes (Large Biscuit) | 575 |

7. Which menu item provides the highest amount of protein?
````sql
SELECT item, protein from mc_donalds_menu 
where (protein = (select max(protein) from mc_donalds_menu));
````
Result:
| item | protein |
| --- | --- |
| Chicken McNuggets (40 piece) | 87 |

8. How does the dietary fiber content vary across different categories?
````sql
SELECT category, round(avg(dietary_fiber),2) as avg_fiber from mc_donalds_menu 
group by category;
````
Result:
| category | avg_fiber |
| --- | --- |
| Salads | 4.50 |
| Breakfast | 3.26 |
| Beef and Pork | 2.53 |
| Smoothies and Shakes | 1.46 |
| Desserts | 1.00 |
| Coffee and Tea | 0.78 |
| Beverages | 0.04 |
| Snacks and Sides | 1.54 |
| Chicken and Fish | 2.93 |

9. How does the sugar content vary across different categories?
````sql
SELECT category, round(avg(sugars),2) as avg_sugar from mc_donalds_menu
group by category;
````
Result:
| category | avg_sugar |
| --- | --- |
| Salads | 6.83 |
| Breakfast | 8.26 |
| Beef and Pork | 8.80 |
| Smoothies and Shakes | 77.89 |
| Desserts | 26.14 |
| Coffee and Tea | 39.61 |
| Beverages | 27.85 |
| Snacks and Sides | 4.08 |
| Chicken and Fish | 7.33 |

10. Which menu item provides the highest amount of vitamin C?
````sql
SELECT item, vitamin_c_daily from mc_donalds_menu
where vitamin_c_daily = (select max(vitamin_c_daily) from mc_donalds_menu);
````
Result:
| item | vitamin_c_daily |
| --- |--- |
| Minute Maid Orange Juice (Large) | 240 |


