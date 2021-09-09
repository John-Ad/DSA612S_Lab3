import ballerina/io;

usersClient ep = check new ("http://localhost:9090");

public function main() {
    io:println("Testing grpc service");

    io:println("\nTesting createUser");
    json|error res = ep->createUser({username: "john", lastname: "adriaans", firstname: "john", email: "adr@gmail.com"});
    io:println(res);

    io:println("\nTesting getUser");
    res = ep->getUser({username: "john"});
    io:println("response:", res);

    io:println("\nTesting updateUser");
    res = ep->updateUser({username: "john"});
    io:println("response:", res);

    io:println("\nTesting updateUser");
    res = ep->updateUser({username: "john"});
    io:println("response:", res);
}

