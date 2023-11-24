class Requests
    def registerPost (firstname, lastname, username, password)
        response = ForwardCar.post('/register',  body: {
    
        "firstname": firstname, 
        "lastname": lastname, 
        "username": username, 
        "password": password
    
    }.to_json)  
    end

    def loginPost (username,password)
        ForwardCar.post('/login', body: {
        "username": username,
        "password": password    
    }.to_json)      
    end

    def cadastraVeiculoPost (price, mileage, owners, modelYear,color, carTrim, engine, transmission,vin)
        ForwardCar.post('/carShop/cars', body: {
            "dealer": {
              "class": "com.ca.lisa.demo.CarDealer",
              "id": 4,
              "address": "1673 Blake Rd",
              "city": "Aurora",
              "name": "Aurora Acura",
              "state": "CO",
              "telephone": "303-955-0134",
              "website": "www.aurora_acura.com",
              "zip": "80203"
            },
            "model": {
              "class": "com.ca.lisa.demo.CarModel",
              "id": 5,
              "fuelType": "Gas",
              "make": {
                "class": "com.ca.lisa.demo.CarMake",
                "id": 1,
                "name": "Acura"
              },
              "modelYear": 1996,
              "name": "TL-AWD",
              "subName": "SH-AWD",
              "type": {
                "class": "com.ca.lisa.demo.CarType",
                "id": 7,
                "name": "Sedan"
              }
            },
            "stockNumber": "2",
            "price": price,
            "milage": mileage,
            "owners": owners,
            "modelYear": modelYear,
            "color": color,
            "carTrim": carTrim,
            "engine": engine,
            "transmission": transmission,
            "vin": vin,
            "options": "no",
            "image1": "dewdwef",
            "image2": "wefew"
          }.to_json
          )      
    end
    def consultaVeiculoGet
        ForwardCar.get('/carShop/cars')
    end
end