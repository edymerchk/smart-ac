### Report Creation

#### Endpoint

```
 /api/v1/reports


```

#### HTTP method
```
POST
```

#### Request

##### Header
```
Accept: application/vnd.api+json
Authorization: DEVICE_TOKEN
```

##### Payload Sample
```json
{
   "data":{
      "type":"reports",
      "attributes":{
         "device_id":1231435,
         "temperature":3.10,
         "air_humidity":10,
         "carbon_monoxide_level":4.5,
         "health_status":"good",
         "taken_at":1565730400
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
      "id":"51",
      "type":"reports",
      "attributes":{
         "temperature":"3.1",
         "air_humidity":10,
         "carbon_monoxide_level":"4.5",
         "health_status":"good",
         "taken_at":"2019-08-13T21:07:19.000Z"
      }
   },
   "jsonapi":{
      "version":"1.0"
   }
}```
   ```
