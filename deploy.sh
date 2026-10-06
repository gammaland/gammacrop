#!/bin/bash
# deploy.sh
# Safely clear and reconstruct the deploy directory for publishing.

echo "Reconstructing deploy/ directory..."

# Clean current deploy directory and recreate it
rm -rf deploy/*
mkdir -p deploy

# Copy standard files
cp index.html deploy/
cp favicon.png deploy/
cp favicon.ico deploy/
cp gl-brand-dark-72px.png deploy/
cp llms.txt deploy/
cp sitemap.xml deploy/
cp robots.txt deploy/
cp overspray-web.webp deploy/
cp tpu-mask.webp deploy/
cp 404.html deploy/

# /blog/ on the tool subdomain redirects to the main-site blog
mkdir -p deploy/blog
cp blog/index.html deploy/blog/

# Copy preview image as standardized og-image
cp picture-loaded.jpg deploy/og-image.jpg

# Copy changelog screenshots referenced from index.html
mkdir -p deploy/blog-pic
cp blog-pic/v1.9.1_before.jpg deploy/blog-pic/
cp blog-pic/v1.9.1_after.jpg deploy/blog-pic/

echo "Done! The 'deploy' directory is ready for publishing."
