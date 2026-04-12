@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo [1/2] 添加 userdb 到暂存区...
git add -f sync/73106f4e-97f1-45cc-906d-85bffaa7a534/rime_ice.userdb.txt

echo [2/2] 提交并推送...
git commit -m "chore: 同步 userdb 学习记录"
git push

echo.
echo 完成！按任意键退出
pause >nul
