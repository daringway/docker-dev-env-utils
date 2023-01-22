
1. Run build for applications for each version.
1. Each version is published
1. Once published, on S3 event trigger update the 
    Example:
    2.0.0
    2.1.3
    3.0.0
    3.0.1
    3.0.2 -> 3.0
    3.1.0
    3.1.2
    3.1.3
    3.1.4
    3.1.5 -> 3.1
    3.2.0
    3.2.1
    3.2.2 -> 3.2, 3, latest

On install update a install version record in repo
  version
  python 3.1.2
  node 16.3.2
  amplify latest
