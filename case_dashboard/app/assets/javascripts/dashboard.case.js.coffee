app = angular.module 'dashboard.case', []

app.factory 'Case', ($resource) ->
  $resource '/api/cases/:id', { id: '@id' }, { update: { method: 'PUT', isArray: false } }

app.controller 'CasesController', ($scope) ->
  Case.query {}, (cases) ->
    $scope.cases = cases

  # $scope.cases = {
  #   "total_entries": 2,
  #   "_links": {
  #     "self": {
  #       "href": "/api/v2/cases?page=1&per_page=30",
  #       "class": "page"
  #     },
  #     "first": {
  #       "href": "/api/v2/cases?page=1&per_page=30",
  #       "class": "page"
  #     },
  #     "last": {
  #       "href": "/api/v2/cases?page=1&per_page=30",
  #       "class": "page"
  #     },
  #     "next": null,
  #     "previous": null
  #   },
  #   "_embedded": {
  #     "entries": [
  #       {
  #         "external_id": null,
  #         "subject": "Welcome",
  #         "priority": 5,
  #         "locked_until": null,
  #         "description": null,
  #         "status": "new",
  #         "type": "email",
  #         "language": "en_us",
  #         "created_at": "2013-12-06T21:37:01Z",
  #         "updated_at": "2013-12-06T21:42:01Z",
  #         "active_at": "2013-12-06T21:42:01Z",
  #         "received_at": "2013-12-06T21:37:01Z",
  #         "first_opened_at": "2013-12-06T21:38:01Z",
  #         "opened_at": "2013-12-06T21:39:01Z",
  #         "first_resolved_at": "2013-12-06T21:42:01Z",
  #         "resolved_at": "2013-12-06T21:42:01Z",
  #         "custom_fields": {
  #           "level": "vip"
  #         },
  #         "_links": {
  #           "self": {
  #             "href": "/api/v2/cases/1",
  #             "class": "case"
  #           },
  #           "message": {
  #             "href": "/api/v2/cases/1/message",
  #             "class": "message"
  #           },
  #           "customer": {
  #             "href": "/api/v2/customers/1",
  #             "class": "customer"
  #           },
  #           "assigned_user": {
  #             "href": "/api/v2/users/2",
  #             "class": "user"
  #           },
  #           "assigned_group": {
  #             "href": "/api/v2/groups/1",
  #             "class": "group"
  #           },
  #           "locked_by": null
  #         }
  #       },
  #       {
  #         "external_id": null,
  #         "subject": "Help Please!",
  #         "priority": 5,
  #         "locked_until": null,
  #         "description": null,
  #         "status": "new",
  #         "type": "email",
  #         "language": "en_us",
  #         "created_at": "2013-12-06T21:37:01Z",
  #         "updated_at": "2013-12-06T21:42:01Z",
  #         "active_at": "2013-12-06T21:42:01Z",
  #         "received_at": "2013-12-06T21:37:01Z",
  #         "first_opened_at": "2013-12-06T21:38:01Z",
  #         "opened_at": "2013-12-06T21:39:01Z",
  #         "first_resolved_at": "2013-12-06T21:42:01Z",
  #         "resolved_at": "2013-12-06T21:42:01Z",
  #         "custom_fields": {
  #           "level": "vip"
  #         },
  #         "_links": {
  #           "self": {
  #             "href": "/api/v2/cases/2",
  #             "class": "case"
  #           },
  #           "message": {
  #             "href": "/api/v2/cases/1/message",
  #             "class": "message"
  #           },
  #           "customer": {
  #             "href": "/api/v2/customers/1",
  #             "class": "customer"
  #           },
  #           "assigned_user": {
  #             "href": "/api/v2/users/2",
  #             "class": "user"
  #           },
  #           "assigned_group": {
  #             "href": "/api/v2/groups/1",
  #             "class": "group"
  #           },
  #           "locked_by": null
  #         }
  #       }
  #     ]
  #   }
  # }

  $scope.labels = {
    "total_entries": 2,
    "_links": {
      "self": {
        "href": "/api/v2/labels?page=1&per_page=30",
        "class": "page"
      },
      "first": {
        "href": "/api/v2/labels?page=1&per_page=30",
        "class": "page"
      },
      "last": {
        "href": "/api/v2/labels?page=1&per_page=30",
        "class": "page"
      },
      "next": null,
      "previous": null
    },
    "_embedded": {
      "entries": [
        {
          "name": "MyLabel",
          "description": "My Label Description",
          "types": [
            "case",
            "macro"
          ],
          "active": true,
          "color": "green",
          "position": 1,
          "_links": {
            "self": {
              "href": "/api/v2/labels/1",
              "class": "label"
            }
          }
        },
        {
          "name": "Another Label",
          "description": "Label Description",
          "types": [
            "case",
            "macro"
          ],
          "active": true,
          "color": "green",
          "position": 2,
          "_links": {
            "self": {
              "href": "/api/v2/labels/2",
              "class": "label"
            }
          }
        }
      ]
    }
  }