db.createCollection('Employees', {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        title: 'Employees',
        required: ['Name', 'Surname', 'NIF', 'Phone', 'job'],
        properties: {
          Name: {
            bsonType: 'string'
          },
          Surname: {
            bsonType: 'string'
          },
          NIF: {
            bsonType: 'string'
          },
          Phone: {
            bsonType: 'string'
          },
          job: {
            enum: ['Cook', 'Delivery person']
          }
        }
      }
    }
  });