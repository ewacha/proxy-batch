proxy-batch
===========

a windows batch-file to configure proxy settings: windows environment-variable, npm-, git- and bower-config.

especially when you like to work with YEOMAN and when you're working behind a company-proxy you must configure files like `.npmrc`, `.gitconfig`, `.bowerrc` and windows env-variables.

place the `configProxy.bat` in a workspace directory an let it run.


#### work behind a company proxy
select option [1], and the bat asks you to insert a valid proxy url and port. after this, the batch insert this information in `.gitconfig`:

```
[http]
	proxy = http://foo.bar.com:1234
[url "https://"]
	insteadOf = git://
```

in `.npmrc`:

```
registry = http://registry.npmjs.org/
proxy = http://foo.bar.com:1234/
https-proxy = https://foo.bar.com:1234
```

also in `.bowerrc`:
```
{ 
 "directory": "app/bower_components", 
 "proxy": "http://foo.bar.com:1234", 
 "https-proxy": "http://foo.bar.com:1234" 
}
```

and, it will set a user environment variable via
```
call setx http_proxy http://%proxyurl%:%port%
call setx https_proxy http://%proxyurl%:%port%
```

after this, run the respective yeoman generator...

attention: yeoman asks whether to overwrite the file `.bowerrc`, you must say no :)

![](http://www.wacha.de/git/yo.png)

#### work without a proxy

if so, select option [2]. this command will remove all proxy settings you set above...

