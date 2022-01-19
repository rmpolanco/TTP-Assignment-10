CREATE DATABASE "Car Database"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
    
    
    
    CREATE TABLE IF NOT EXISTS public."Car"
(
    "carID" integer NOT NULL,
    brand character varying(20) COLLATE pg_catalog."default",
    model_year integer,
    model character varying(20) COLLATE pg_catalog."default",
    color character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT "Car_pkey" PRIMARY KEY ("carID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Car"
    OWNER to postgres;
    
    
    
    CREATE TABLE IF NOT EXISTS public."Dealer"
(
    brand character varying(20) COLLATE pg_catalog."default" NOT NULL,
    location character varying(30) COLLATE pg_catalog."default",
    "vehicleType" character varying(20) COLLATE pg_catalog."default",
    revenue bigint,
    employees integer,
    CONSTRAINT "Dealer_pkey" PRIMARY KEY (brand)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Dealer"
    OWNER to postgres;
    
    
    
    CREATE TABLE IF NOT EXISTS public."Owner"
(
    "ownerID" integer NOT NULL,
    "carID" integer,
    "DOB" date,
    gender "char",
    "phoneNum" character varying(30) COLLATE pg_catalog."default",
    address character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT "Owner_pkey" PRIMARY KEY ("ownerID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Owner"
    OWNER to postgres;
    
    
    
    CREATE TABLE IF NOT EXISTS public."Purchase"
(
    "purchaseID" integer,
    "carID" integer,
    "ownerID" integer,
    brand character varying(20) COLLATE pg_catalog."default",
    cost integer,
    type character varying(30) COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Purchase"
    OWNER to postgres;
