#!/bin/bash

set -e

echo "--- :clock1: :clock2: running specs :clock3: :clock4:"
bundle install && bundle exec rspec

function inline_image {
    printf '\033]1338;url='"$1"';alt='"$2"'\a\n'
}

echo "+++ Done! :thumbsup: :shipit:"
inline_image "https://giftoppr.desktopprassets.com/uploads/f828c372186b5fa80a1c553adbcd4bc4d331396b/tumblr_m2cg550aq21ql201ao1_500.gif" "Yuss"
