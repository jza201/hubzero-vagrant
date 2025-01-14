<?php
// Not sure about the namespace stuff
// namespace Components\Radiam\Api;


/**
 * Main API class
 */
class Radiam
{
    private static function init() {
        if (!$didInit) {
            $didInit = true;
            $this->logger = null;
            $this->tokenfile = null;
            $this->baseurl = "http://nginx";
            $this->headers = array(
                "Content-Type" => "application/json",
                "Accept" => "application/json"
            );
            $this->authtokens = [];
            # TODO: are we handling multiple arbitrary kv pairs here still?
            # for key, value in kwargs.items():
                # setattr(self, key, value)
            if (isset($this->baseurl)) {
                if (!startsWith($this->baseurl, "http")) {
                    $this->baseurl = "http://" . $this->baseurl;
                }
                $this->endpoints = array(
                    "login"=> $this->baseurl . "/api/token/",
                    "refresh"=> $this->baseurl . "/api/token/refresh/",
                    "users"=> $this->baseurl . "/api/users/",
                    "groups"=> $this->baseurl . "/api/researchgroups/",
                    "projects"=> $this->baseurl . "/api/projects/",
                    "locations"=> $this->baseurl . "/api/locations/",
                    "locationtypes"=> $this->baseurl . "/api/locationtypes/",
                    "useragents"=> $this->baseurl . "/api/useragents/"
                )
            }
        }
    }


    Radiam::init();


    /**
     * Set up the logger
     *
     * @param   object?  $logger The logger
     */
    public function setLogger($query) {
        $this->logger = logger;
    }


    /**
     * Load auth tokens from a file
     *
     * @return  boolean?
     */
    public function loadAuthFromFile() {
        if file_exists($this->tokenfile) {
            $this->authtokens = json_decode(file_get_contents($f), true);
            if array_key_exists("access", $this->authtokens) {
                return true;
            }
        }
        return null;
    }


    /**
     * Log error messages
     *
     * @param  string  $message  The message to log
     */
    public function log($message) {
        if (isset($this->logger)) {
            # TODO: send error message, not sure what php library we're using here
        }
    }


    /**
     * Write auth tokens to a file
     *
     * @param  string  $authfile  The authfile path, if it exists
     */
    public function writeAuthToFile($authfile = null) {
        if (!isset($authfile)) {
            $authfile = $this->tokenfile;
        }
        $fp = fopen($authfile, 'w');
        fwrite($fp, json_encode($this->authtokens));
        fclose($fp);
    }


