CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "username" varchar UNIQUE NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "user_type" varchar NOT NULL,
  "created_at" timestamptz DEFAULT (now())
);

CREATE TABLE "products" (
  "id" SERIAL PRIMARY KEY,
  "user_id" bigint NOT NULL,
  "name" varchar NOT NULL,
  "description" varchar,
  "price" decimal NOT NULL,
  "volume" decimal NOT NULL,
  "unit" varchar NOT NULL,
  "stock" int NOT NULL,
  "sold" int NOT NULL,
  "created_at" timestamptz DEFAULT (now())
);

CREATE TABLE "cart" (
  "id" SERIAL PRIMARY KEY,
  "user_id" bigint NOT NULL,
  "product_id" bigint NOT NULL,
  "quantity" int NOT NULL,
  "created_at" timestamptz DEFAULT (now())
);

CREATE TABLE "feed" (
  "id" SERIAL PRIMARY KEY,
  "user_id" bigint NOT NULL,
  "title" varchar NOT NULL,
  "caption" varchar NOT NULL,
  "created_at" timestamptz DEFAULT (now())
);

CREATE INDEX ON "users" ("id", "username");

CREATE INDEX ON "products" ("id", "name", "price");

ALTER TABLE "products" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "cart" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "cart" ADD FOREIGN KEY ("product_id") REFERENCES "products" ("id");

ALTER TABLE "feed" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

