.class public Lcom/android/BaseAuthenicationHttpClient;
.super Ljava/lang/Object;
.source "BaseAuthenicationHttpClient.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static doRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .parameter "urlString"
    .parameter "name"
    .parameter "password"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 65
    :try_start_0
    new-instance v6, Ljava/net/URL;

    invoke-direct {v6, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 67
    .local v6, url:Ljava/net/URL;
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v5

    .line 69
    .local v5, uc:Ljava/net/URLConnection;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 70
    .local v7, userPassword:Ljava/lang/String;
    invoke-static {v7}, Lcom/android/Base64;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 72
    .local v2, encoding:Ljava/lang/String;
    const-string v8, "Authorization"

    new-instance v9, Ljava/lang/StringBuilder;

    const-string v10, "Basic "

    invoke-direct {v9, v10}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v5, v8, v9}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    const-string v8, "User-Agent"

    const-string v9, "Mozilla/5.0"

    invoke-virtual {v5, v8, v9}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    invoke-virtual {v5}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 76
    .local v0, content:Ljava/io/InputStream;
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/InputStreamReader;

    .line 77
    const-string v9, "UTF-8"

    invoke-direct {v8, v0, v9}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 76
    invoke-direct {v3, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 78
    .local v3, in:Ljava/io/BufferedReader;
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .line 80
    .local v4, line:Ljava/lang/String;
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 81
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    return-object v8

    .line 82
    .end local v0           #content:Ljava/io/InputStream;
    .end local v2           #encoding:Ljava/lang/String;
    .end local v3           #in:Ljava/io/BufferedReader;
    .end local v4           #line:Ljava/lang/String;
    .end local v5           #uc:Ljava/net/URLConnection;
    .end local v6           #url:Ljava/net/URL;
    .end local v7           #userPassword:Ljava/lang/String;
    :catch_0
    move-exception v8

    move-object v1, v8

    .line 83
    .local v1, e:Ljava/io/IOException;
    new-instance v8, Ljava/lang/Exception;

    invoke-direct {v8, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    throw v8
.end method

.method public static doRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)Ljava/lang/String;
    .locals 3
    .parameter "urlString"
    .parameter "name"
    .parameter "password"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 23
    .local p3, params:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 24
    .local v0, url:Ljava/net/URL;
    new-instance p0, Ljava/lang/StringBuilder;

    .end local p0
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .end local p1
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, ":"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 26
    .local p0, userPassword:Ljava/lang/String;
    invoke-static {p0}, Lcom/android/Base64;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .end local p0           #userPassword:Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 28
    .local p0, encoding:Ljava/lang/String;
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p2

    .end local p2
    check-cast p2, Ljava/net/HttpURLConnection;

    .line 29
    .local p2, uc:Ljava/net/HttpURLConnection;
    const-string p1, "Authorization"

    new-instance v0, Ljava/lang/StringBuilder;

    .end local v0           #url:Ljava/net/URL;
    const-string v1, "Basic "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    .end local p0           #encoding:Ljava/lang/String;
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p1, p0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    const-string p0, "User-Agent"

    const-string p1, "Mozilla/5.0"

    invoke-virtual {p2, p0, p1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    const/4 p0, 0x1

    invoke-virtual {p2, p0}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 33
    const/4 p0, 0x1

    invoke-virtual {p2, p0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 34
    const-string p0, "POST"

    invoke-virtual {p2, p0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 36
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/util/HashMap;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_0

    .line 37
    new-instance p0, Ljava/lang/StringBuffer;

    invoke-direct {p0}, Ljava/lang/StringBuffer;-><init>()V

    .line 38
    .local p0, buf:Ljava/lang/StringBuffer;
    invoke-virtual {p3}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-nez p1, :cond_1

    .line 42
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->deleteCharAt(I)Ljava/lang/StringBuffer;

    .line 43
    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    .end local p0           #buf:Ljava/lang/StringBuffer;
    const-string p3, "UTF-8"

    .end local p3           #params:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p0, p3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/io/OutputStream;->write([B)V

    .line 44
    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V

    .line 47
    :cond_0
    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    .line 48
    .local p0, content:Ljava/io/InputStream;
    new-instance p1, Ljava/io/BufferedReader;

    new-instance p2, Ljava/io/InputStreamReader;

    .line 49
    .end local p2           #uc:Ljava/net/HttpURLConnection;
    const-string p3, "UTF-8"

    invoke-direct {p2, p0, p3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 48
    invoke-direct {p1, p2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 50
    .local p1, in:Ljava/io/BufferedReader;
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object p0

    .line 54
    .local p0, line:Ljava/lang/String;
    invoke-virtual {p1}, Ljava/io/BufferedReader;->close()V

    .line 55
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .end local p0           #line:Ljava/lang/String;
    return-object p0

    .line 38
    .end local p1           #in:Ljava/io/BufferedReader;
    .local p0, buf:Ljava/lang/StringBuffer;
    .restart local p2       #uc:Ljava/net/HttpURLConnection;
    .restart local p3       #params:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 39
    .local p1, key:Ljava/lang/String;
    const-string v1, "&"

    invoke-virtual {p0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    .line 40
    invoke-virtual {p3, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .end local p1           #key:Ljava/lang/String;
    check-cast p1, Ljava/lang/String;

    .line 39
    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 56
    .end local p0           #buf:Ljava/lang/StringBuffer;
    .end local p2           #uc:Ljava/net/HttpURLConnection;
    .end local p3           #params:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    :catch_0
    move-exception p0

    .line 57
    .local p0, e:Ljava/io/IOException;
    new-instance p1, Ljava/lang/Exception;

    invoke-direct {p1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    throw p1
.end method

.method public static getCodeByURL(Ljava/lang/String;I)I
    .locals 8
    .parameter "urlString"
    .parameter "i"

    .prologue
    const/4 v7, 0x1

    .line 128
    const/4 v2, 0x0

    .line 130
    .local v2, responseCode:I
    :try_start_0
    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 132
    .local v3, url:Ljava/net/URL;
    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    .line 131
    check-cast v1, Ljava/net/HttpURLConnection;

    .line 133
    .local v1, httpConnection:Ljava/net/HttpURLConnection;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 135
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->connect()V

    .line 136
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    .line 141
    .end local v1           #httpConnection:Ljava/net/HttpURLConnection;
    .end local v3           #url:Ljava/net/URL;
    :goto_0
    const/16 v4, 0xc8

    if-eq v2, v4, :cond_0

    if-ge p1, v7, :cond_0

    .line 142
    add-int/lit8 p1, p1, 0x1

    .line 143
    invoke-static {p0, p1}, Lcom/android/BaseAuthenicationHttpClient;->getCodeByURL(Ljava/lang/String;I)I

    move-result v2

    .line 145
    :cond_0
    return v2

    .line 137
    :catch_0
    move-exception v4

    move-object v0, v4

    .line 138
    .local v0, e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 139
    const-string v4, "info"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "getCodeByURL:"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static getStringByURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .parameter "urlString"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 97
    const/4 v5, 0x0

    .line 98
    .local v5, responseCode:I
    new-instance v6, Ljava/net/URL;

    invoke-direct {v6, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 100
    .local v6, url:Ljava/net/URL;
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    .line 99
    check-cast v1, Ljava/net/HttpURLConnection;

    .line 101
    .local v1, httpConnection:Ljava/net/HttpURLConnection;
    const/4 v7, 0x1

    invoke-virtual {v1, v7}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 103
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->connect()V

    .line 104
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v5

    .line 105
    const/16 v7, 0xc8

    if-ne v5, v7, :cond_1

    .line 106
    new-instance v2, Ljava/io/InputStreamReader;

    .line 107
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    const-string v8, "UTF-8"

    .line 106
    invoke-direct {v2, v7, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 108
    .local v2, in:Ljava/io/InputStreamReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 109
    .local v0, buffer:Ljava/io/BufferedReader;
    const-string v3, ""

    .line 110
    .local v3, inputData:Ljava/lang/String;
    const/4 v4, 0x0

    .line 111
    .local v4, inputLine:Ljava/lang/String;
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 114
    const-string v7, "info"

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "test:"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    invoke-virtual {v2}, Ljava/io/InputStreamReader;->close()V

    .line 119
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    move-object v7, v3

    .line 123
    .end local v0           #buffer:Ljava/io/BufferedReader;
    .end local v2           #in:Ljava/io/InputStreamReader;
    .end local v3           #inputData:Ljava/lang/String;
    .end local v4           #inputLine:Ljava/lang/String;
    :goto_1
    return-object v7

    .line 112
    .restart local v0       #buffer:Ljava/io/BufferedReader;
    .restart local v2       #in:Ljava/io/InputStreamReader;
    .restart local v3       #inputData:Ljava/lang/String;
    .restart local v4       #inputLine:Ljava/lang/String;
    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 123
    .end local v0           #buffer:Ljava/io/BufferedReader;
    .end local v2           #in:Ljava/io/InputStreamReader;
    .end local v3           #inputData:Ljava/lang/String;
    .end local v4           #inputLine:Ljava/lang/String;
    :cond_1
    const/4 v7, 0x0

    goto :goto_1
.end method

.method public static getXboxStrByURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .parameter "urlString"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-string v10, "gzip, deflate"

    const-string v9, "Accept-Encoding"

    .line 149
    const/4 v5, 0x0

    .line 150
    .local v5, responseCode:I
    new-instance v6, Ljava/net/URL;

    invoke-direct {v6, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 152
    .local v6, url:Ljava/net/URL;
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    .line 151
    check-cast v1, Ljava/net/HttpURLConnection;

    .line 153
    .local v1, httpConnection:Ljava/net/HttpURLConnection;
    const/16 v7, 0x2710

    invoke-virtual {v1, v7}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 156
    const-string v7, "User-Agent"

    .line 157
    const-string v8, "NokiaN7610-1/4.0850.43.1.1 Series60/3.0 Profile/MIDP-2.0 Configuration/CLDC-1.1"

    .line 155
    invoke-virtual {v1, v7, v8}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    const-string v7, "Accept"

    const-string v8, "*/*"

    invoke-virtual {v1, v7, v8}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    const-string v7, "Accept-Encoding"

    const-string v7, "gzip, deflate"

    invoke-virtual {v1, v9, v10}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    const-string v7, "Accept-Charset"

    const-string v8, "UTF-8"

    invoke-virtual {v1, v7, v8}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    const-string v7, "Accept-Encoding"

    const-string v7, "gzip, deflate"

    invoke-virtual {v1, v9, v10}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    const-string v7, "info"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getRequestProperties()Ljava/util/Map;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->connect()V

    .line 168
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v5

    .line 169
    const/16 v7, 0xc8

    if-ne v5, v7, :cond_1

    .line 170
    new-instance v2, Ljava/io/InputStreamReader;

    .line 171
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    .line 170
    invoke-direct {v2, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 172
    .local v2, in:Ljava/io/InputStreamReader;
    new-instance v0, Ljava/io/BufferedReader;

    invoke-direct {v0, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 173
    .local v0, buffer:Ljava/io/BufferedReader;
    const-string v3, ""

    .line 174
    .local v3, inputData:Ljava/lang/String;
    const/4 v4, 0x0

    .line 175
    .local v4, inputLine:Ljava/lang/String;
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 179
    invoke-virtual {v2}, Ljava/io/InputStreamReader;->close()V

    .line 182
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    move-object v7, v3

    .line 186
    .end local v0           #buffer:Ljava/io/BufferedReader;
    .end local v2           #in:Ljava/io/InputStreamReader;
    .end local v3           #inputData:Ljava/lang/String;
    .end local v4           #inputLine:Ljava/lang/String;
    :goto_1
    return-object v7

    .line 176
    .restart local v0       #buffer:Ljava/io/BufferedReader;
    .restart local v2       #in:Ljava/io/InputStreamReader;
    .restart local v3       #inputData:Ljava/lang/String;
    .restart local v4       #inputLine:Ljava/lang/String;
    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 186
    .end local v0           #buffer:Ljava/io/BufferedReader;
    .end local v2           #in:Ljava/io/InputStreamReader;
    .end local v3           #inputData:Ljava/lang/String;
    .end local v4           #inputLine:Ljava/lang/String;
    :cond_1
    const/4 v7, 0x0

    goto :goto_1
.end method
