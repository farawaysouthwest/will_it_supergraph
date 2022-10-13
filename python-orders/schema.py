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
    if root == None:
        return testOrders
    
    result = []
    for order in testOrders:
        if order.userId == root.id:
            result.append(order)
#######################


@strawberry.federation.type(extend=True, keys=["id"])
class User:
    id: strawberry.ID = strawberry.federation.field(external=True)
    orders: typing.List[Order] =strawberry.field(resolver= get_orders)
    @classmethod
    def resolve_reference(cls, id: strawberry.ID):
        return User(id=id)

@strawberry.type
class Query:
    all_orders: typing.List[Order] = strawberry.field(resolver= get_orders)

schema = strawberry.federation.Schema(query=Query, types=[User])


