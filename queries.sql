/* What is the average calorie content of items on the menu? */
SELECT round(avg(calories),2) from mc_donalds_menu;

/* Which category has the highest average calorie content? */
SELECT category, calories from mc_donalds_menu where 
calories = (select max(calories) from mc_donalds_menu)