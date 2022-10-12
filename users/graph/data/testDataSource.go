package graph

import "go_fed/graph/model"

var testUsers = []*model.User{
		{ID: "1", Name: "test1"},
		{ID: "2", Name: "test2"},
}

func GetAllUsers() []*model.User {
	return testUsers
}

func GetSingleUser(id string) *model.User {

	var returnUser *model.User
	
	for _, user := range testUsers {
		if user.ID == returnUser.ID {
			returnUser = user
			break
		}
	}
	return returnUser
}