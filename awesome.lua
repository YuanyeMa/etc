--下面这段代码开启awesome下gnome-networkmanage的支持，
--使用方法：直接加入 /etc/xdg/awesome/rc.lua或者家目录下的awesome配置文件尾部
function run_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
    findme = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

run_once("nm-applet")
