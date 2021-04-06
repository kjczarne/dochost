# Dochost

Dochost is a minimal server intended to serve multiple project documentation collections on a single host.

## Deployment guide

### Predicates

1. Before you begin make sure you're in possession of a TLS certifiate and a private key.
2. Make sure Docker Desktop is installed on the machine you're doing the deployment on.
3. Port 443 (default HTTPS port) needs to be open on the deployment machine.

### Setup

1. Create `ssl_passwords` file under the root of this directory and write down the password(s) to decrypt the TLS private key.
2. Paste in the public and private key to be used into the `tls` subfolder.
3. Name the private key `server.key` and the certificate `server.crt`.
4. Run `docker-compose build`. This will copy the `ssl_passwords` file into the Docker image.
5. **Important**: remove `ssl_passwords` after the build is done.
6. Copy your built HTML documentation (at best programatically) into a subfolder in `html` folder, e.g. `html/my_project`.
7. Add a link to the `html/index.html` if you're adding the project for the first time:

    ```html
    <a href="my_project/index.html">My Project</a>
    ```
8. In the `nginx.conf` modify the server name. The server name should be the same as the subject of the TLS certificate.
9. Run `docker-compose up`.

    If the service was already running stop and remove the container first:
    ```bash
    docker stop dochost_server_1
    docker rm dochost_server_1
    docker-compose up
    ```
