### Register Device

#### Endpoint

```
 /api/v1/devices
```

#### HTTP method
```
POST
```

#### Request

##### Header
```
Accept: application/vnd.api+json
```

##### Payload Sample
```json
{
   "data":{
      "type":"devices",
      "attributes":{
         "serial_number":"sample-serial-number",
         "firmware_version":"v1"
      }
   }
}
```

### Response

#### Header
```
Content-type: application/vnd.api+json
```

#### Success

##### HTTP status code
```
201
```

##### Payload
```json
{
   "data":{
      "id":"92",
      "type":"devices",
      "attributes":{
         "serial_number":"sample-serial-number",
         "firmware_version":"v1",
         "token": "Zr5JGSpkg0xaH2sZIZokTQ"
      }
   },
   "jsonapi":{
      "version":"1.0"
   }
}
```
