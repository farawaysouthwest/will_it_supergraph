package graph

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.

import (
	"context"
	data "go_fed/graph/data"
	"go_fed/graph/generated"
	"go_fed/graph/model"
)

// AllUsers is the resolver for the all_users field.
func (r *queryResolver) AllUsers(ctx context.Context) ([]*model.User, error) {
	return data.GetAllUsers(), nil
}

// Query returns generated.QueryResolver implementation.
func (r *Resolver) Query() generated.QueryResolver { return &queryResolver{r} }

type queryResolver struct{ *Resolver }
