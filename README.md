# webserver-log-analyzer

A multithreaded webserver log analyzer written in c.

The purpose of the analyzer is to:
1. Count requests
2. Count requests by type
3. Count top n url's by type
4. list processing time and threads used

exaple output

```bash
=== Log Analysis Results ===
Total requests: 15,234
Successful (2xx): 14,891
Client errors (4xx): 298
Server errors (5xx): 45

Top 5 URLs:
  /index.html - 3,421 requests
  /api/users - 1,234 requests
  ...

Processing time: 1.23s (4 threads)
```

### Line Makeup

Each line of the log file consists of these parts.

```
192.168.1.15 - frank [27/Jan/2026:08:23:15 +0000] "GET /index.html HTTP/1.1" 200 4523
```

**192.168.1.15**
    The ip address of the client.
**-**
    Hyphen, to show the requested info was not available.
**frank**
    The sureid of the perston rquestin ghe data. Or a `-` in the case there is no uid.
**\[27/Jan/2026:08:23:15 +0000\]**
    The date and time the request was recieved.
**"GET /index.html HTTP/1.1"**
    The request and url of the request. This is always inside of quotes.
**200**
    The status code that the server sends back to the client.
**4523**
    The size of the response data.


