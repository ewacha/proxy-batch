proxy-batch
===========

a windows batch-file to configure proxy settings: windows environment-variable, npm-, git- and bower-config.

especially when you like to work with YEOMAN and when you're working behind a company-proxy you must configure files like `.npmrc`, `.gitconfig`, `.bowerrc` and windows env-variables.

place the `configProxy.bat` in a workspace directory an let it run.


##### work behind a company proxy
the bat asks you to insert a valid proxy url and port. after this, the batch insert this information in `.gitconfig`:

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

after this, run the respective yeoman generator...

attention: yeoman asks whether to overwrite the file `.bowerrc`, you must say no :)


