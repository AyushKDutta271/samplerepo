#!/bin/bash
if [ !git rev-parse --is-inside-work-tree >/dev/null 2>&1 ]; then
   echo "Error: the script should be run in a git repo!"
   exit 1
fi

if [ !command -v cline &>/dev/null ]; then
   echo "Cline not found! please install cline, using command $ npm install -g cline"
   exit 1
fi

COMMIT_DIFF=$(git show HEAD)
REVIEW_TYPE=${1:-general}

echo "--Starting AI code review!--"
echo "Reviewing latest changes for : $REVIEW_TYPE issues"
echo "This might take a moment as AI is thinking..."

echo "$COMMIT_DIFF" | cline -y "Review the code for $REVIEW_TYPE issues. Provide actionable feedback and suggestion improvements "

echo "--AI Review Complete"