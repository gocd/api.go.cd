API that notifies GoCD Server when a commit/push has been made in version control and GoCD needs to trigger relevant pipelines.

<aside class="notice">
    When using this feature, configure materials to <strong>Fetch updates to this repository only on webhook or manual trigger</strong> or disable <code>auto_update</code>/<code>autoUpdate</code> in cruise configuration, configuration repositories or via API for the relevant material.
</aside>