    /**
     * Make login requests
     *
     * @param  string  $username  The username being used to log in
     * @param  string  $password  The password being used to log in
     * @return  boolean?
     */
    public function login($username, $password) {
        $body = array("username" => $username, "password" => $password)
        try {
            $jsonString = json_encode($body)
            $ch = curl_init($this->endpoints->login);
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
            curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonString);
            curl_setopt($ch, CURLOPT_HTTPHEADER, $this->headers);
            $result = curl_exec($ch);
            $statusCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            curl_close($ch);
        } catch ( \Exception $e ) {
            return false;
        }
        if (statusCode != 200) {
            return false;
        } else {
            $respObj = json_decode($result, true);
            if (isset($respObj->refresh)):
                $this->authtokens["refresh"] = respObj["refresh"];
            if (isset($respObj->access)):
                $this->authtokens["access"] = respObj["access"];
            if (isset($this->tokenfile)):
                $this->writeAuthToFile();
            return true;
        }
    }


    /**
     * Refresh an auth token
     */
    public function refreshToken() {
        if (!isset($this->osf)) {
            $body = array("refresh" => $this->authtokens["refresh"])
            $jsonString = json_encode($body)
            $ch = curl_init($this->endpoints->refresh);
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
            curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonString);
            curl_setopt($ch, CURLOPT_HTTPHEADER, $this->headers);
            $result = curl_exec($ch);
            $statusCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            curl_close($ch);
            if (statusCode != 200) {
                $this->log(sprintf("Unable to refresh auth token %s:\n%s\n", $statusCode, $result));
            } else {
                $this->writeAuthToFile()
                $respObj = json_decode($result, true);
                if ($respObj->access != null) {
                    $this->authtokens["access"] = respObj["access"];
                }
            }
        } else {
            $ch = curl_init($this->baseurl . "/api/useragents/" . $this->useragent . "/token/new");
            $result = curl_exec($ch);
            $statusCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            curl_close($ch);
            if (statusCode != 200) {
                $this->log(sprintf("Unable to refresh auth token %s:\n%s\n", $statusCode, $result));
            } else {
                $respObj = json_decode($result, true);
                if ($respObj->access != null) {
                    $this->authtokens["access"] = respObj["access"];
                }
            }
        }
    }


    /**
     * Perform a GET call to the API
     *
     * @param  string  $url  The URL being called
     * @param  int  $retries  Number of retries to attempt, default 1
     * @return  array  $response  The response from the API
     */
    public function apiGet($url, $retries = 1) {
        if ($retries <= 0) {
            $this->log("Ran out of retries to connect to Radiam API");
            $response = null;
            return $response;
        }
        $getHeaders = $this->headers;
        $getHeaders["Authorization"] = "Bearer " . $this->authtokens["access"]
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $getHeaders);
        $result = curl_exec($ch);
        $statusCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        if ($statusCode == 403) {
            $responseJson = json_decode($result);
            if ($responseJson["code"] == "token_not_valid") {
                $this->refreshToken();
                $this->writeAuthToFile();
                $response = $this->apiGet($url, ($retries - 1));
                return $response;
            } else {
                $this->log(sprintf("Unauthorized request %s:\n%s\n", $statusCode, $result));
            }
        } elseif ($statusCode == 200) {
            $response = json_decode($result);
            return $response
        } elseif ($statusCode == 429) {
            $responseJson = json_decode($result);
            if array_key_exists("retry-after", $responseJson) {
                sleep(((int) $responseJson["retry-after"]) + 1);    
            } else {
                sleep(4);
            }
            $this->apiGet($url, 1)
        } else {
            $this->log(sprintf("Radiam API error while getting from: %s with code %s and error %s \n", $url, $statusCode, $result));
            $response = null;
            return $response;
        }
    }


    /**
     * Perform a POST call to the API
     *
     * @param  string  $url  The URL being called
     * @param  string  $body  The body of the POST
     * @param  int  $retries  Number of retries to attempt, default 1
     * @return  array  $response  The response from the API
     */
    public function apiPost($url, $body, $retries = 1) {
        if ($retries <= 0) {
            $this->log("Ran out of retries to connect to Radiam API");
            $response = null;
            return $response;
        }
        $postHeaders = $this->headers;
        $postHeaders["Authorization"] = "Bearer " . $this->authtokens["access"]
        $jsonString = json_encode($body)
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonString);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $postHeaders);
        $result = curl_exec($ch);
        $statusCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        if ($statusCode == 403) {
            $responseJson = json_decode($result);
            if ($responseJson["code"] == "token_not_valid") {
                $this->refreshToken();
                $this->writeAuthToFile();
                $response = $this->apiPost($url, $body, ($retries - 1));
                return $response;
            } else {
                $this->log(sprintf("Unauthorized request %s:\n%s\n", $statusCode, $result));
            }
        } elseif ($statusCode == 200 || $statusCode == 201) {
            $response = json_decode($result);
            return $response;
        } elseif ($statusCode == 429) {
            $responseJson = json_decode($result);
            if array_key_exists("retry-after", $responseJson) {
                sleep(((int) $responseJson["retry-after"]) + 1);    
            } else {
                sleep(4);
            }
            $this->apiPost($url, $body, 1)
        } else {
            $this->log(sprintf("Radiam API error while getting from: %s with code %s and error %s \n", $url, $statusCode, $result))
            $response = null;
            return $response;
        }
    }


    /**
     * Perform a bulk POST call to the API
     *
     * @param  string  $url  The URL being called
     * @param  string  $body  The body of the POST
     * @param  int  $retries  Number of retries to attempt, default 1
     * @return  array  $response  The response from the API
     */
    public function apiPostBulk($url, $body, $retries = 1) {
        if ($retries <= 0) {
            $this->log("Ran out of retries to connect to Radiam API");
            $response = array(null, false);
            return $response;
        }
        $postHeaders = $this->headers;
        $postHeaders["Authorization"] = "Bearer " . $this->authtokens["access"]
        $jsonString = json_encode($body)
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
        curl_setopt($ch, CURLOPT_POSTFIELDS, $jsonString);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $postHeaders);
        $result = curl_exec($ch);
        $statusCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        if ($statusCode == 403) {
            $responseJson = json_decode($result);
            if ($responseJson["code"] == "token_not_valid") {
                $this->refreshToken();
                $this->writeAuthToFile();
                $response = $this->apiPostBulk($url, $body, ($retries - 1));
                return $response;
            } else {
                $this->log(sprintf("Unauthorized request %s:\n%s\n", $statusCode, $result));
            }
        } elseif ($statusCode == 200 || $statusCode == 201) {
            $response = json_decode($result);
            return $response;
        } elseif ($statusCode == 429) {
            $responseJson = json_decode($result);
            if array_key_exists("retry-after", $responseJson) {
                sleep(((int) $responseJson["retry-after"]) + 1);    
            } else {
                sleep(4);
            }
            $this->apiPostBulk($url, $body, 1)
        } else {
            $this->log(sprintf("Radiam API error while getting from: %s with code %s and error %s \n", $url, $statusCode, $result));
            $response = null;
            return $response;
        }
    }


    /**
     * Perform a DELETE call to the API
     *
     * @param  string  $url  The URL being called
     * @param  int  $retries  Number of retries to attempt, default 1
     * @return  array  $response  The response from the API
     */
    public function apiDelete($url, $retries = 1) {
        if ($retries <= 0) {
            $this->log("Ran out of retries to connect to Radiam API");
            $response = null;
            return $response;
        }
        $deleteHeaders = $this->headers;
        $deleteHeaders["Authorization"] = "Bearer " . $this->authtokens["access"]
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $deleteHeaders);
        $result = curl_exec($ch);
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "DELETE");
        $statusCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        if ($statusCode == 403) {
            $responseJson = json_decode($result);
            if ($responseJson["code"] == "token_not_valid") {
                $this->refreshToken();
                $this->writeAuthToFile();
                $response = $this->apiDelete($url, ($retries - 1));
                return $response;
            } else {
                $this->log(sprintf("Unauthorized request %s:\n%s\n", $statusCode, $result));
            }
        } elseif ($statusCode == 200 || $statusCode == 204) {
            $response = true;
            return $response;
        } elseif ($statusCode == 429) {
            $responseJson = json_decode($result);
            if array_key_exists("retry-after", $responseJson) {
                sleep(((int) $responseJson["retry-after"]) + 1);    
            } else {
                sleep(4);
            }
            $this->apiDelete($url, 1)
        } else {
            $this->log(sprintf("Radiam API error while getting from: %s with code %s and error %s \n", $url, $statusCode, $result));
            $response = null;
            return $response;
        }
    }


    /**
     * Get list of users
     *
     * @return  array  $users  Output from users endpoint 
     */
    public function getUsers() {
        $users = $this->apiGet($this->endpoints["users"]);
        return $users;
    }


    /**
     * Get logged in user
     *
     * @return  array  $currentUser  Current user output from users endpoint 
     */
    public function getLoggedInUser() {
        $currentUser = $this->apiGet($this->endpoints["users"] . "current");
        return $currentUser;
    }


    /**
     * Get list of groups
     *
     * @return  array  $get_groups  Output from groups endpoint 
     */
    public function getGroups() {
        $users = $this->apiGet($this->endpoints["groups"]);
        return $groups;
    }


    /**
     * Get list of users
     *
     * @return  array  $projects  Output from projects endpoint 
     */
    public function getProjects() {
        $users = $this->apiGet($this->endpoints["projects"]);
        return $projects;
    }


    /**
     * Check in to API as agent to set up IDs
     *
     * @param  array  $body  JSON to post
     * @param  string  $checkinUrl  URL to check in to
     * @return  string  $checkinPost  Result of constructed post
     */
    public function agentCheckin($body, $checkinUrl) {
        if ($body == null) {
            return null;
        }
        if (gettype($body) == "array") {
            $body = json_encode($body);
        }
        $checkinPost = $this->apiPost($checkinUrl, $body);
        return $checkinPost;
    }


    /**
     * Create a project on the API
     *
     * @param  array  $body  JSON to post
     * @return  string  $createProjectPost  Result of constructed post
     */
    public function createProject($body) {
        if ($body == null) {
            return null;
        }
        if (gettype($body) == "array") {
            $body = json_encode($body);
        }
        $createProjectPost = $this->apiPost($this->endpoints["projects"], $body);
        return $createProjectPost;
    }


    /**
     * Create a location on the API
     *
     * @param  array  $body  JSON to post
     * @return  string  $createLocationPost  Result of constructed post
     */
    public function createLocation($body) {
        if ($body == null) {
            return null;
        }
        if (gettype($body) == "array") {
            $body = json_encode($body);
        }
        $createLocationPost = $this->apiPost($this->endpoints["locations"], $body);
        return $createLocationPost;
    }


    /**
     * Create a user agent on the API
     *
     * @param  array  $body  JSON to post
     * @return  string  $createUserAgentPost  Result of constructed post
     */
    public function createUserAgent($body) {
        if ($body == null) {
            return null;
        }
        if (gettype($body) == "array") {
            $body = json_encode($body);
        }
        $createUserAgentPost = $this->apiPost($this->endpoints["useragents"], $body);
        return $createUserAgentPost;
    }


    /**
     * Create a document on the API
     *
     * @param  string  $indexUrl  Index URL to post to
     * @param  array  $body  JSON to post
     * @return  string  $createDocumentPost  Result of constructed post
     */
    public function createDocument($indexUrl, $body) {
        if ($body == null) {
            return null;
        }
        if (gettype($body) == "array") {
            $body = json_encode($body);
        }
        $indexUrl .= "docs/";
        $createDocumentPost = $this->apiPost($indexUrl, $body);
        return $createDocumentPost;
    }


    /**
     * Create multiple documents on the API
     *
     * @param  string  $indexUrl  Index URL to post to
     * @param  array  $body  JSON to post
     * @return  string  $createDocumentPost  Result of constructed post
     */
    public function createDocumentBulk($indexUrl, $body) {
        if ($body == null) {
            return null;
        }
        if (gettype($body) == "array") {
            $body = json_encode($body);
        }
        $indexUrl .= "docs/";
        $createDocumentPost = $this->apiPostBulk($indexUrl, $body);
        return $createDocumentPost;
    }


    /**
     * Delete a document on the API
     *
     * @param  string  $indexUrl  Index URL to post to
     * @param  string  $id  Document ID
     * @return  string  $deletePost  Result of constructed post
     */
    public function deleteDocument($indexUrl, $id) {
        if ($id == null) {
            return null;
        }
        $indexUrl .= "docs/" . urldecode($id);
        $deletePost = $this->apiPost($indexUrl);
        return $deletePost;
    }


    /**
     * Search an API endpoint using the path to a file
     *
     * @param  string  $indexUrl  Index URL to post to
     * @param  string  $path   Path to file you're searching for
     * @return  string  $pathSearch  Path search result
     */
    public function searchEndpointByPath($indexUrl, $path) {
        $pathSearch = $this->searchEndpointByFieldname($indexUrl, $path, "path.keyword");
        return $pathSearch;
    }


    /**
     * Search an API endpoint by a field name rather than a filepath
     *
     * @param  string  $indexUrl  Index URL to post to
     * @param  string  $target  Search target
     * @param  string  $fieldname  The name of the field being searched on
     * @return  string  $fieldSearch  The field search result
     */
    public function searchEndpointByFieldname($indexUrl, $target, $fieldname) {
        if ($fieldname == null) {
            $this->log($target . " field name is missing for endpoint search");
            return null;
        }
        if ($target == null) {
            $this->log($fieldname . " argument is missing for endpoint search");
            return null;
        }
        $indexUrl .= "search/"
        $body = array("query":array("bool":array("filter":array("term":array($fieldname=>$target)))));
        $fieldnameSearchPost = $this->apiPost($indexUrl, json_encode($body));
        return $fieldnameSearchPost;
    }


    /**
     * Search an API endpoint by name
     *
     * @param  string  $endpoint  The endpoint address
     * @param  string  $name  The name
     * @param  string  $namefield  The field being searched on, e.g. "name"
     * @return  array  $getEndpointUrl  The endpoint response
     */
    public function searchEndpointByName($endpoint, $name, $namefield = "name") {
        if ($name == null) {
            $this->log("Name argument is missing for endpoint search");
            return null;
        }
        if (startsWith($endpoint, "http")) {
            $endpoint_url = $endpoint;
        } else {
            if (isset($this->endpoints["endpoint"])) {
                $endpoint_url = $this->endpoints["endpoint"];
            } else {
                $this->log($endpoint . " is neither an endpoint URL nor a well known endpoint");
                return null;
            }
        }
        $endpointUrl .= "?" . $namefield . "=" . $name;
        $getEndpointUrl = $this->apiGet($endpointUrl);
        return $getEndpointUrl;
    }


    /**
     * Get the API status code
     *
     * @param  string  The API URL
     * @param  int  Retry attempts
     * @return  int  API HTTP response status code
     */
    public function apiGetStatusCode($url, $retries = 1) {
        if ($retries <= 0) {
            $this->log("Ran out of retries");
            return null;
        }
        $get_headers = $this->headers;
        $get_headers["Authorization"] = "Bearer " + $this->authtokens["access"];
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $get_headers);
        $result = curl_exec($ch);
        $statusCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
        if ($statusCode == 403) {
            $responseJson = json_decode($result);
            if ($responseJson->code == "token_not_valid") {
                $this->refreshToken();
                $this->writeAuthToFile();
                return $this->apiGet($url, ($retries - 1));
            } else {
                $this->log(sprintf("Unauthorized request %s:\n%s\n", $statusCode, $result));
            }
        } else {
            return $statusCode;
        }
    }
}
