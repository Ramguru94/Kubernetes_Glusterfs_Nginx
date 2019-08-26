# Kubernetes Autoscaler with GlusterFS

Launch Nginx pod in Kubernetes Cluster with certbot-dns-cloudflare module for automatic certificate generation and renew for Nginx. Also Nginx's /etc/nginx/sites-available path will be managed through GlusterFS Volume Management.  

### Tech Stacks
  - Kubernetes
  - Docker
  - Nginx
  - Certbot
  - Cloudflare
  - GlusterFs

#### GlusterFs Management

##### Installation (Standalone server)

```
sudo add-apt-repository ppa:gluster/glusterfs-5
sudo apt-get update
sudo apt-get install glusterfs-server
systemctl enable glusterd
sudo apt-get install glusterfs-client
```
##### Configuration
- Attach a seperate volume in the ubuntu server that can be used for managing gluster volume.
- Example: **/glusterfs** - extra mount in ubuntu server
- Create data directory and volume directory under that newly created mount
- Example: **/glusterfs/volumes** and **/glusterfs/data**
- Since we are using standalone glusterfs server, we can create a gluster volume and point the volume to the volume directory
``` gluster volume create nginx 10.0.1.5:/glusterfs/volumes/nginx ```
- Start the gluster volume using the following command
```gluster volume start nginx ```
- Then mount the data directory related to this Nginx Volume as shown below
``` mount -t glusterfs 10.0.1.5:/nginx /glusterfs/data/nginx ```
