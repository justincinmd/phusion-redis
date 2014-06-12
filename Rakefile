IMAGE_TAG = "phusion-redis"
REDIS_VOLUME = "-v /data/rep/redis:/var/lib/redis"

task :build do
  system "sudo docker build -t #{IMAGE_TAG} ."
end

task :shell => :build do
  exec "sudo docker run -i -t #{REDIS_VOLUME} #{IMAGE_TAG} /sbin/my_init -- /bin/bash"
end

task :run => :build do
  exec "sudo docker run #{REDIS_VOLUME} #{IMAGE_TAG}"
end