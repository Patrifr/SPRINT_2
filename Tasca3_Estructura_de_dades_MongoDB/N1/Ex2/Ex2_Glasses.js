db.createCollection('Glasses', {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        title: 'Glasses',
        required: ['Brand', 'Frame', 'Provided_by', 'Price', 'Bought_by'],
        properties: {
          Brand: {
            bsonType: 'string'
          },
          Frame: {
            enum: ['Metalic', 'Plastic', 'Flotant']
          },
          Provided_by: {
            bsonType: 'int'
          },
          Price: {
            bsonType: 'double'
          },
          Bought_by: {
            bsonType: 'object',
            title: 'object',
            required: ['Customer_id', 'Order_date', 'Employee'],
            properties: {
              Customer_id: {
                bsonType: 'int'
              },
              Order_date: {
                bsonType: 'date'
              },
              Employee: {
                bsonType: 'string'
              }
            }
          }
        }
      }
    }
  });