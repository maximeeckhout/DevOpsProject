echo "Compressing artifacts into one file"
zip -r artifacts.zip artifacts_folder

echo "Exporting token and enterprise api to enable github-release tool"
export GITHUB_TOKEN=$$$$$$$$$$$$
export GITHUB_API=https://git.{your domain}.com/api/v3 # needed only for enterprise

echo "Deleting release from github before creating new one"
github-release delete --user ${GITHUB_ORGANIZATION} --repo ${GITHUB_REPO} --tag ${VERSION_NAME}

echo "Creating a new release in github"
github-release release --user ${GITHUB_ORGANIZATION} --repo ${GITHUB_REPO} --tag ${VERSION_NAME} --name "${VERSION_NAME}"

echo "Uploading the artifacts into github"
github-release upload --user ${GITHUB_ORGANIZATION} --repo ${GITHUB_REPO} --tag ${VERSION_NAME} --name "${PROJECT_NAME}-${VERSION_NAME}.zip" --file artifacts.zip
