package main

import (
	"context"
	"database/sql"
	"log"
	db "pickngo/db/sqlc"

	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
)

var conn *sql.DB

func main() {
	ctx := context.Background()

	var err error
	conn, err = sql.Open("postgres", "postgresql://root:secret@localhost:5432/pickngo?sslmode=disable")
	if err != nil {
		log.Fatal(err)
	}

	queries := db.New(conn)

	if err = conn.Ping(); err != nil {
		conn.Close()
	}

	r := gin.Default()
	r.GET("/users", queries.GetUsers)
	r.Run()
}
