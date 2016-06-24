access=$(curl -k -v -b cookies.txt -c cookies.txt "https://login.gorilla.wild.cf-app.com/oauth/authorize?response_type=token&client_id=implicit_performance_test&scope=openid&redirect_uri=http://www.google.com")
echo access
