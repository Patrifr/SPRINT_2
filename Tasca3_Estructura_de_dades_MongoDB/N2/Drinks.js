db.createCollection('Drinks', {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        title: 'Drinks',
        required: ['Name', 'Description', 'Image', 'Price'],
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
          Price: {
            bsonType: 'double'
          }
        }
      }
    }
  });