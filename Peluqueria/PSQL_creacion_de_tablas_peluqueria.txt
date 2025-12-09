camper@codespaces-784577:/workspace/project$ psql --username=freecodecamp --dbname=postgres
psql (12.22 (Ubuntu 12.22-0ubuntu0.20.04.4))
Type "help" for help.

postgres=> CREATE DATABASE salon;
CREATE DATABASE
postgres=> \c salon
You are now connected to database "salon" as user "freecodecamp".
salon=> CREATE TABLE customers(  customer_id SERIAL PRIMARY KEY,  name VARCHAR(50),  phone VARCHAR(15) UNIQUE);
CREATE TABLE
salon=> CREATE TABLE services(  service_id SERIAL PRIMARY KEY,  name VARCHAR(50));
CREATE TABLE
salon=> CREATE TABLE appointments(  appointment_id SERIAL PRIMARY KEY,  customer_id INT REFERENCES customers(customer_id),  service_id INT REFERENCES services(service_id),  time VARCHAR(50));
CREATE TABLE
salon=> INSERT INTO services(name) VALUES('cut');
INSERT 0 1
salon=> INSERT INTO services(name) VALUES('color');
INSERT 0 1
salon=> INSERT INTO services(name) VALUES('style');
INSERT 0 1
salon=> \d
                         List of relations
 Schema |              Name               |   Type   |    Owner     
--------+---------------------------------+----------+--------------
 public | appointments                    | table    | freecodecamp
 public | appointments_appointment_id_seq | sequence | freecodecamp
 public | customers                       | table    | freecodecamp
 public | customers_customer_id_seq       | sequence | freecodecamp
 public | services                        | table    | freecodecamp
 public | services_service_id_seq         | sequence | freecodecamp
(6 rows)

salon=> \d appointments
                                             Table "public.appointments"
     Column     |         Type          | Collation | Nullable |                       Default                        
----------------+-----------------------+-----------+----------+------------------------------------------------------
 appointment_id | integer               |           | not null | nextval('appointments_appointment_id_seq'::regclass)
 customer_id    | integer               |           |          | 
 service_id     | integer               |           |          | 
 time           | character varying(50) |           |          | 
Indexes:
    "appointments_pkey" PRIMARY KEY, btree (appointment_id)
Foreign-key constraints:
    "appointments_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    "appointments_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(service_id)

salon=> \d customers
                                          Table "public.customers"
   Column    |         Type          | Collation | Nullable |                    Default                     
-------------+-----------------------+-----------+----------+------------------------------------------------
 customer_id | integer               |           | not null | nextval('customers_customer_id_seq'::regclass)
 name        | character varying(50) |           |          | 
 phone       | character varying(15) |           |          | 
Indexes:
    "customers_pkey" PRIMARY KEY, btree (customer_id)
    "customers_phone_key" UNIQUE CONSTRAINT, btree (phone)
Referenced by:
    TABLE "appointments" CONSTRAINT "appointments_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id)

salon=> \d services
                                         Table "public.services"
   Column   |         Type          | Collation | Nullable |                   Default                    
------------+-----------------------+-----------+----------+----------------------------------------------
 service_id | integer               |           | not null | nextval('services_service_id_seq'::regclass)
 name       | character varying(50) |           |          | 
Indexes:
    "services_pkey" PRIMARY KEY, btree (service_id)
Referenced by:
    TABLE "appointments" CONSTRAINT "appointments_service_id_fkey" FOREIGN KEY (service_id) REFERENCES services(service_id)

salon=> 