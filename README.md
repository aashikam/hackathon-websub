# hackathon-websub

The goal is to use all three WebSub components (publisher, hub and subscriber). 
- The publisher would periodically check for updates for 2 or more subjects and notify the hub when there is a new update - the JSON payload would have a key indicating the subject 
- The hub would accept content updates from the publisher and allow the subscribers to subscribe to topics
- The subscriber would be a custom WebSub subscriber with a resource function for each of the possible subjects 