db.createCollection('Burgers', {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        title: 'Burgers',
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