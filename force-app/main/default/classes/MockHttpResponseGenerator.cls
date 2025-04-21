public class MockHttpResponseGenerator implements HttpCalloutMock {
    public HttpResponse response;
    
    public MockHttpResponseGenerator(HttpResponse response) {
        this.response = response;
    }
     public HttpResponse respond(HttpRequest req) {
        return response;
    }
}