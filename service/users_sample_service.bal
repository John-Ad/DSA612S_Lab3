import ballerina/grpc;

listener grpc:Listener ep = new (9090);

type User record {|
    string username;
    string lastname;
    string firstname;
    string email;
|};

User[] users = [];

@grpc:ServiceDescriptor {descriptor: ROOT_DESCRIPTOR, descMap: getDescriptorMap()}
service "users" on ep {

    remote function createUser(CreateRequest newUser) returns CreateResponse|error {
        foreach var user in users {
            if user.username == newUser.username {
                return error("User already exists");
            }
        }
        users.push(newUser);
        return {userid: newUser.username};
    }

    remote function getUser(GetRequest existingUser) returns GetResponse|error {
        foreach var user in users {
            if user.username == existingUser.username {
                return user;
            }
        }
        return error("User not found");
    }

    remote function deleteUser(DeleteRequest existingUser) returns DeleteResponse|error {
        foreach int i in 0 ..< users.length() {
            if users[i].username == existingUser.username {
                _ = users.remove(i);
                return {status: "ok"};
            }
        }
        return error("User not found");
    }

    remote function updateUser(UpdateRequest existingUser) returns UpdateResponse|error {
        foreach var user in users {
            if user.username == existingUser.username {
                user.lastname = existingUser.lastname;
                user.firstname = existingUser.firstname;
                user.email = existingUser.email;

                return {status: "ok"};
            }
        }
        return error("User not found");
    }
}

