public with sharing class CheckWeather {
    @InvocableMethod(
        label='Check Weather'
        description='Check weather at Sunshine Trail Resorts at a specific date. The date must be in the future, not today or earlier.'
    )
    public static List<WeatherResponse> getWeather(
        List<WeatherRequest> requests
    ) {
        // Retrieve the date for which we want to check the weather
        Datetime dateToCheck = (Datetime) requests[0].dateToCheck;

        WeatherService.Weather weather = WeatherService.getResortWeather(
            dateToCheck
        );

        // Create the response for the agent
        WeatherResponse response = new WeatherResponse();
        response.minTemperature = weather.minTemperatureC;
        response.maxTemperature = weather.maxTemperatureC;
        response.dayCondition = weather.condition;
        response.temperatureDescription =
            'Temperatures will be between ' +
            weather.minTemperatureC +
            '°C (' +
            weather.minTemperatureF +
            '°F) and ' +
            weather.maxTemperatureC +
            '°C (' +
            weather.maxTemperatureF +
            '°F) '+
            ' condition will be '+weather.condition+' at Sunshine Trails Resorts.';
        return new List<WeatherResponse>{ response };
    }

    public class WeatherRequest {
        @InvocableVariable(
            required=true
            description='Date for which we want to check the temperature. The variable needs to be an Apex Date type with format yyyy-MM-dd.'
        )
        public Date dateToCheck;
    }

    public class WeatherResponse {
        @InvocableVariable(
            description='Minimum temperature in Celsius at Sunshine Trail Resorts location for the provided date'
        )
        public Decimal minTemperature;
        @InvocableVariable(
            description='Maximum temperature in Celsius at Sunshine Trail Resorts location for the provided date'
        )
        public Decimal maxTemperature;
        
        @InvocableVariable(
            description='Description of temperatures at Sunshine Trail Resorts location for the provided date'
        )
        public String temperatureDescription;
        
         @InvocableVariable(
            description='Description of Day Condition at Sunshine Trail Resorts location for the provided date'
        )
        public String dayCondition;
    }
}