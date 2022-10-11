postgres:
	docker run --name pgalpine -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:alpine

createdb:
	docker exec -it pgalpine createdb --username=root --owner=root pickngo

dropdb: 
	docker exec -it pgalpine dropdb pickngo 

migrateup: 
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/pickngo?sslmode=disable" -verbose up 

migratedown: 
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/pickngo?sslmode=disable" -verbose down 

.PHONY: postgres createdb dropdb migrateup migratedown
