package routes

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func RegisterUser(c *gin.Context) {

	c.JSON(http.StatusOK, gin.H{
		"message": "register",
	})
}
