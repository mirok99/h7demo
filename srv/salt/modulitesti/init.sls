OBS-studio:
  file.managed:
    - names:
      - /etc/apt/sources.list.d/obsproject-ubuntu-obs-studio-bionic.list:
        - source: salt://modulitesti/obsproject-ubuntu-obs-studio-bionic.list
      - /etc/apt/trusted.gpg.d/obsproject_ubuntu_obs-studio.gpg:
        - source: salt://modulitesti/obsproject_ubuntu_obs-studio.gpg
  pkg.installed:
    - pkgs:
      - curl
      - apt-transport-https
      - ffmpeg
      - v4l2loopback-dkms
      - obs-studio
Discord:
  cmd.run:
    - name: curl -L -o /home/discord.deb https://discord.com/api/download?platform=linux&format=deb
    - creates: /home/discord.deb
  pkg.installed:
    - sources:
      - discord: /home/discord.deb
Brave:
  cmd.run:
    - names: 
      - curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg   
      - echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
  pkg.installed:
    - pkgs:
      - brave-browser
Runelite:
  cmd.run:
    - name: curl -L -o /home/RuneLite.AppImage https://github.com/runelite/launcher/releases/download/2.1.5/RuneLite.AppImage
    - creates: /home/RuneLite.AppImage
  file.managed:
    - name: /home/RuneLite.AppImage
    - mode: 0755  
Kirjanmerkit:
  cmd.run:
    - name: cp -r /srv/salt/modulitesti/skel /etc/
