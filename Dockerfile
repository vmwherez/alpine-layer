FROM alpine:latest

# Install zsh and set it as default shell
RUN apk --update --no-cache add shadow zsh git curl python3 && \
    chsh -s /bin/zsh

# Install Antigen.zsh
# RUN curl -L git.io/antigen > antigen.zsh

# Set up the Zsh configuration with Antigen
# COPY setup.sh /root/setup.sh
COPY setup2.sh /root/setup2.sh
COPY alpine-zshrc.rc /root/.zshrc.rc
	
# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN curl -L git.io/antigen > /root/antigen.zsh
COPY alpine-zshrc.rc  /root/.zshrc

### https://github.com/ohmyzsh/ohmyzsh#unattended-install ###
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended 
RUN cp /root/.zshrc /root/.zshrc.after-oh-my-zsh
RUN rm /root/.zshrc && cp /root/.zshrc.pre* /root/.zshrc

# RUN cp /root/.zshrc /root/.zshrc.after-oh-my-zsh
# RUN rm /root/.zshrc
# RUN cp /root/.zshrc.pre* /root/.zshrc 
# RUN touch /root/.zshrc
# RUN echo "source /root/.zshrc.pre*" > /root/.zshrc


WORKDIR /root 

# Set the default shell to zsh
CMD ["zsh"]