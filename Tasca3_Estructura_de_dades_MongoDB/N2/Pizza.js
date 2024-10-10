db.createCollection('Pizzas', {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        title: 'Pizzas',
        required: ['Name', 'Description', 'Image', 'Category', 'Price'],
        properties: {
          Name: {
            bsonType: 'string'
          },
          Description: {
            bsonType: 'string'
          },
          Image: {
            bsonType: 'string'
          },
          Category: {
            enum: ['Margherita', 'Vegetarian', 'Pepperoni']
          },
          Price: {
            bsonType: 'double'
          }
        }
      }
    }
  });