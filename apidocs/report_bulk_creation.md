### Report Bulk Creation

#### Endpoint

```
 /api/v1/reports/create_bulk

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
   "data":[
      {
         "type":"reports",
         "attributes":{
            "device_id":1231435,
            "temperature":3.10,
            "air_humidity":10,
            "carbon_monoxide_level":4.5,
            "health_status":"good",
            "taken_at":1565730400
         }
      },
      {
         "type":"reports",
         "attributes":{
            "device_id":3453534,
            "temperature":1.10,
            "air_humidity":9,
            "carbon_monoxide_level":3.5,
            "health_status":"needs_service",
            "taken_at":1565710400
         }
      }
   ]
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
```text
""
```
