import ballerina/websub;
import ballerina/io;

@websub:SubscriberServiceConfig {
    target: ["https://api.github.com/hub", "https://github.com/<org>/<repo>/events/push.json"],
    secret: "something",
    callback: "something",
    httpConfig: {auth: {token: "authtoken"}}
}
service /subscriber on new websub:Listener(9090) {
    remote function onEventNotification(websub:ContentDistributionMessage event) returns error? {
        var retrievedContent = event.content;
        if (retrievedContent is json) {
            if (retrievedContent.zen is string) {
                int hookId = check retrievedContent.id;
                int senderId = check retrievedContent.sender.id;
                io:println(string`PingEvent received for webhook [${hookId}]`);
                
            } else {
                string repositoryName = 
                            check retrievedContent.repository.name;
                string lastUpdatedTime = 
                            check retrievedContent.repository.updated_at;
                io:println(string`PushEvent received for [${repositoryName}]`);
                io:println(string`Last updated at ${lastUpdatedTime}`);
            }
        } else {
            io:println("Unrecognized content type, hence ignoring");
        }
    }
}
