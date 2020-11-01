#!/usr/bin/env bash

today=$(date +"%Y-%m-%d")
postpath="./_posts"

echo "Enter the title of the post"
read jekyllPost

echo "Type the tags (separated by spaces, multi-word tags separated by a hyphen)"
read postTags

blogFileNameSpaces="$today-$jekyllPost"
blogFileName=$(echo -e "$blogFileNameSpaces" | tr '[:upper:]' [:lower:] | tr '[:blank:]' - | tr -cd "[[:alnum:]-]")
jekyllPostQuote=$(echo '"'$jekyllPost'"')
postTagsCommas=$(echo -e $postTags | tr '[:blank:]' , )

echo "---
layout: post
title:  $jekyllPostQuote
date:   $today 09:00:00 +0200
banner_image: "$bannerImageName"
categories: "$postCategory"
tags: ["$postTagsCommas"]
---
" >> $postpath/"$blogFileName".md
