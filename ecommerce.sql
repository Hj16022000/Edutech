CREATE OR REPLACE FUNCTION increase_the_products()

	RETURNS TRIGGER
	LANGUAGE PLPGSQL
	as
	$$
	
		 BEGIN
		             IF (select COUNT(*) from products where productname=NEW.productname)>1 then
					 UPDATE products SET prodcount= prodcount+1 where productname = NEW.productname;
					 DELETE from products where productid= NEW.productid;
					 ELSE
					 UPDATE products SET prodcount= 1 where productid = NEW.productid;
					 END IF;
					 RETURN NEW;
		 END;
	$$
	
	
	-- creating trigger to increase count of specific product
CREATE TRIGGER increase_products_count    
 AFTER INSERT
 ON products
 FOR EACH ROW
     EXECUTE PROCEDURE increase_the_products();

    
	CREATE OR REPLACE FUNCTION decrease_the_products()

	RETURNS TRIGGER
	LANGUAGE PLPGSQL
	as
	$$
		 BEGIN        
		              UPDATE products SET prodcount= prodcount-1 where productid = NEW.prodid;
				      UPDATE orders set totalcost= (select price from products where productid=NEW.prodid)
					  where orderid=NEW.orderid;
					  RETURN NEW;
		 END;
	$$
	
	CREATE TRIGGER decrease_products_count    
 AFTER INSERT
 ON orders
 FOR EACH ROW
     EXECUTE PROCEDURE decrease_the_products();
