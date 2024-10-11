# compose_setups
Docker compose setups to test a variety of scenarios, such as ROS2 testing of
our reachability package.

# Build image

1. Clone repository

   ``` 
   cd ~
   git clone git@github.com:ana-GT/compose_setups.git
   cd compose_setups
   ```
2. Build image, then clone repos and build them:

   ```
   ./scripts/build_images.sh
   ./scripts/clone_rosws.sh
   ./scripts/build_rosws.sh
   ```
   
# Run things

See README in **reachability_tools**
   


