var http=require('http');
var url=require('url');
var crypto=require('crypto');
var mysql=require('mysql');
var settings=require(__dirname.replace(/main$/, '').replace('/exec/', '/conf/').replace('\\exec\\', '\\conf\\')+'settings.js');

var users={};

new http.createServer(function(request, response)
{	
    var query=url.parse(request.url, true).query;
    
    l('');
    l(query.user_id);
    l(query.type);
    l(request.url);
    
    if(crypto.createHash('md5').update(query.user_id+query.type+(query.notify_id || '')+settings.encryptionCode).digest("hex")!=query.sign)
    {
        l('sign_error');
        response.statusCode=404;
        response.end();
        return;
    }
    
    if(query.type=='add')
    {		  
        var sended=false;
        var deleteTime=0;        
        if(users[query.user_id])
        {
            l('add user is');                        
            var user=users[query.user_id];
            var deleteTime=user.deleteTime;
            user.notifyId=Math.max(user.notifyId, query.notify_id);            
            for(var i in user.sessions)
            {
                var session=user.sessions[i];
                session.notifys.push(JSON.parse(query.notify));
                l(session.notifys);
                var connections=session.connections;
                for(var j in connections)
                {
                    var connection=connections[j];
                    connection.response.end(connection.callback+'();', function(){});
                    delete(connections[j]); //badcode
                    user.deleteTime=new Date().getTime();
                    if(! sended)
                    {
                        sended=true;
                        response.end(JSON.stringify({sended: true}));
                        l({sended: true});
                    }
                }
            }            
        }
        if(! sended)
        {
            response.end(JSON.stringify({sended: false, deleteTime: deleteTime}));
            l({sended: false, deleteTime: deleteTime});
        }
    }
    else if(query.type=='get')
    {                               
        //l(users);
        if(! users[query.user_id]) users[query.user_id]={sessions: {}, notifyId: -1}; //badcode
        var user=users[query.user_id];
        var sessions=user.sessions;
            
        user.deleteTime=0;
        
        var session=sessions[query.session_id];
        if(session)
        {
            l('get session is:'); 
            l(session.notifys);
            response.end(JSON.stringify(session.notifys));
            session.notifys=[];
        }
        else
        {
            l('get session is not');
            response.end(null);
        }
    }
    else if(query.type=='wait')
    {				
        if(! users[query.user_id]) users[query.user_id]={sessions: {}, notifyId: -1};
        var user=users[query.user_id];
        var sessions=user.sessions;
    
        user.deleteTime=0;            
        
        if(! sessions[query.session_id]) sessions[query.session_id]={connections: [], notifys: []};
        var session=sessions[query.session_id];        
        var connections=session.connections;      
        
        if(query.notify_id<user.notifyId)
        {				
            l('wait end emmidiatly');
            response.end(query.callback+'();');
        }
        else
        {	
            if(user.notifyId==-1)
            {
                l('wait db query');
                var mysqlConnection=mysql.createConnection({host: '127.0.0.1', user: settings.db.login, password: settings.db.pass, 
			socketPath: '/var/run/mysqld/mysqld.sock'
		  });
                mysqlConnection.query('select notify_id from '+settings.db.name+'.user where id='+parseInt(query.user_id), function(err, rows)
                {
                    mysqlConnection.end();
                    l(err);
                    l(rows);
                    user.notifyId=Math.max(user.notifyId, rows[0]['notify_id']);
                    if(query.notify_id<user.notifyId)
                    {                        
                        response.end(query.callback+'();');
                        connectionClose();
                        l('wait db query end');                        
                    }
                    else
                    {
                        l('wait db query not end');
                    }                    
                });
            }
            
            l('wait connection');
            var connection={response: response, callback: query.callback};
            var connectionIndex=connections.length;
            connections.push(connection);                        
            
            var connectionClose=function()
            {
                l('');
                l(query.user_id);
                l('close connection');
                delete(connections[connectionIndex]);
                for(var i in sessions)
                {
                    for(var j in sessions[i].connections)
                    {
                        return;
                    }
                    l('close session');
                }   
                l('close user');
                user.deleteTime=new Date().getTime();
            };
            
            request.on('close', connectionClose);
        }
    }	
}).listen(settings.port);

/*setTimeout(function()
{
    var time=new Date().getTime();
    for(var i in users)
    {
        if(time-users[i].deleteTime>1000*60*10)
        {
            delete(users[i]);
        }
    }
}, 10000);*/

function l(a)
{
    console.log(a);
}