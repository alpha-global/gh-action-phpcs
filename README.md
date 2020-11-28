# gh-action-phpcs
Github Action for PHPCS linting

This action will help you to run phpcs (PHP_CodeSniffer) with the [GitHub Actions](https://github.com/features/actions) platform. It also supports [annotations](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/about-status-checks#checks) out of the box.

This was based on the work of:

<https://github.com/chekalsky/phpcs-action> and <https://github.com/rtCamp/action-phpcs-code-review>

To add this to your project please add the following code to a phpcs.yml file in your .github/workflows folder at the root of your repository.

```
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
