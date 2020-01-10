var http=require('http');
var url=require('url');
var settings=require(__dirname.replace(/stop$/, '').replace('/exec/', '/conf/').replace('\\exec\\', '\\conf\\')+'settings.js');

new http.createServer(function(request, response)
{	
    response.end(url.parse(request.url, true).query.callback+'("stop");');
}).listen(settings.port);