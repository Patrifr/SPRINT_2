db.createCollection('Order', {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        title: 'Order',
        required: ['Date', 'Delivery_type', 'Customer_data', 'Products', 'Total_Price', 'Shop_id'],
        properties: {
          Date: {
            bsonType: 'timestamp'
          },
          Delivery_type: {
            enum: ['Delivery', 'Shop']
          },
          Customer_data: {
            bsonType: 'object',
            title: 'object',
            required: ['Name', 'Surname', 'Adress', 'Zip_code', 'Locality', 'Province', 'Phone'],
            properties: {
              Name: {
                bsonType: 'string'
              },
              Surname: {
                bsonType: 'string'
              },
              Adress: {
                bsonType: 'object',
                title: 'object',
                required: ['Street', 'Num'],
                properties: {
                  Street: {
                    bsonType: 'string'
                  },
                  Num: {
                    bsonType: 'int'
                  },
                  Floor: {
                    bsonType: 'string'
                  },
                  Door: {
                    bsonType: 'string'
                  }
                }
              },
              Zip_code: {
                bsonType: 'int'
              },
              Locality: {
                bsonType: 'string'
              },
              Province: {
                bsonType: 'string'
              },
              Phone: {
                bsonType: 'string'
              }
            }
          },
          Products: {
            bsonType: 'object',
            title: 'object',
            properties: {
              Pizzas: {
                bsonType: 'int'
              },
              burgers: {
                bsonType: 'int'
              },
              Drinks: {
                bsonType: 'int'
              }
            }
          },
          Total_Price: {
            bsonType: 'double'
          },
          Aditional_Note: {
            bsonType: 'string'
          },
          Shop_id: {
            bsonType: 'int'
          },
          Delivery: {
            bsonType: 'object',
            title: 'object',
            properties: {
              Employee_id: {
                bsonType: 'int'
              },
              Order_Delivered_date: {
                bsonType: 'date'
              }
            }
          }
        }
      }
    }
  });