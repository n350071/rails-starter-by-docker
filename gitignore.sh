echo -e "\n" >> .gitignore

cat >> .gitignore << EOF
# OSX system file
.DS_Store
EOF

rm gitignore.sh