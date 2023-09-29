import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkDown extends StatefulWidget {
  const MarkDown({super.key});

  @override
  State<MarkDown> createState() => _MarkDownState();
}

class _MarkDownState extends State<MarkDown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Markdown(
        data: data,
        selectable: true,
        // data: snapshot.data!,
        styleSheet: MarkdownStyleSheet(
          h1: TextStyle(color: Colors.green),
          h2: TextStyle(color: Colors.green),
          h3: TextStyle(color: Colors.purpleAccent),
          code: TextStyle(
            color: Colors.pinkAccent,
            backgroundColor: Colors.transparent,
          ),
          codeblockDecoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: Colors.black.withOpacity(0.2),
              width: 0.6,
            ),
          ),
        ),
      ),
      // body: FutureBuilder(
      //     future: rootBundle.loadString("/doc/README.md"),
      //     builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
      //       if (snapshot.hasData) {
      //         return Markdown(
      //           data: "## Cred Widget Library",
      //           // data: snapshot.data!,
      //           styleSheet: MarkdownStyleSheet(
      //             h1: TextStyle(color: Colors.green),
      //             h2: TextStyle(color: Colors.green),
      //             h3: TextStyle(color: Colors.purpleAccent),
      //             code: TextStyle(
      //               color: Colors.pinkAccent,
      //               backgroundColor: Colors.transparent,
      //             ),
      //             codeblockDecoration: BoxDecoration(
      //               color: Colors.grey.withOpacity(0.1),
      //               borderRadius: BorderRadius.circular(12.0),
      //               border: Border.all(
      //                 color: Colors.black.withOpacity(0.2),
      //                 width: 0.6,
      //               ),
      //             ),
      //           ),
      //         );
      //       }

      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }),
    );
  }
}

