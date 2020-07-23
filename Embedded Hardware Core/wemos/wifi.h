#include <ESP8266WiFi.h>

char ssid[] = "<WiFi_Name>";
char pass[] = "<WiFi_Password>";
int port = 8000;
IPAddress server(192,168,1,102);

class WiFiConnection {
private:
  WiFiClient client;
  bool toggle;
  int threshold;
  
public:

  void begin() {
    // begin connection
    WiFi.begin(ssid, pass);

    // wait until succeed in connection
    // Connectiong to internet
    while(WiFi.status() != WL_CONNECTED) {
     delay(500);
    }

    // connected successfully
    // Connected! IP Address:
    // WiFi.localIP()
  }

  bool clientConnect() {
    // Start client connection
    if(client.connect(server, port)) {
      // Client connected to server
      return true;
    } else {
      // Connection failed!
      client.stop();
      return false;
    }
  }

  void clientPostRecord(int soilMoisture, float temperature, float humidity) {
    if (clientConnect()) {
      // simple post request with body
      // Sending a request
      String data = "soil_moisture=" + String(soilMoisture) + "&temperature=" + String(temperature) + "&humidity=" + String(humidity);
      client.println(String("POST ") + "/api/environments/" + " HTTP/1.1");
      client.println("Host: 192.168.1.102");
      client.println("Connection: close");
      client.println("Content-Type: application/x-www-form-urlencoded;");
      client.print("Content-Length: ");
      client.println(data.length());
      client.println();
      client.println(data);

      // Posted Successfully

      // stop client
      client.stop();
      // Disconnected successfully
    }
  }

  bool clientGetToggle() {
    
    if (clientConnect()) {
      // simple get request without body
      // Sending a request
      client.print(String("GET ") + "/api/toggles/1/" + " HTTP/1.1\r\n"
              + "Host: 192.168.1.102\r\nConnection: close\r\n\r\n");

      // read response until '\n'
      // Response
      String c;
      while (client.connected() || client.available()) {
        if (client.available()) {
          c = client.readString();
        }
      }

      // retrieve data
      if(c.endsWith("false}")) {
        toggle = false;
        // response is false
      } else {
        toggle = true;
        // response is true
      }

      // stop client
      client.stop();
      // Disconnected successfully

      return toggle;
    }
  }

  void clientPutToggle() {
    if (clientConnect()) {
      // simple put request with body
      // Sending a request
      String data = "toggle=false";
      client.println(String("PUT ") + "/api/toggles/1/" + " HTTP/1.1");
      client.println("Host: 192.168.1.102");
      client.println("Connection: close");
      client.println("Content-Type: application/x-www-form-urlencoded;");
      client.print("Content-Length: ");
      client.println(data.length());
      client.println();
      client.println(data);

      // Updated Successfully

      // stop client
      client.stop();
      // Disconnected successfully
    }
  }

  int clientGetThreshold() {
    if (clientConnect()) {
      // simple get request without body
      // Serial.println("[Sending a request]");
      client.print(String("GET ") + "/api/thresholds/1/" + " HTTP/1.1\r\n"
              + "Host: 192.168.1.102\r\nConnection: close\r\n\r\n");

      // read response until '\n'
      // Response
      String c;
      while (client.connected() || client.available()) {
        if (client.available()) {
          c = client.readString();
        }
      }

      // retrieve data
      int startIndex = c.length()-2;
      String temp = "";
      while(c[startIndex-1] != ':') startIndex--;          
      for(int i=startIndex; i<c.length()-1; i++) temp += c[i];

      // stop client
      client.stop();
      // Disconnected successfully

      return temp.toInt();
    }
  }
  
};

WiFiConnection wifi;
