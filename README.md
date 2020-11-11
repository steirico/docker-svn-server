# Description

Lightweight container providing a SVN server.

## Usage

* Start Docker container
  
  ```bash
  docker run -d --name svn-server -p 80:80 -v /svn-data:/var/lib/svn ghcr.io/steirico/svn-server:latest
  ```

* Default admin user

  ```bash
  User: admin
  Password: admin
  ```

* Base URL for repositories
  
  ```bash
  /svn
  ```

* Admin user interface

  ```bash
  /svnadmin
  ```

## Credits

* [elleFlorio](https://github.com/elleFlorio): Project inspired from [elleFlorio/svn-docker](https://github.com/elleFlorio/svn-docker)
* [mfreiholz](https://github.com/mfreiholz): [iF.SVNAdmin](https://github.com/mfreiholz/iF.SVNAdmin)
* [Sija](https://github.com/Sija): [svn-index.xsl](https://gist.githubusercontent.com/Sija/785898/raw/cfc99f3ef165e3cbb95e99864743d2214660ddcb/svn-index.xsl)

## Licence

[MIT](LICENCE.md)