String data = """  


## Cred Widget Library

This is a JavaScript plugin that provides functionalities to create and interact with Cred widgets in a web page.

### Installation

To use the Cred Widget Library, include the following script tag in your HTML file:

```html
<script src="https://cred-widgets.appbuilder.platform.svmssandbox.net/credWidgetLibrary.js" id="cred-widget-script"></script>
```

### Usage

To create a Cred widget, call the `createWidget` function provided by the `CredWidgetLibrary` object. The `createWidget` function takes an object `data` as a parameter with the following properties:

for the three main widgets, `ChooseWorkflowListWidget`, `WorkflowFillUp`, and `WorkflowReview`:

## ChooseWorkflowListWidget Parameters

| Parameter      | Type   | Description                                    | Required |
|----------------|--------|------------------------------------------------|----------|
| firstName      | string | First name of the person                       | required |
| lastName       | string | Last name of the person                        | required |
| emailId        | string | Email ID of the person                         | required |
| phoneNo        | string | Phone number of the person                     | required |
| externalRefId  | string | External reference ID for the workflow list    | required |

## WorkflowFillUp Parameters

| Parameter      | Type   | Description                                    | Required |
|----------------|--------|------------------------------------------------|----------|
| invitationCode | string | Invitation code for the fill-up                | required |

## WorkflowView Parameters

| Parameter      | Type   | Description                                    | Required |
|----------------|--------|------------------------------------------------|----------|
| invitationCode | string | Invitation code for the review                 | required |

## WorkflowReview Parameters

| Parameter      | Type   | Description                                  | Required |
|----------------|--------|----------------------------------------------|----------|
| invitationCode | string | Invitation code for the review               | required |
| mode           | enum   | WorkflowReviewMode.review                    | optional |


## Example json

```json
{
  "view": "ChooseWorkflowList",
  "data": {
    "firstName": "Abc",
    "lastName": "Xyz",
    "emailId": "abc1.web@gmail.com",
    "phoneNo": "8888888881",
    "externalRefId": "test"
  },
  "auth": {
    "token": "your token"
  }
}
```

In the above example, we are using the `ChooseWorkflowList` view with the following parameters:

- `firstName`: The first name of the person (e.g., "Abc").
- `lastName`: The last name of the person (e.g., "Xyz").
- `emailId`: The email ID of the person (e.g., "abc1.web@gmail.com").
- `phoneNo`: The phone number of the person (e.g., "8888888881").
- `externalRefId`: The external reference ID for the workflow (e.g., "test").

To authenticate the user, we provide the following:

- `auth.token`: Your authentication token.

Please update the example with the actual values you intend to use in your implementation.

To handle events from the Cred widget, you can use the `onWorkflowSelected` function provided by the `credWidget` object returned from the `createWidget` function. Pass a callback function to `onWorkflowSelected` to handle the event.

Example event handling:

```javascript
credWidget.onWorkflowSelected((data) => {
  console.log("onWorkflowSelected ->", data);
});
```

### API Reference

#### `CredWidgetLibrary.createWidget(data)`

Creates a Cred widget with the specified data.

- `data`: An object containing the configuration data for the widget.

#### `CredWidgetLibrary.sendMessage(message)`

Sends a message to the Flutter application inside the widget.

- `message`: The message to be sent.

Color supports following format for theming: `rgb` `rrggbb` `aarrggbb` `#rgb` `#rrggbb` `#aarrggbb`
- `fontFamily`: Google font family to be used (e.g., "Montserrat").

---

Note: Make sure to replace `your_auth_token` in the code examples with the actual authentication token for your application.


### Full example of Html code including credwidgets libray 

```html

<!DOCTYPE html>
<html>

<head>
    <title>Cred Widget</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"></script>
    <style>
    body {
      margin: 0;
      padding: 0;
      background-color: rgb(228, 199, 199);
    }

    h1 {
      color: white;
      text-align: center;
      padding: 20px;
    }

    iframe {
      height: 50vh;
      width: 100%;
    }

    </style>

    <script src="https://cred-widgets.appbuilder.platform.svmssandbox.net/credWidgetLibrary.js", id="cred-widget-script"></script>
    <!--         <script src="http://localhost:55022/credWidgetLibrary.js", id="cred-widget-script"></script>-->

</head>

<body>
<script>
  function assignWF() {
    window.credWidget.assignWorkflow();
  }
    function initParams() {
      const credWidget = CredWidgetLibrary.createWidget(document.getElementById('model-flutter'), {
        "view": "ChooseWorkflowList",
        "data": {
          "firstName": "Tushar",
          "lastName": "Gabani",
          "emailId": "tushar.web.4@gmail.com",
          "phoneNo": "1111111114",
          "externalRefId": "test"
        },
          "chooseWorkflowListDecoration": {
            "dataLoadingIndicatorColor": "#000000",
            "dataLoadingIndicatorSize": 10,
            "tileDecoration": {
              "backgroundColor": "#000000",
              "titleStyle": {
                "fontFamily": "Montserrat",
                "fontSize": 18,
                "color": "#FFFFFF"
              },
              "activeRadioButtonColor": "#FFFFFF",
              "inActiveRadioButtonColor": "#FFFFFF",
              "expandedCollapsedIconColor": "#FFFFFF",
              "tileHeight" : 40
            },
            "childrenDecoration": {
              "backgroundColor": "#FFFFFF",
              "taskLoadingIndicatorColor": "#000000",
              "taskLoadingIndicatorSize": 15,
              "taskNameStyle": {
                "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#000000",
                  "fontWeight": "bold",
                  "letterSpacing" : 2
              }
            },
            "errorTextStyle": {
              "fontFamily": "Montserrat"
            },
            "noDataTextStyle": {
              "fontFamily": "Montserrat"
            }
          },
        "auth": {
          "token": "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJXeDlYaVRQY1dzazI5dE1DYjdURTJQZWljMkNjNldHS1pHSGRBYWlaemRNIn0.eyJleHAiOjE2OTMwNTA0ODYsImlhdCI6MTY5Mjk2NDA4NiwianRpIjoiNjFkYTY3YzYtOWVhNy00Zjc2LWE4MDMtOGE4NDQyN2FlYTEyIiwiaXNzIjoiaHR0cHM6Ly9pZGVudGl0eS1rZXljbG9hay5zdm1zc2FuZGJveC5uZXQvYXV0aC9yZWFsbXMvYXBwYnVpbGRlci1hdXRoIiwic3ViIjoiOWQ4ZjgxYWQtMWZjZi00Yzg5LWExMTItMzRhMzllNTMyN2MwIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiYXBwYnVpbGRlci1hdXRoLXNlcnZpY2UiLCJzZXNzaW9uX3N0YXRlIjoiMWQ4MWU0YjktYTc1Zi00YjQxLTk2NTYtNGZkZmUyOTE5ZTRmIiwiYWNyIjoiMSIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJvZmZsaW5lX2FjY2VzcyIsImNyZWRlbnRpYWxpbmcvSGlyYSBUaGFrdXIgUHZ0IEx0ZC1hZG1pbiIsInVtYV9hdXRob3JpemF0aW9uIiwiZGVmYXVsdC1yb2xlcy1hcHBidWlsZGVyLWF1dGgiLCJ1c2VyIiwiY3JlZGVudGlhbGluZy1wcmltYXJ5X2NvbnRhY3QiXX0sInJlc291cmNlX2FjY2VzcyI6eyJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6ImFwcGJ1aWxkZXItYXV0aCBldmVudC1zZXJ2aWNlIiwic2lkIjoiMWQ4MWU0YjktYTc1Zi00YjQxLTk2NTYtNGZkZmUyOTE5ZTRmIiwiZ3JvdXBzIjpbIi9jcmVkZW50aWFsaW5nL0hpcmEgVGhha3VyIFB2dCBMdGQiLCIvY3JlZGVudGlhbGluZyJdLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJoaXJhQGdtYWlsLmNvbSIsInJlZ2lvbiI6InVzX2Vhc3RfMSJ9.fnnkg33U1A6tQ9QhR_OwQJtslVZ-Cy8PZdvht_qJpHa3_bbwsxZDxqiVRxHMwyAEhhf5C2hwTw243VJ2mETVnUb5KrvGq_Yi22yBBgi-CqLnhjzwNaixm10mrlkdtXB95KC0kTGHQlP7KKiNJv9qd3ZKdOHTafKcv_bSZGm8eBK8gNGOkaRhi-NcVca_bITOdf3XpNau1b45WPZk2AWJFhCRLUvukAVo_M-fWYjeSkaZhdGi_F6JGafWukyL8OS54U60wyHjjrpXGonh_SV5BAf6KZbixc9tkPhcCZoY_IHg8T9NnPfJYzlv06_0OUc0oNavgODyPCJJJQRqPm1xeA",
        }
      })
      credWidget.onWorkflowAssigned((data) => {
        console.log("onWorkflowAssigned ->", data);
      });
      credWidget.onWorkflowSelected((data) => {
        console.log("onWorkflowSelected ->", data);
      });
      window.credWidget = credWidget;
    }

    function initParamsC2() {
      const credWidget = CredWidgetLibrary.createWidget(document.getElementById('inline-wrapper'), {

        "view": "WorkflowFillUp",

      "workflowFillUpDecoration": {
        "taskLoadingIndicatorColor": "#000000",
        "taskLoadingIndicatorSize": 15,
         "errorTextStyle": {
          "fontFamily": "Montserrat",
          "fontSize": 18,
          "color": "#000000",
          "fontWeight": "bold"
        },
         "noDataTextStyle": {
          "fontFamily": "Montserrat",
          "fontSize": 18,
          "color": "#000000",
          "fontWeight": "bold"
        },
        "workflowNameStyle": {
          "fontFamily": "Montserrat",
          "fontSize": 18,
          "color": "#000000",
          "fontWeight": "bold"
        },
        "bottomProgressBarDecoration": {
          "backgroundColor": "#ebedfd",
          "progressColor": "#000000",
          "stepsTextStyle": {
            "fontFamily": "Montserrat",
            "fontSize": 16,
            "color": "#000000"
          }
        },
        "bottomNavigationButtonsDecoration": {
          "backButtonDecoration": {
            "buttonText": "Back",
            "buttonCornerRadius": 12,
            "buttonBackgroundColor": "#000000",
            "buttonTextStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#FFFFFF"
            }
          },
          "nextButtonDecoration": {
            "buttonText": "Next",
            "buttonCornerRadius": 12,
            "buttonBackgroundColor": "#000000",
            "buttonProgressIndicatorColor": "#FFFFFF",
            "buttonTextStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#FFFFFF"
            }
          },
          "saveButtonDecoration": {
            "buttonText": "Save",
            "buttonCornerRadius": 12,
            "buttonBackgroundColor": "#000000",
            "buttonProgressIndicatorColor": "#FFFFFF",
            "buttonTextStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#FFFFFF"
            }
          },
          "skipButtonDecoration": {
            "buttonText": "Skip",
            "buttonCornerRadius": 12,
            "buttonBackgroundColor": "#FFFFFFFF",
            "buttonShadowColor": "#000000",
            "buttonTextStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#ebedfd"
            }
          }
        },
        "tasksDecoration": {
          "iconColor": "#000000",
          "taskTitleBackgroundColor": "#808080",
          "badgeColor": "#808080",
          "badgeStyle": {
            "fontFamily": "Montserrat",
            "fontSize": 16,
            "color": "#FFFFFF"
          },
          "taskTitleStyle": {
            "fontFamily": "Montserrat",
            "fontSize": 16,
            "color": "#FFFFFF"
          },
          "taskDescriptionStyle": {
            "fontFamily": "Montserrat",
            "fontSize": 16,
            "color": "#000000"
          },
          "signedButtonDecoration": {
            "buttonCornerRadius": 2,
            "buttonBackgroundColor": "#000000",
            "buttonTextStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#FFFFFF"
            }
          },
          "drawerMenuDecoration": {
            "saveButtonDecoration": {
              "buttonText": "Save",
              "buttonCornerRadius": 12,
              "buttonBackgroundColor": "#ebedfd",
              "buttonTextStyle": {
                "fontFamily": "Montserrat",
                "fontSize": 16,
                "color": "#6b6ba5"
              }
            },
            "cancelButtonDecoration": {
              "buttonText": "Save",
              "buttonCornerRadius": 12,
              "buttonBackgroundColor": "#ebedfd",
              "buttonTextStyle": {
                "fontFamily": "Montserrat",
                "fontSize": 16,
                "color": "#6b6ba5"
              }
            }
          },
          "tabularTypeDecoration": {
            "tableHeaderRowColor": "#000000",
            "tableDataRowColor": "#808080",
            "tableRowTextStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#FFFFFF"
            },
            "tableColumnTextStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#FFFFFF"
            },
            "tabularDeleteRowDialogDecoration": {
            "titleStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#000000"
            },
            "contentStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#000000"
            },
             "noButtonDecoration": {
              "buttonText": "No",
              "buttonCornerRadius": 12,
              "buttonBackgroundColor": "#ebedfd",
              "buttonTextStyle": {
                "fontFamily": "Montserrat",
                "fontSize": 16,
                "color": "#6b6ba5"
              }
            },
             "yesButtonDecoration": {
              "buttonText": "Yes",
              "buttonCornerRadius": 12,
              "buttonBackgroundColor": "#ebedfd",
              "buttonTextStyle": {
                "fontFamily": "Montserrat",
                "fontSize": 16,
                "color": "#6b6ba5"
              }
            }
            }
          },
          "radioButtonDecoration": {
            "checkedButtonColor": "#ebedfd",
            "unCheckedButtonColor": "#ebedfd",
            "textStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#6b6ba5"
            }
          },
          "checkBoxButtonDecoration": {
            "checkedButtonColor": "#ebedfd",
            "unCheckedButtonColor": "#ebedfd",
            "textStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#6b6ba5"
            }
          },
          "ratingTypeDecoration": {
            "size": 40,
            "activeRatingBackGroundColor": "#ebedfd",
            "inactiveRatingBackGroundColor": "#ebedfd",
            "activeRatingTextStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#6b6ba5"
            },
            "inactiveRatingTextStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#6b6ba5"
            }
          },
          "datePickerDecoration": {
            "calendarOverlayColor": "#ebedfd",
            "textFieldDecoration": {
              "borderColor": "#6b6ba5",
              "textStyle": {
                "fontFamily": "Montserrat",
                "fontSize": 16,
                "color": "#6b6ba5"
              }
            }
          },
          "dropDownDecoration": {
            "borderColor": "#ebedfd",
            "iconColor": "#ebedfd",
            "listItemBackgroundColor": "#ebedfd",
            "textStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#6b6ba5"
            },
            "listItemTextStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#6b6ba5"
            }
          },
          "textFieldDecoration": {
            "borderColor": "#ebedfd",
            "iconColor": "#ebedfd",
            "textStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#6b6ba5"
            },
            "labelStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#6b6ba5"
            },
            "hintStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#6b6ba5"
            },
            "errorStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#6b6ba5"
            }
          },
          "tileDecoration": {
            "backgroundColor": "#ebedfd",
            "expandedCollapsedIconColor": "#ebedfd",
            "titleStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#6b6ba5"
            }
          },
          "attachmentDecoration": {
            "calendarOverlayColor": "#ebedfd",
            "progressIndicatorColor": "#ebedfd",
            "iconColor": "#ebedfd",
            "borderColor": "#ebedfd",
            "titleStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#6b6ba5"
            },
            "contentStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#6b6ba5"
            }
          }
        }
      },

        "data": {
          "invitationCode": "3099514116"
        },
        "auth": {
          "token": "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJXeDlYaVRQY1dzazI5dE1DYjdURTJQZWljMkNjNldHS1pHSGRBYWlaemRNIn0.eyJleHAiOjE2OTMwNTA0ODYsImlhdCI6MTY5Mjk2NDA4NiwianRpIjoiNjFkYTY3YzYtOWVhNy00Zjc2LWE4MDMtOGE4NDQyN2FlYTEyIiwiaXNzIjoiaHR0cHM6Ly9pZGVudGl0eS1rZXljbG9hay5zdm1zc2FuZGJveC5uZXQvYXV0aC9yZWFsbXMvYXBwYnVpbGRlci1hdXRoIiwic3ViIjoiOWQ4ZjgxYWQtMWZjZi00Yzg5LWExMTItMzRhMzllNTMyN2MwIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiYXBwYnVpbGRlci1hdXRoLXNlcnZpY2UiLCJzZXNzaW9uX3N0YXRlIjoiMWQ4MWU0YjktYTc1Zi00YjQxLTk2NTYtNGZkZmUyOTE5ZTRmIiwiYWNyIjoiMSIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJvZmZsaW5lX2FjY2VzcyIsImNyZWRlbnRpYWxpbmcvSGlyYSBUaGFrdXIgUHZ0IEx0ZC1hZG1pbiIsInVtYV9hdXRob3JpemF0aW9uIiwiZGVmYXVsdC1yb2xlcy1hcHBidWlsZGVyLWF1dGgiLCJ1c2VyIiwiY3JlZGVudGlhbGluZy1wcmltYXJ5X2NvbnRhY3QiXX0sInJlc291cmNlX2FjY2VzcyI6eyJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6ImFwcGJ1aWxkZXItYXV0aCBldmVudC1zZXJ2aWNlIiwic2lkIjoiMWQ4MWU0YjktYTc1Zi00YjQxLTk2NTYtNGZkZmUyOTE5ZTRmIiwiZ3JvdXBzIjpbIi9jcmVkZW50aWFsaW5nL0hpcmEgVGhha3VyIFB2dCBMdGQiLCIvY3JlZGVudGlhbGluZyJdLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJoaXJhQGdtYWlsLmNvbSIsInJlZ2lvbiI6InVzX2Vhc3RfMSJ9.fnnkg33U1A6tQ9QhR_OwQJtslVZ-Cy8PZdvht_qJpHa3_bbwsxZDxqiVRxHMwyAEhhf5C2hwTw243VJ2mETVnUb5KrvGq_Yi22yBBgi-CqLnhjzwNaixm10mrlkdtXB95KC0kTGHQlP7KKiNJv9qd3ZKdOHTafKcv_bSZGm8eBK8gNGOkaRhi-NcVca_bITOdf3XpNau1b45WPZk2AWJFhCRLUvukAVo_M-fWYjeSkaZhdGi_F6JGafWukyL8OS54U60wyHjjrpXGonh_SV5BAf6KZbixc9tkPhcCZoY_IHg8T9NnPfJYzlv06_0OUc0oNavgODyPCJJJQRqPm1xeA",
        }
      })
      credWidget.onStatusChanged((data) => {
        console.log("onStatusChanged ->", data);
      });
      credWidget.onCompleted((data) => {
        console.log("onCompleted ->", data);
      });
    }
    function initParamsC3() {
      CredWidgetLibrary.createWidget(document.getElementById('inline-wrapper'), {
        "view": "WorkflowView",
        "data": {
          "invitationCode": "3099514116"
        },

        "workflowReviewDecoration": {
            "taskLoadingIndicatorColor": "#6b6ba5",
            "taskLoadingIndicatorSize": 15,
            "noDataTextStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#6b6ba5",
              "fontWeight": "bold"
            },
            "errorTextStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#6b6ba5",
              "fontWeight": "bold"
            },
            "workflowNameStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#6b6ba5",
              "fontWeight": "bold"
            },
            "previewWidgetDecoration": {
              "titleBackgroundColor": "#ebedfd",
              "titleTextStyle": {
                "fontFamily": "Montserrat",
                "fontSize": 16,
                "color": "#6b6ba5"
              },
              "borderColor": "#6b6ba5",
              "questionAndAnswerTypeDecoration": {
                "questionTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                },
                "answerTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                }
              },
              "tabularTypeDecoration": {
                "tableHeaderRowColor": "#000000",
                "tableDataRowColor": "#808080",
                "tableRowTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#FFFFFF"
                },
                "tableColumnTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#FFFFFF"
                }
              },
              "signedDocumentTypeDecoration": {
                "linkTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                }
              },
              "validityTypeDecoration": {
                "issueDateTitleStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                },
                "expiryDateTitleStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                },
                "expiryDateStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                },
                "issueDateStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                },
                "linkTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                }
              },
              "documentTypeDecoration": {
                "linkTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                }
              },
              "ratingTypeDecoration": {
                "size": 40,
                "activeRatingBackGroundColor": "#ebedfd",
                "inactiveRatingBackGroundColor": "#ebedfd",
                "activeRatingTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                },
                "inactiveRatingTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                }
              },
              "consentTypeDecoration": {
                "buttonDecoration": {
                  "buttonCornerRadius": 32,
                  "buttonBackgroundColor": "#ebedfd",
                  "buttonShadowColor": "#ebedfd",
                  "buttonTextStyle": {
                    "fontFamily": "Montserrat",
                    "fontSize": 16,
                    "color": "#6b6ba5"
                  }
                },
                "agreementTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                },
                "agreementTitleTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                }
              },
              "reviewButtonsDecoration": {
                "acceptButtonDecoration": {
                  "buttonCornerRadius": 32,
                  "buttonBackgroundColor": "#ebedfd",
                  "buttonShadowColor": "#ebedfd",
                  "buttonTextStyle": {
                    "fontFamily": "Montserrat",
                    "fontSize": 16,
                    "color": "#6b6ba5"
                  }
                },
                "rejectButtonDecoration": {
                  "buttonCornerRadius": 32,
                  "buttonBackgroundColor": "#ebedfd",
                  "buttonShadowColor": "#ebedfd",
                  "buttonTextStyle": {
                    "fontFamily": "Montserrat",
                    "fontSize": 16,
                    "color": "#6b6ba5"
                  }
                }
              }
            }
          },

        "auth": {
          "token":  "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJXeDlYaVRQY1dzazI5dE1DYjdURTJQZWljMkNjNldHS1pHSGRBYWlaemRNIn0.eyJleHAiOjE2OTMwNTA0ODYsImlhdCI6MTY5Mjk2NDA4NiwianRpIjoiNjFkYTY3YzYtOWVhNy00Zjc2LWE4MDMtOGE4NDQyN2FlYTEyIiwiaXNzIjoiaHR0cHM6Ly9pZGVudGl0eS1rZXljbG9hay5zdm1zc2FuZGJveC5uZXQvYXV0aC9yZWFsbXMvYXBwYnVpbGRlci1hdXRoIiwic3ViIjoiOWQ4ZjgxYWQtMWZjZi00Yzg5LWExMTItMzRhMzllNTMyN2MwIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiYXBwYnVpbGRlci1hdXRoLXNlcnZpY2UiLCJzZXNzaW9uX3N0YXRlIjoiMWQ4MWU0YjktYTc1Zi00YjQxLTk2NTYtNGZkZmUyOTE5ZTRmIiwiYWNyIjoiMSIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJvZmZsaW5lX2FjY2VzcyIsImNyZWRlbnRpYWxpbmcvSGlyYSBUaGFrdXIgUHZ0IEx0ZC1hZG1pbiIsInVtYV9hdXRob3JpemF0aW9uIiwiZGVmYXVsdC1yb2xlcy1hcHBidWlsZGVyLWF1dGgiLCJ1c2VyIiwiY3JlZGVudGlhbGluZy1wcmltYXJ5X2NvbnRhY3QiXX0sInJlc291cmNlX2FjY2VzcyI6eyJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6ImFwcGJ1aWxkZXItYXV0aCBldmVudC1zZXJ2aWNlIiwic2lkIjoiMWQ4MWU0YjktYTc1Zi00YjQxLTk2NTYtNGZkZmUyOTE5ZTRmIiwiZ3JvdXBzIjpbIi9jcmVkZW50aWFsaW5nL0hpcmEgVGhha3VyIFB2dCBMdGQiLCIvY3JlZGVudGlhbGluZyJdLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJoaXJhQGdtYWlsLmNvbSIsInJlZ2lvbiI6InVzX2Vhc3RfMSJ9.fnnkg33U1A6tQ9QhR_OwQJtslVZ-Cy8PZdvht_qJpHa3_bbwsxZDxqiVRxHMwyAEhhf5C2hwTw243VJ2mETVnUb5KrvGq_Yi22yBBgi-CqLnhjzwNaixm10mrlkdtXB95KC0kTGHQlP7KKiNJv9qd3ZKdOHTafKcv_bSZGm8eBK8gNGOkaRhi-NcVca_bITOdf3XpNau1b45WPZk2AWJFhCRLUvukAVo_M-fWYjeSkaZhdGi_F6JGafWukyL8OS54U60wyHjjrpXGonh_SV5BAf6KZbixc9tkPhcCZoY_IHg8T9NnPfJYzlv06_0OUc0oNavgODyPCJJJQRqPm1xeA",
        }
      })
    }
      function initParamsC4() {
      CredWidgetLibrary.createWidget(document.getElementById('inline-wrapper'), {
        "view": "WorkflowReview",
        "data": {
          "invitationCode": "3099514116"
        },

        "workflowReviewDecoration": {
            "taskLoadingIndicatorColor": "#6b6ba5",
            "taskLoadingIndicatorSize": 15,
            "noDataTextStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#6b6ba5",
              "fontWeight": "bold"
            },
            "errorTextStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#6b6ba5",
              "fontWeight": "bold"
            },
            "workflowNameStyle": {
              "fontFamily": "Montserrat",
              "fontSize": 16,
              "color": "#6b6ba5",
              "fontWeight": "bold"
            },
            "previewWidgetDecoration": {
              "titleBackgroundColor": "#ebedfd",
              "titleTextStyle": {
                "fontFamily": "Montserrat",
                "fontSize": 16,
                "color": "#6b6ba5"
              },
              "borderColor": "#6b6ba5",
              "questionAndAnswerTypeDecoration": {
                "questionTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                },
                "answerTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                }
              },
              "tabularTypeDecoration": {
                "tableHeaderRowColor": "#000000",
                "tableDataRowColor": "#808080",
                "tableRowTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#FFFFFF"
                },
                "tableColumnTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#FFFFFF"
                }
              },
              "signedDocumentTypeDecoration": {
                "linkTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                }
              },
              "validityTypeDecoration": {
                "issueDateTitleStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                },
                "expiryDateTitleStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                },
                "expiryDateStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                },
                "issueDateStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                },
                "linkTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                }
              },
              "documentTypeDecoration": {
                "linkTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                }
              },
              "ratingTypeDecoration": {
                "size": 40,
                "activeRatingBackGroundColor": "#ebedfd",
                "inactiveRatingBackGroundColor": "#ebedfd",
                "activeRatingTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                },
                "inactiveRatingTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                }
              },
              "consentTypeDecoration": {
                "buttonDecoration": {
                  "buttonCornerRadius": 32,
                  "buttonBackgroundColor": "#ebedfd",
                  "buttonShadowColor": "#ebedfd",
                  "buttonTextStyle": {
                    "fontFamily": "Montserrat",
                    "fontSize": 16,
                    "color": "#6b6ba5"
                  }
                },
                "agreementTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                },
                "agreementTitleTextStyle": {
                  "fontFamily": "Montserrat",
                  "fontSize": 16,
                  "color": "#6b6ba5"
                }
              },
              "reviewButtonsDecoration": {
                "acceptButtonDecoration": {
                  "buttonCornerRadius": 32,
                  "buttonBackgroundColor": "#ebedfd",
                  "buttonShadowColor": "#ebedfd",
                  "buttonTextStyle": {
                    "fontFamily": "Montserrat",
                    "fontSize": 16,
                    "color": "#6b6ba5"
                  }
                },
                "rejectButtonDecoration": {
                  "buttonCornerRadius": 32,
                  "buttonBackgroundColor": "#ebedfd",
                  "buttonShadowColor": "#ebedfd",
                  "buttonTextStyle": {
                    "fontFamily": "Montserrat",
                    "fontSize": 16,
                    "color": "#6b6ba5"
                  }
                }
              }
            }
          },

        "auth": {
          "token":  "eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJXeDlYaVRQY1dzazI5dE1DYjdURTJQZWljMkNjNldHS1pHSGRBYWlaemRNIn0.eyJleHAiOjE2OTMwNTA0ODYsImlhdCI6MTY5Mjk2NDA4NiwianRpIjoiNjFkYTY3YzYtOWVhNy00Zjc2LWE4MDMtOGE4NDQyN2FlYTEyIiwiaXNzIjoiaHR0cHM6Ly9pZGVudGl0eS1rZXljbG9hay5zdm1zc2FuZGJveC5uZXQvYXV0aC9yZWFsbXMvYXBwYnVpbGRlci1hdXRoIiwic3ViIjoiOWQ4ZjgxYWQtMWZjZi00Yzg5LWExMTItMzRhMzllNTMyN2MwIiwidHlwIjoiQmVhcmVyIiwiYXpwIjoiYXBwYnVpbGRlci1hdXRoLXNlcnZpY2UiLCJzZXNzaW9uX3N0YXRlIjoiMWQ4MWU0YjktYTc1Zi00YjQxLTk2NTYtNGZkZmUyOTE5ZTRmIiwiYWNyIjoiMSIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJvZmZsaW5lX2FjY2VzcyIsImNyZWRlbnRpYWxpbmcvSGlyYSBUaGFrdXIgUHZ0IEx0ZC1hZG1pbiIsInVtYV9hdXRob3JpemF0aW9uIiwiZGVmYXVsdC1yb2xlcy1hcHBidWlsZGVyLWF1dGgiLCJ1c2VyIiwiY3JlZGVudGlhbGluZy1wcmltYXJ5X2NvbnRhY3QiXX0sInJlc291cmNlX2FjY2VzcyI6eyJhY2NvdW50Ijp7InJvbGVzIjpbIm1hbmFnZS1hY2NvdW50IiwibWFuYWdlLWFjY291bnQtbGlua3MiLCJ2aWV3LXByb2ZpbGUiXX19LCJzY29wZSI6ImFwcGJ1aWxkZXItYXV0aCBldmVudC1zZXJ2aWNlIiwic2lkIjoiMWQ4MWU0YjktYTc1Zi00YjQxLTk2NTYtNGZkZmUyOTE5ZTRmIiwiZ3JvdXBzIjpbIi9jcmVkZW50aWFsaW5nL0hpcmEgVGhha3VyIFB2dCBMdGQiLCIvY3JlZGVudGlhbGluZyJdLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJoaXJhQGdtYWlsLmNvbSIsInJlZ2lvbiI6InVzX2Vhc3RfMSJ9.fnnkg33U1A6tQ9QhR_OwQJtslVZ-Cy8PZdvht_qJpHa3_bbwsxZDxqiVRxHMwyAEhhf5C2hwTw243VJ2mETVnUb5KrvGq_Yi22yBBgi-CqLnhjzwNaixm10mrlkdtXB95KC0kTGHQlP7KKiNJv9qd3ZKdOHTafKcv_bSZGm8eBK8gNGOkaRhi-NcVca_bITOdf3XpNau1b45WPZk2AWJFhCRLUvukAVo_M-fWYjeSkaZhdGi_F6JGafWukyL8OS54U60wyHjjrpXGonh_SV5BAf6KZbixc9tkPhcCZoY_IHg8T9NnPfJYzlv06_0OUc0oNavgODyPCJJJQRqPm1xeA",
        }
      })
    }


</script>


<!-- Button trigger modal -->
<button onclick="initParams()" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">
    Choose WorkFlow
</button>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body p-2" id="model-flutter">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                </button>
                <button type="button" class="btn btn-primary" onclick="assignWF()">Assign</button>
            </div>
        </div>
    </div>
</div>
<button onclick="initParamsC2()">Workflow FillUp (Customer facing)</button>
<button onclick="initParamsC3()">Workflow view</button>
<button onclick="initParamsC4()">Workflow review</button>

<div id="inline-wrapper"></div>
</body>

</html>

```

""";
