db.createCollection('Customer', {
  validator: {
    $jsonSchema: {
      bsonType: 'object',
      title: 'Customer',
      required: ['Customer_name', 'Customer_surname', 'Data'],
      properties: {
        Customer_name: {
          bsonType: 'string'
        },
        Customer_surname: {
          bsonType: 'string'
        },
        Data: {
          bsonType: 'object',
          title: 'object',
          required: ['Adress', 'Telephone', 'Email', 'Register_Date'],
          properties: {
            Adress: {
              bsonType: 'object',
              title: 'object',
              required: ['Street', 'Num', 'City', 'Zip_Code'],
              properties: {
                Street: {
                  bsonType: 'string'
                },
                Num: {
                  bsonType: 'int'
                },
                Floor: {
                  bsonType: 'int'
                },
                Door: {
                  bsonType: 'int'
                },
                City: {
                  bsonType: 'int'
                },
                Zip_Code: {
                  bsonType: 'int'
                }
              }
            },
            Telephone: {
              bsonType: 'string'
            },
            Email: {
              bsonType: 'string'
            },
            Register_Date: {
              bsonType: 'date'
            },
            Recommended_By: {
              bsonType: 'string'
            }
          }
        },
        Lasts_Shopings: {
          bsonType: 'object',
          title: 'object',
          required: ['Glasses', 'Order_Date', 'Employee'],
          properties: {
            Glasses: {
              bsonType: 'object',
              title: 'object',
              required: ['Brand', 'Frame_type', 'Price'],
              properties: {
                Brand: {
                  bsonType: 'string'
                },
                Graduation: {
                  bsonType: 'object',
                  title: 'object',
                  properties: {
                    L: {
                      bsonType: 'int'
                    },
                    R: {
                      bsonType: 'int'
                    }
                  }
                },
                Glass_color: {
                  bsonType: 'object',
                  title: 'object',
                  properties: {
                    L: {
                      bsonType: 'string'
                    },
                    R: {
                      bsonType: 'string'
                    }
                  }
                },
                Frame_type: {
                  enum: ['Metalic', 'Plastic', 'Floating']
                },
                Price: {
                  bsonType: 'double'
                }
              }
            },
            Order_Date: {
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