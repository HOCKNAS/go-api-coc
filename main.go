package main

import (
	"github.com/HOCKNAS/go-api-coc/routes"
	"github.com/gin-gonic/gin"
)

func main() {

	r := gin.New()

	r.Use(gin.Logger())

	r.Use(gin.Recovery())

	users := r.Group("/users")

	users.POST("/register", routes.RegisterUser)

	r.Run("3000")

}
