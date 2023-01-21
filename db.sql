CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "first_name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "phone" varchar(16) NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL
);

CREATE TABLE "user_addresses" (
  "id" uuid PRIMARY KEY,
  "address_line1" varchar NOT NULL,
  "address_line2" varchar,
  "city" varchar NOT NULL,
  "postal_code" int NOT NULL,
  "country" varchar NOT NULL,
  "user_id" uuid NOT NULL
);

CREATE TABLE "carts" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "total" money NOT NULL
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL
);

CREATE TABLE "products" (
  "id" uuid PRIMARY KEY,
  "user_id" uuid NOT NULL,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "brand" varchar NOT NULL,
  "price" money NOT NULL,
  "stock" int NOT NULL,
  "status" varchar DEFAULT 'active',
  "category_id" int NOT NULL
);

CREATE TABLE "product_imgs" (
  "id" uuid PRIMARY KEY,
  "img_url" varchar NOT NULL,
  "status" varchar DEFAULT 'active',
  "product_id" uuid NOT NULL
);

CREATE TABLE "cart_products" (
  "id" uuid PRIMARY KEY,
  "quantity" int NOT NULL,
  "cart_id" uuid NOT NULL,
  "product_id" uuid NOT NULL,
  "status" varchar DEFAULT 'active'
);

ALTER TABLE "user_addresses" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "product_imgs" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "cart_products" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "cart_products" ADD FOREIGN KEY ("cart_id") REFERENCES "carts" ("id");

ALTER TABLE "products" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "products" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "carts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");
