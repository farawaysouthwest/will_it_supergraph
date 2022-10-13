package data

import (
	"accounts/graph/model"
	"log"
)

var accounts = []*model.Account{
	{
		ID: "100",
		UserID: "1",
		Balance: 12,
	},
		{
		ID: "200",
		UserID: "2",
		Balance: 12525,
	},
}

func GetSingleAccount(userId string) *model.Account {

var result *model.Account

	for _, account := range accounts {
		
		log.Print(userId)

		if account.UserID == userId {
			result = account
			break
		}
	}
	return result
}