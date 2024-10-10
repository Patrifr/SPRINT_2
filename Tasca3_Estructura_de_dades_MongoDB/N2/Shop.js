db.createCollection('Shop', {
    validator: {
      $jsonSchema: {
        bsonType: 'object',
        title: 'Shop',
        required: ['Adress', 'Zip_code', 'Locality', 'Province', 'Employee_id'],
        properties: {
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
          Employee_id: {
            bsonType: 'int'
          }
        }
      }
    }
  });