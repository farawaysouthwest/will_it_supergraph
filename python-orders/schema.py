import typing
import strawberry

@strawberry.type
class Order:
    id: strawberry.ID
    userId: str

######################
## orders resolver ###
testOrders = [
    Order(
        id='111',
        userId='1'
    ),
    Order(
        id='112',
        userId='1'
    ),
    Order(
        id='222',
        userId='2'
    )
]

def get_orders(root: 'User') -> typing.List[Order]:
        return testOrders


def get_user_order(root: 'User') -> typing.List[Order]:
    result = []
    for order in testOrders:
        if order.userId == root.id:
            print(order)
            result.append(order)
    return result
#######################


@strawberry.federation.type(keys=["id"])
class User:
    id: strawberry.ID
    orders: typing.List[Order] =strawberry.field(resolver= get_user_order)
    @classmethod
    def resolve_reference(cls, id: strawberry.ID):
        return User(id=id)

@strawberry.type
class Query:
    all_orders: typing.List[Order] = strawberry.field(resolver= get_orders)

schema = strawberry.federation.Schema(query=Query, types=[User, Order], enable_federation_2=True)


