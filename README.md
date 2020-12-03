# gh-action-phpcs

Github Action for PHPCS linting

This action will help you to run phpcs (PHP_CodeSniffer) with the [GitHub Actions](https://github.com/features/actions) platform. It also supports [annotations](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/about-status-checks#checks) out of the box.

This was based on the work of:

<https://github.com/chekalsky/phpcs-action>, <https://github.com/rtCamp/action-phpcs-code-review>, and this user https://github.com/navarr based on this pull request: <https://github.com/chekalsky/phpcs-action/pull/10>

To add this to your project please add the following code to a phpcs.yml file in your .github/workflows folder:

```yml
name: PHPCS check
### Trigger
on: pull_request

jobs:
  phpcs:
      name: PHPCS
      runs-on: ubuntu-latest
      steps:
        - uses: actions/checkout@v2
        - name: PHPCS check
          uses: alpha-global/gh-action-phpcs@v1
          with:
            only_changed_files: true
```

Release Notes:

@v1:

- There is no recogition of a local phpcs.xml file in the root of your project and the action is setup to either lint the entire project if "only_changed_files:" is set to false or only changed files if this is set to true.

@v1.1

- Added recognition of a local phpcs file in the root by changing the entrypoint.sh file to add the --standard=phpcs.xml - If you use this version and set the "only_changed_files_:" to true it will observe the local phpcs.xml file AND inspect any changed files outside of any folders set in the phpcs.xml. If you set this flag to false it will only observe what is listed in the root phpcs.xml root and will ignore files changed outside of directories defined here.

@v1.2 - Current
- Updated the base container to use php:7.3-alpine3.12 and removed the manual install of PHP reducing the container size from 203MB to 83.9MB

TODO:

- Currently nothing on the roadmap except for maybe updating to php:7.4-alpine3.12 at some point.

- Please submit a PR if you find something :)
