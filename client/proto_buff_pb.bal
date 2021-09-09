import ballerina/grpc;

public isolated client class usersClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, ROOT_DESCRIPTOR, getDescriptorMap());
    }

    isolated remote function createUser(CreateRequest|ContextCreateRequest req) returns (CreateResponse|grpc:Error) {
        map<string|string[]> headers = {};
        CreateRequest message;
        if (req is ContextCreateRequest) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("users/createUser", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <CreateResponse>result;
    }

    isolated remote function createUserContext(CreateRequest|ContextCreateRequest req) returns (ContextCreateResponse|grpc:Error) {
        map<string|string[]> headers = {};
        CreateRequest message;
        if (req is ContextCreateRequest) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("users/createUser", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <CreateResponse>result, headers: respHeaders};
    }

    isolated remote function getUser(GetRequest|ContextGetRequest req) returns (GetResponse|grpc:Error) {
        map<string|string[]> headers = {};
        GetRequest message;
        if (req is ContextGetRequest) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("users/getUser", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <GetResponse>result;
    }

    isolated remote function getUserContext(GetRequest|ContextGetRequest req) returns (ContextGetResponse|grpc:Error) {
        map<string|string[]> headers = {};
        GetRequest message;
        if (req is ContextGetRequest) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("users/getUser", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <GetResponse>result, headers: respHeaders};
    }

    isolated remote function deleteUser(DeleteRequest|ContextDeleteRequest req) returns (DeleteResponse|grpc:Error) {
        map<string|string[]> headers = {};
        DeleteRequest message;
        if (req is ContextDeleteRequest) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("users/deleteUser", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <DeleteResponse>result;
    }

    isolated remote function deleteUserContext(DeleteRequest|ContextDeleteRequest req) returns (ContextDeleteResponse|grpc:Error) {
        map<string|string[]> headers = {};
        DeleteRequest message;
        if (req is ContextDeleteRequest) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("users/deleteUser", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <DeleteResponse>result, headers: respHeaders};
    }

    isolated remote function updateUser(UpdateRequest|ContextUpdateRequest req) returns (UpdateResponse|grpc:Error) {
        map<string|string[]> headers = {};
        UpdateRequest message;
        if (req is ContextUpdateRequest) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("users/updateUser", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <UpdateResponse>result;
    }

    isolated remote function updateUserContext(UpdateRequest|ContextUpdateRequest req) returns (ContextUpdateResponse|grpc:Error) {
        map<string|string[]> headers = {};
        UpdateRequest message;
        if (req is ContextUpdateRequest) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("users/updateUser", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <UpdateResponse>result, headers: respHeaders};
    }
}

public client class UsersUpdateResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendUpdateResponse(UpdateResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextUpdateResponse(ContextUpdateResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class UsersCreateResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendCreateResponse(CreateResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextCreateResponse(ContextCreateResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class UsersGetResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendGetResponse(GetResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextGetResponse(ContextGetResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class UsersDeleteResponseCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendDeleteResponse(DeleteResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextDeleteResponse(ContextDeleteResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextUpdateResponse record {|
    UpdateResponse content;
    map<string|string[]> headers;
|};

public type ContextDeleteResponse record {|
    DeleteResponse content;
    map<string|string[]> headers;
|};

public type ContextUpdateRequest record {|
    UpdateRequest content;
    map<string|string[]> headers;
|};

public type ContextCreateRequest record {|
    CreateRequest content;
    map<string|string[]> headers;
|};

public type ContextCreateResponse record {|
    CreateResponse content;
    map<string|string[]> headers;
|};

public type ContextGetRequest record {|
    GetRequest content;
    map<string|string[]> headers;
|};

public type ContextGetResponse record {|
    GetResponse content;
    map<string|string[]> headers;
|};

public type ContextDeleteRequest record {|
    DeleteRequest content;
    map<string|string[]> headers;
|};

public type UpdateResponse record {|
    string status = "";
|};

public type DeleteResponse record {|
    string status = "";
|};

public type UpdateRequest record {|
    string username = "";
    string lastname = "";
    string firstname = "";
    string email = "";
|};

public type CreateRequest record {|
    string username = "";
    string lastname = "";
    string firstname = "";
    string email = "";
|};

public type CreateResponse record {|
    string userid = "";
|};

public type GetRequest record {|
    string username = "";
|};

public type GetResponse record {|
    string username = "";
    string lastname = "";
    string firstname = "";
    string email = "";
|};

public type DeleteRequest record {|
    string username = "";
|};

const string ROOT_DESCRIPTOR = "0A1070726F746F5F627566662E70726F746F227B0A0D43726561746552657175657374121A0A08757365726E616D651801200128095208757365726E616D65121A0A086C6173746E616D6518022001280952086C6173746E616D65121C0A0966697273746E616D65180320012809520966697273746E616D6512140A05656D61696C1804200128095205656D61696C22280A0E437265617465526573706F6E736512160A06757365726964180120012809520675736572696422280A0A47657452657175657374121A0A08757365726E616D651801200128095208757365726E616D6522790A0B476574526573706F6E7365121A0A08757365726E616D651801200128095208757365726E616D65121A0A086C6173746E616D6518022001280952086C6173746E616D65121C0A0966697273746E616D65180320012809520966697273746E616D6512140A05656D61696C1804200128095205656D61696C222B0A0D44656C65746552657175657374121A0A08757365726E616D651801200128095208757365726E616D6522280A0E44656C657465526573706F6E736512160A067374617475731801200128095206737461747573227B0A0D55706461746552657175657374121A0A08757365726E616D651801200128095208757365726E616D65121A0A086C6173746E616D6518022001280952086C6173746E616D65121C0A0966697273746E616D65180320012809520966697273746E616D6512140A05656D61696C1804200128095205656D61696C22280A0E557064617465526573706F6E736512160A06737461747573180120012809520673746174757332BA010A057573657273122D0A0A63726561746555736572120E2E437265617465526571756573741A0F2E437265617465526573706F6E736512240A0767657455736572120B2E476574526571756573741A0C2E476574526573706F6E7365122D0A0A64656C65746555736572120E2E44656C657465526571756573741A0F2E44656C657465526573706F6E7365122D0A0A75706461746555736572120E2E557064617465526571756573741A0F2E557064617465526573706F6E7365620670726F746F33";

isolated function getDescriptorMap() returns map<string> {
    return {"proto_buff.proto": "0A1070726F746F5F627566662E70726F746F227B0A0D43726561746552657175657374121A0A08757365726E616D651801200128095208757365726E616D65121A0A086C6173746E616D6518022001280952086C6173746E616D65121C0A0966697273746E616D65180320012809520966697273746E616D6512140A05656D61696C1804200128095205656D61696C22280A0E437265617465526573706F6E736512160A06757365726964180120012809520675736572696422280A0A47657452657175657374121A0A08757365726E616D651801200128095208757365726E616D6522790A0B476574526573706F6E7365121A0A08757365726E616D651801200128095208757365726E616D65121A0A086C6173746E616D6518022001280952086C6173746E616D65121C0A0966697273746E616D65180320012809520966697273746E616D6512140A05656D61696C1804200128095205656D61696C222B0A0D44656C65746552657175657374121A0A08757365726E616D651801200128095208757365726E616D6522280A0E44656C657465526573706F6E736512160A067374617475731801200128095206737461747573227B0A0D55706461746552657175657374121A0A08757365726E616D651801200128095208757365726E616D65121A0A086C6173746E616D6518022001280952086C6173746E616D65121C0A0966697273746E616D65180320012809520966697273746E616D6512140A05656D61696C1804200128095205656D61696C22280A0E557064617465526573706F6E736512160A06737461747573180120012809520673746174757332BA010A057573657273122D0A0A63726561746555736572120E2E437265617465526571756573741A0F2E437265617465526573706F6E736512240A0767657455736572120B2E476574526571756573741A0C2E476574526573706F6E7365122D0A0A64656C65746555736572120E2E44656C657465526571756573741A0F2E44656C657465526573706F6E7365122D0A0A75706461746555736572120E2E557064617465526571756573741A0F2E557064617465526573706F6E7365620670726F746F33"};
}

