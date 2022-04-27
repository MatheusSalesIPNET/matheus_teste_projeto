connection: "ecommerce-dataset"

# include all the views
include: "/views/**/*.view"

datagroup: looker_training_ecommerce_default_datagroup {
  sql_trigger: SELECT MAX(order_id) FROM `ipnet-bi-dev.ecommerce_dataset.orders`;;
  max_cache_age: "24 hour"
  description: "Datagroup para atualização de cachê baseado no order_id da tabela orders"
}

persist_with: looker_training_ecommerce_default_datagroup

explore: orders {

  label: "E-commerce Database"

  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.id} ;;
    relationship: many_to_one
  }

  join: order_items {
    type: inner
    sql_on: ${orders.id} = ${order_items.order_id} ;;
    relationship: one_to_many
  }

  # join: products {
  #   type: left_outer
  #   sql_on: ${products.id} = ${order_items.product_id} ;;
  #   relationship: many_to_one
  # }

  # join: sellers {
  #   type: left_outer
  #   sql_on: ${sellers.id} = ${order_items.seller_id} ;;
  #   relationship: many_to_one
  # }

  join: order_reviews {
    type: left_outer
    sql_on: ${order_reviews.order_id} = ${orders.id} ;;
    relationship: one_to_many
  }

  join: order_payment {
    type: left_outer
    sql_on: ${order_payment.order_id} = ${orders.id} ;;
    relationship: one_to_many
  }
}


# explore: customers {}

# explore: order_reviews {
#   join: orders {
#     type: left_outer
#     sql_on: ${order_reviews.order_id} = ${orders.id} ;;
#     relationship: many_to_one
#   }

#   join: customers {
#     type: left_outer
#     sql_on: ${orders.customer_id} = ${customers.id} ;;
#     relationship: many_to_one
#   }
# }


# explore: products {}

# explore: order_items {
#   join: products {
#     type: left_outer
#     sql_on: ${order_items.product_id} = ${products.product_id} ;;
#     relationship: many_to_one
#   }

#   join: orders {
#     type: left_outer
#     sql_on: ${order_items.order_id} = ${orders.order_id} ;;
#     relationship: many_to_one
#   }

#   join: sellers {
#     type: left_outer
#     sql_on: ${order_items.seller_id} = ${sellers.seller_id} ;;
#     relationship: many_to_one
#   }

#   join: customers {
#     type: left_outer
#     sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: order_payment {
#   join: orders {
#     type: left_outer
#     sql_on: ${order_payment.order_id} = ${orders.order_id} ;;
#     relationship: many_to_one
#   }

#   join: customers {
#     type: left_outer
#     sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
#     relationship: many_to_one
#   }
# }

# explore: geolocation {}

# explore: sellers {}
