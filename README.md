**Please do not create a Pull Request to this repository.**

**Build pipelines will automatically publish the application helm charts to this repository during the master build.**

------------------------------------------------------------------------------------------

# hmcts-charts
Repository to hold all the hmcts Helm charts

## Application config in flux

The process definining an application config in flux is stated [here](https://hmcts.github.io/ways-of-working/new-component/gitops-flux.html#application-config-in-flux)

## Helm-Operator charts sources

Helm-operator can use charts from 2 sources:
1. Container Registry

```
chart:
    repository: https://hmctspublic.azurecr.io/helm/v1/repo/
    name: aac-manage-case-assignment
    version: 0.0.5
```

2. Github

```
chart:
    git: git@github.com:hmcts/hmcts-charts
    ref: master
    path: stable/plum-recipe-backend
```

In case of github as a chart source, developers dont need to declare the version twice. This makes the process less error prone and require a single step to update charts to the application only as below.

1. [Application chart](https://github.com/hmcts/cnp-plum-recipes-service/blob/0e14064e6bbdc6cf2d8955452e699c93e580b84a/charts/plum-recipe-backend/Chart.yaml#L4)

The syntax in the cnp-flux-config would be:

``` 
chart:
  git: git@github.com:hmcts/hmcts-charts
  ref: master
  path: stable/plum-recipe-backend
```


To know more about how helm-operator uses github as its chart sources click on [helm-operator chart source](https://docs.fluxcd.io/projects/helm-operator/en/latest/helmrelease-guide/chart-sources/)

