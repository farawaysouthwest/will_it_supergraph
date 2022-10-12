package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"accounts/graph/data"
	"accounts/graph/generated"
	"accounts/graph/model"
	"context"
)

// Account is the resolver for the account field.
func (r *userResolver) Account(ctx context.Context, obj *model.User) (*model.Account, error) {
	return data.GetSingleAccount(obj.ID), nil
}

// User returns generated.UserResolver implementation.
func (r *Resolver) User() generated.UserResolver { return &userResolver{r} }

type userResolver struct{ *Resolver }
