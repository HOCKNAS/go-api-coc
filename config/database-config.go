package config

import (
	"fmt"
	"os"

	"github.com/joho/godotenv"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

// Configura la conexion con la base de datos
func SetupDatabaseConnection() *gorm.DB {

	errENV := godotenv.Load

	if errENV != nil {
		panic("No se pudo cargar el archivo .env")
	}

	dbName := os.Getenv("POSTGRES_DB")
	dbUser := os.Getenv("POSTGRES_USER")
	dbPass := os.Getenv("POSTGRES_PASSWORD")
	dbHost := os.Getenv("POSTGRES_HOST")
	dbPort := os.Getenv("POSTGRES_PORT")

	dsn := fmt.Sprintf("host=%s user=%s password=%s dbname=%s port=%s sslmode=disable TimeZone=America/Bogota", dbHost, dbUser, dbPass, dbName, dbPort)

	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})

	if err != nil {
		panic("Falló la conexión con la base de datos")
	}

	return db
}

// Cierra la conexion con la base de datos
func CloseDatabaseConection(db *gorm.DB) {

	dbPSQL, err := db.DB()

	if err != nil {
		panic("Fallo al momento de cerrar la conexión con la base de datos")
	}

	dbPSQL.Close()
}
