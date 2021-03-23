import ballerina/websub;

listener websub:Listener webSubListener = new (8181);

@websub:SubscriberServiceConfig {
    target: "http://localhost:9090/ordermgt/order",
    leaseSeconds: 3600,
    secret: "Kslk30SNF2AChs2"
}
service websub:SubscriberService /ordereventsubscriber on webSubListener {
    remote function onNotification() {
        _ = foo();
    }
}

function foo() returns string {
    return "Hello";
}