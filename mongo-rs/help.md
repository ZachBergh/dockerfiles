sudo docker run \
  -P -name rs1_srv1 \
  -d dev24/mongodb \
  --replSet rs1 \
  --noprealloc --smallfiles