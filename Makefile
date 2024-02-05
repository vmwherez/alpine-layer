.SILENT: list

all:	clean build create attach
	   
build: 
	podman build -t "alpine-layer" -f Dockerfile .

list: 
	echo "\n Running Containers: \n"
	podman container list
	echo "\n Built Images: \n"
	podman image list
	

clean:
	podman image rm alpine-layer

prune: 
	podman container prune
	podman image prune

create:
	# podman run -v ${HOME}/Desktop:/root/desktop -it alpine-layer
	podman create --name="alpine" -v ${HOME}/Desktop:/root/desktop -it alpine-layer
	podman start alpine
	podman container list

stop: 
	podman stop alpine

attach:	
	podman start alpine
	podman attach alpine
