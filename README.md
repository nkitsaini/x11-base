# x11-base
Docker image for x11docker environment
- Uses archlinux as base.  
- Comes preinstalled with rust/npm/python.  
- Common tools like: fish/ncdu/dust/rg/ssh/alacritty etc.  
- With an user named `future_user` with uid:gid as 1000:1000. (you'll prob need to rename/ change dir of this user to your preference).

## Usage
You should use this with [x11docker](https://github.com/mviereck/x11docker). 
**Image Name**
```
ghcr.io/nkitsaini/x11-base:main
```
