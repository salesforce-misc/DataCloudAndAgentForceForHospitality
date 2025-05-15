@isTest
global class AmadeusPriceAPIsMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json'); 
        res.setBody('{"message": "Success", "count": 3, "results": [' +
            '{"vin": "1HGCM82633A123451", "dateComplaintFiled": "2024-01-01", "components": "Brakes", "dateOfIncident": "2024-01-01", "summary": "Brake failure", "numberOfDeaths": 0, "fire": false, "crash": false, "numberOfInjuries": 1, "manufacturer": "Honda", "odiNumber": 111111},' +
            '{"vin": "1HGCM82633A123452", "dateComplaintFiled": "2024-01-02", "components": "Airbags", "dateOfIncident": "2024-01-02", "summary": "Airbag did not deploy", "numberOfDeaths": 0, "fire": false, "crash": false, "numberOfInjuries": 2, "manufacturer": "Honda", "odiNumber": 222222},' +
            '{"vin": "1HGCM82633A123453", "dateComplaintFiled": "2024-01-03", "components": "Engine", "dateOfIncident": "2024-01-03", "summary": "Engine overheating", "numberOfDeaths": 0, "fire": false, "crash": false, "numberOfInjuries": 0, "manufacturer": "Honda", "odiNumber": 333333}' +
        ']}');
        res.setStatusCode(200);
        return res;
    }
}