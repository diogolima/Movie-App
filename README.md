# Badi Coding Challenge - Backend (Ruby on Rails)
![Zombies at Badi](https://user-images.githubusercontent.com/4199523/33260366-e54216aa-d35f-11e7-8442-8d9e1cd67d88.jpg)

## The context
You are a scientist in a post-apocalyptic world. In your lab you have plenty of human tissues, yet not so many brains. For this reason, you decide to create zombies, which you then equip with armors and weapons. Why would you do that? Well, we cannot tell you. The only thing you need to know is that you are a crazy scientist playing on the edge of life and death.


## You can find this API
https://zombies-scientist.herokuapp.com/
All responses are in json format

## /zombies
Everything about zombies we can learn over here

### Index
Return all zombies in your inventory, so you can control your "stock"  
https://zombies-scientist.herokuapp.com/zombies  

-- Response:  
 --- Total of zombies  
 --- Zombies  

### Search
You can search your zombie over here, using the zombie id, weapons name or armor name  

-- Zombie id is an integer  
-- weapons name are string separated by ','  
-- armors name are string separated by ','  

-- Response:  
 --- Zombie id in params  
 --- weapons in params  
 --- armors in params  
 --- zombies found  


-- Example format:  
https://zombies-scientist.herokuapp.com/zombies/search/?id={zombie_id}weapons={weapon_name,weapon2_name}&armors={armor_name, armor2_name}


### Create
You can create your zombie but to do that you need send all parameters of the zombie.  
Are required: name, hit_points, brains_eaten, speed, turn_date  

-- Separate words with '+'. If name Mr Presley => name=Mr+Presley  
-- turn_date = DD-MM-YYYY  
-- <WEAPONS/ARMORS> => Separate each one by ','  
-- To create a zombie with no weapons/armors you have to send weapons/armors with blank values  
--  If weapons/armors are not present in url will add all weapons/armors to the zombie (Rambo zombie)  


-- Response:  
 --- zombie created  
 --- weapons of the zombie  
 --- armors of the zombie  
 --- message  


-- Example format:   /zombies/create?name=Diogo+Lima&hit_points=20&brains_eaten=20&speed=5&turn_date=17-01-2017&weapons=weapon&armohttps://zombies-scientist.herokuapp.comrs=armor,armor2


### Update
You can update your zombie, send all parameters you want to update.  

-- Zombie ID is required: ID >= 1  
-- All the others zombie params are optional, send them if you want to update  
-- Weapons are optional: if you want update weapons send all weapons names separated by ','  
-- Armors are option: if you want update armors send all armors names separated by ','  

-- Response:  
 --- Zombie updated  
 --- weapons of the zombie  
 --- armors of the zombie  
 --- message  


-- Example format:   https://zombies-scientist.herokuapp.com/zombies/update?id=<int>&name=<string>&hit_points=<int>&brains_eaten=<int>&speed=<int>&turn_date=<dd-mm-yyyy>&weapons=<string,string>&armors=<string, string>


### Delete
To delete a zombie you need to know his id  

-- Zombie ID is required to delete  


-- Response:  
 --- Message with killed zombie id   

-- Example format:  
 https://zombies-scientist.herokuapp.com/zombies/delete?id=<int>


## Armors
### Index
Return all armors in your inventory, so you can control your "stock"  
https://zombies-scientist.herokuapp.com/armors  


### Create
You can keep creating armors for your zombies to be protected from monsters  
https://zombies-scientist.herokuapp.com/armors/create/  

-- Required params:  
  --- name - string  
  --- defense_points - integer  
  --- durability - integer  
  --- price  

-- Response:  
 --- Armor created  
 --- message  

-- Example format:  
https://zombies-scientist.herokuapp.com/armors/create/?name=body+helmet&defense_points=10&durability=10&price=10

### Delete
If you have your armor stollen or destroyed you can delete from you inventory  
https://zombies-scientist.herokuapp.com/armors/delete/  

-- Required params:  
  --- id - integer  

-- Response:  
 --- armor destroyed  
 --- message  

-- Example format:  
https://zombies-scientist.herokuapp.com/armors/delete/?id=22  


## Weapons
### Index
Return all weapons in your inventory, so you can control your "stock"  
https://zombies-scientist.herokuapp.com/weapons  

### Create
You can keep creating weapons for your zombies to be attack some monsters  
https://zombies-scientist.herokuapp.com/weapons/create/  

-- Required params:  
  --- name - string  
  --- attack_points - integer  
  --- durability - integer  
  --- price  

-- Response:  
 --- weapon created  
 --- message  

-- Example format:  
https://zombies-scientist.herokuapp.com/weapons/create/?name=rock&attack_points=2&durability=30&price=1

### Delete
If you have your armor stollen or destroyed you can delete from you inventory  
https://zombies-scientist.herokuapp.com/armors/delete/  

-- Required params:  
  --- id - integer  

-- Response:  
 --- weapon destroyed  
 --- message  

-- Example format:  
https://zombies-scientist.herokuapp.com/armors/delete/?id=22
